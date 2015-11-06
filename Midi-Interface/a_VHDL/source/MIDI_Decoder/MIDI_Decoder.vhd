-- ********************************************************************************
-- File:	MDID_Decoder.vhd
-- Author:	weii
-- Date:	22.01.2014
-- Beschreibung:
-- Der MIDI Decoder erkennt aus einem Byte-Stream Tastendruckbefehle und stellt die
-- entsprechende Taste am Ausgang zur Verfügung. Sobald gültige Daten am Ausgang
-- anliegen, ist das Signal noteEN für einen Taktzyklus auf '1'. 
-- ********************************************************************************

LIBRARY IEEE;
USE IEEE.std_logic_1164.all;
USE IEEE.numeric_std.all;

ENTITY MIDIDecoder IS
	GENERIC(CHANNEL		: natural := 0 );		-- MIDI Kanal ( 0-15 )
	PORT(	clk			: IN std_logic;			-- Systemclock
			reset_n		: IN std_logic;			-- Systemreset (Low aktiv)
			dataEN		: IN std_logic;			-- Enable der Inputdaten
			data		: IN std_logic_vector( 7 DOWNTO 0 );	-- Inputdaten
			noteOnOff	: OUT std_logic;		-- '0': Taste aus, '1' Taste ein
			noteEN		: OUT std_logic;		-- Gültige Werte am Ausgang
			note		: OUT std_logic_vector( 6 DOWNTO 0 ) );	-- Gedrückte Taste
END MIDIDecoder;

ARCHITECTURE rtl OF MIDIDecoder IS

TYPE	fsm_states IS ( IDLE, NOTE_OFF, NOTE_ON, NOTE_RECEIVED, VELOCITY_RECEIVED );
SIGNAL	state		: fsm_states;
SIGNAL	next_state	: fsm_states;

SIGNAL	note_geg, note_folge			: std_logic_vector( 6 DOWNTO 0 );
SIGNAL	v_geg, v_folge					: std_logic_vector( 7 DOWNTO 0 );
SIGNAL	cmd_geg, cmd_folge				: unsigned( 3 DOWNTO 0 );
SIGNAL	ch_geg, ch_folge				: std_logic_vector( 3 DOWNTO 0 );
SIGNAL	noteEN_geg, noteEN_folge,
		noteOnOff_geg, noteOnOff_folge	: std_logic;

BEGIN
		PStateMachine : PROCESS( state, dataEN, data, cmd_geg, note_geg, v_geg, noteOnOff_geg, ch_geg )
		BEGIN
			CASE state IS
				WHEN IDLE =>
					-- Den Zustand nur wechseln, wenn gültige Daten aliegen
					IF dataEN = '1' THEN
						IF data( 7 downto 4 ) = "1000" THEN		-- Note ausschalten
							next_state <= NOTE_OFF;
						ELSIF data( 7 downto 4 ) = "1001" THEN	-- Note einschalten
							next_state <= NOTE_ON;
						ELSIF data( 7 ) = '0' THEN 				-- Nächste Note ohne Befehl (Fast Mode)
							next_state <= NOTE_RECEIVED;
						ELSE
							next_state <= state;				-- Sonst im Idle bleiben
						END IF;
					ELSE
						next_state <= state;
					END IF;
					
				
				WHEN NOTE_OFF =>
					-- Den Zustand nur wechseln, wenn gültige Daten aliegen
					IF dataEN = '1' THEN
						next_state <= NOTE_RECEIVED;
					ELSE
						next_state <= state;
					END IF;
					
				
				WHEN NOTE_ON =>
					-- Den Zustand nur wechseln, wenn gültige Daten aliegen
					IF dataEN = '1' THEN
						next_state <= NOTE_RECEIVED;
					ELSE
						next_state <= state;
					END IF;
					
				
				WHEN NOTE_RECEIVED =>
					-- Den Zustand nur wechseln, wenn gültige Daten aliegen
					IF dataEN = '1' THEN
						next_state <= VELOCITY_RECEIVED;
					ELSE
						next_state <= state;
					END IF;
					
				
				WHEN VELOCITY_RECEIVED =>
					-- Den Zustand direkt wechseln: Löscht noteEn wieder
					next_state <= IDLE;
					
				
				WHEN OTHERS => next_state <= IDLE;
			END CASE;
		END PROCESS;
		
		PNote : PROCESS( state, data, note_geg )
		BEGIN
			CASE state IS
				WHEN IDLE =>
					-- Falls mehrere Noten hintereinander, Daten direkt in Noten speichern,
					-- weil Note_ON oder NOTE_OFF nicht gesendet wird
					IF data( 7 ) = '0' THEN
						note_folge <= data( 6 DOWNTO 0 );
					ELSE
						note_folge <= note_geg;
					END IF;
				
				WHEN NOTE_OFF | NOTE_ON =>
					note_folge <= data( 6 DOWNTO 0 );
					
				WHEN OTHERS => 
					-- Note speichern
					note_folge <= note_geg;
			END CASE;
		END PROCESS;
		
		PVelocity : PROCESS( state, data, v_geg )
		BEGIN
			CASE state IS
				WHEN NOTE_RECEIVED =>
					v_folge <= data;
					
				WHEN OTHERS => 
					-- Geschwindigkeit speichern
					v_folge <= v_geg;
			END CASE;
		END PROCESS;
		
		PChannel : PROCESS( state, data, ch_geg, dataEN )
		BEGIN
			CASE state IS
				WHEN IDLE =>
					-- Falls nicht mehrere Noten hintereinander, neuer Kanal übernehmen
					IF dataEN = '1' AND data( 7 ) = '1' THEN
						ch_folge <= data( 3 DOWNTO 0 );
					ELSE
						ch_folge <= ch_geg;
					END IF;
					
				WHEN OTHERS => 
					-- Kanal speichern
					ch_folge <= ch_geg;
			END CASE;
		END PROCESS;
		
		PCommand : PROCESS( state, data, cmd_geg, dataEN )
		BEGIN
			CASE state IS
				WHEN IDLE =>
					IF dataEN = '1' AND data( 7 ) = '1' THEN
						-- Falls ein Steuerzeichen kommt, Befehl löschen
						cmd_folge <= to_unsigned( 0, 4 );
					ELSE
						-- Befehl speichern
						cmd_folge <= cmd_geg;
					END IF;
					
				WHEN NOTE_ON =>
					cmd_folge <= to_unsigned( 9, 4 );
				
				WHEN NOTE_OFF =>
					cmd_folge <= to_unsigned( 8, 4 );
					
				WHEN OTHERS => 
					-- Befehl speichern
					cmd_folge <= cmd_geg;
			END CASE;
		END PROCESS;
		
		PNoteOnOff : PROCESS( state, data, noteOnOff_geg, cmd_geg )
		BEGIN
			CASE state IS
				WHEN NOTE_RECEIVED =>
					-- Velocity = 0 bedeutet, dass die Taste losgelassen wurde.
					IF data = "00000000" THEN
						noteOnOff_folge <= '0';
					ELSE
						noteOnOff_folge <= cmd_geg( 0 );
					END IF;
					
				WHEN OTHERS => 
					-- Note Ein/Aus speichern
					noteOnOff_folge <= noteOnOff_geg;
			END CASE;
		END PROCESS;
		
		PNoteEN : PROCESS( state, ch_geg )
		BEGIN
			CASE state IS
				WHEN VELOCITY_RECEIVED =>
					-- Bei falschem Kanal nicht enablen
					IF ch_geg = std_logic_vector( to_unsigned( CHANNEL, ch_geg'LENGTH ) ) THEN
						noteEN_folge <= '1';
					ELSE
						noteEN_folge <= '0';
					END IF;
					
				WHEN OTHERS => 
					-- Note Ein/Aus speichern
					noteEN_folge <= '0';
			END CASE;
		END PROCESS;
		
		
		
		ff : PROCESS( clk, reset_n )
		BEGIN
			-- Resetten der Signale
			IF reset_n = '0' THEN
				state <= IDLE;
				note_geg <= ( OTHERS => '0' );
				v_geg <= ( OTHERS => '0' );
				cmd_geg <= to_unsigned( 0, 4 );
				noteEN_geg <= '0';
				noteOnOFf_geg <= '0';
				ch_geg <= ( OTHERS => '0' );
				
			ELSIF clk'EVENT AND clk = '1' THEN
				state <= next_state;
				note_geg <= note_folge;
				v_geg <= v_folge;
				cmd_geg <= cmd_folge;
				noteEN_geg <= noteEN_folge;
				noteOnOff_geg <= noteOnOff_folge;
				ch_geg <= ch_folge;
			END IF;
		END PROCESS ff;
		
		-- Output Zuweisung
		note <= note_geg;
		noteOnOff <= noteOnOff_geg;
		noteEN <= noteEN_geg;
END rtl;


