-------------------------------------------------------------------------------
-- Project     : audio_top
-- Description : look up tabelle fuer diverse Melodien
--
--
-------------------------------------------------------------------------------
--
-- Change History
-- Date     |Name      |Modification
------------|----------|-------------------------------------------------------
-- 12.04.13 | hersmic  | 
-- 15.05.13 | bleispiu | Anpassung Melodie fuer Elise, layout
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
-- package  Declaration
-------------------------------------------------------------------------------
-- 
--   use music_list.all;
-------------------------------------------------------------------------------
library ieee;
  use ieee.std_logic_1164.all;
  use ieee.numeric_std.all;
 
library work;
use work.tone_gen_pkg.all;

package music_list is

	-------------------------------------------------------------------------------
	-- constant Declaration
	-------------------------------------------------------------------------------
    constant x			:				natural :=1;
	constant v			:				natural :=2;
	constant e			:				natural	:=2;
    constant paus		:				std_logic_vector(N_CUM-1 downto 0) := (others =>'0');
	-------------------------------------------------------------------------------
	-- type Declaration
	-------------------------------------------------------------------------------
  

	type stuck				is array (0 to 100) of std_logic_vector(N_CUM-1 downto 0);
	type lange				is array (0 to 95) of integer;
	type stuck_overture		is array (0 to 268) of std_logic_vector(N_CUM-1 downto 0);
	type laenge_overture	is array (0 to 266) of integer;
	type stuck_tom_dooley	is array (0 to 104) of std_logic_vector(N_CUM-1 downto 0);
	type lange_tom_dooley	is array (0 to 104) of integer;
	type stuck_fuer_elise	is array (0 to 348) of std_logic_vector(N_CUM-1 downto 0);
	type lange_fuer_elise	is array (0 to 348) of integer;
	
	--datentyp std_logic_vector!!!
	constant Nachtmusik_hoehe : stuck :=(
   paus, M_SOL_G4, paus, M_RE_D4, paus, M_SOL_G4, paus, M_RE_D4, paus,  M_SOL_G4, paus, M_RE_D4, paus, M_SOL_G4, paus, M_SI_B4, paus, H_RE_D5, paus , H_DO_C5, paus , M_LA_A4, paus, H_DO_C5 , paus, M_LA_A4 , paus, H_DO_C5, paus, M_LA_A4, paus, M_FAS_F4S,paus,  M_LA_A4,paus,  M_RE_D4, paus,
	M_SOL_G4,paus, M_SOL_G4, paus, M_SI_B4, M_LA_A4, M_SOL_G4, paus , M_SOL_G4, M_FAS_F4S,paus, M_FAS_F4S, M_LA_A4, H_DO_C5,M_FAS_F4S, paus , M_LA_A4, M_SOL_G4, paus, M_SOL_G4, paus, M_SI_B4,M_LA_A4, paus, M_SOL_G4, paus,  M_SOL_G4, M_FAS_F4S,paus, M_FAS_F4S, M_LA_A4, H_DO_C5,M_FAS_F4S,
 --1-------------1,5-------------2--------------------------------------3----------------3,5-------------4-----------------4,5---------------
  M_SOL_G4, paus, M_SOL_G4, paus, M_SOL_G4, M_FAS_F4S, M_MI_E4, M_FAS_F4S, M_SOL_G4, paus, M_SOL_G4, paus, M_SI_B4, M_LA_A4, M_SOL_G4, M_LA_A4,     
 --1------------1,5------------2------------------------------------3-------4-----
  M_SI_B4, paus, M_SI_B4, paus, H_RE_D5, H_DO_C5, M_SI_B4, H_DO_C5, H_RE_D5, paus,    
   paus , paus, paus, paus, paus  );
	
	-- datentyp integer!!
	constant Nachtmusik_laenge: lange :=(
	
	--1-2------------3-----4------------1----------------2--------------3-----4---1----2------------3----4-----------1----------------2---------------3---4----
	8*v, 4*v, 3*v, v, 8*v, 4*v, 3*v, v, 3*v, v,  3*v, v, 3*v, v, 3*v, v, 8*v, 8*v, 8*v, 4*v, 3*v, v, 8*v, 4*v, 3*v,v, 3*v, v, 3*v, v, 3*v, v, 3*v, v, 8*v, 8*v, 
	--1-----2--------3---------4------------1----------2-------3------------4------------1---2---------3---------------4-----------1-2---------3-----------4---------------
	4*v,4*v, 11*v, v, 4*v, 4*v,3*v,  v, 4*v, 3*v, v, 12*v, 4*v, 4*v, 3*v, v, 4*v, 3*v, v, 11*v, v, 4*v, 3*v, v, 3*v, v,4*v, 3*v, v, 12*v, 4*v, 4*v, 3*v,3*v, v, 3*v, v,  
	--1--------------2------------------3-------3,5-----4------------------
    2*v, 2*v, 2*v, 2*v,3*v, v, 3*v, v, 2*v, 2*v, 2*v, 2*v,
    --1-------------2--------------------3--
    3*v, v, 3*v, v, 2*v, 2*v, 2*v, 2*v, 8*v, 8*v,   	
 0 );    
    -------------------------------------------------------------------------------
	
	
	
	
	--datentyp std_logic_vector!!!
	constant overture_hoehe : stuck_overture :=(
    paus, M_SOL_G4, paus, M_DO_C5, paus, H_RE_D5, paus, H_MI_E5, paus, H_RE_D5, paus, M_DO_C5, paus, H_RE_D5, paus, H_MI_E5, paus, M_DO_C5, paus, M_DO_C5, paus,									--1
		  M_SOL_G4, paus, M_DO_C5, paus, H_RE_D5, paus, H_MI_E5, paus, H_RE_D5, paus, M_DO_C5, paus, H_RE_D5, paus, H_MI_E5, paus, M_DO_C5, paus, M_DO_C5, paus,									--2
		  M_LA_A4, paus, H_RE_D5, paus, H_MI_E5, paus, H_RE_D5, paus, M_LA_A4, paus, M_FA_F4, paus, M_LA_A4, paus, H_RE_D5, paus, M_LA_A4, paus, M_FA_F4, paus, M_LA_A4, paus, H_RE_D5, paus,		--3
		  M_SOL_G4, paus, M_DO_C5, paus, H_RE_D5, paus, M_DO_C5, paus, M_SOL_G4, paus, M_MI_E4, paus, M_SOL_G4, paus, M_DO_C5, paus, M_SOL_G4, paus, M_MI_E4, paus, M_SOL_G4, paus, M_DO_C5, paus,	--4
		  M_SOL_G4, paus, M_DO_C5, paus, H_RE_D5, paus, H_MI_E5, paus, H_RE_D5, paus, M_DO_C5, paus, H_RE_D5, paus, H_MI_E5, paus, M_DO_C5, paus, M_DO_C5, paus,									--5
		  M_SOL_G4, paus, M_DO_C5, paus, H_RE_D5, paus, H_MI_E5, paus, H_RE_D5, paus, M_DO_C5, paus, H_RE_D5, paus, H_MI_E5, paus, M_DO_C5, paus, M_DO_C5, paus,									--6
		  M_LA_A4, paus, H_RE_D5, paus, H_MI_E5, paus, H_RE_D5, paus, M_LA_A4, paus, M_FA_F4, paus, M_LA_A4, paus, H_RE_D5, paus, M_LA_A4, paus, M_FA_F4, paus, M_LA_A4, paus, H_RE_D5, paus,		--7
		  M_SOL_G4, paus, M_DO_C5, paus, H_RE_D5, paus, M_DO_C5, paus, M_SOL_G4, paus, M_MI_E4, paus, M_SOL_G4, paus, M_DO_C5, paus, M_SOL_G4, paus, M_MI_E4, paus, M_SOL_G4, paus, M_DO_C5, paus,	--8
		  M_LA_A4, paus, M_LA_A4, paus, M_LA_A4, paus, M_DO_C5, paus, M_LA_A4, paus,																												--9
		  M_SOL_G4, paus, M_SOL_G4, paus, M_SOL_G4, paus, M_SI_B4, paus, M_SOL_G4, paus,																											--10
		  M_SOL_G4, paus, M_SOL_G4, paus, M_SOL_G4, paus, M_LAS_A4S, paus, M_LA_A4, paus, M_DO_C5, paus, M_SI_B4, paus, H_RE_D5, paus, M_DO_C5, paus,														--11
		  H_SOL_G5, paus, H_FAS_F5S, paus, H_FA_F5, paus, H_MI_E5, paus, H_RES_D5S, paus, H_RE_D5, paus, H_DOS_C5S, paus, H_DO_C5, paus, M_SI_B4, paus, M_LAS_A4S, paus, M_LA_A4, paus, M_SOLS_G4S, paus, M_SOL_G4, paus,	--12
		  H_SOLS_G5S, paus, M_LA_A4, paus, M_SI_B4, paus, M_DO_C5, paus, M_SOL_G4, paus, M_DO_C5, paus, H_RE_D5, paus, H_MI_E5, paus, H_RE_D5, paus, M_DO_C4, paus, H_RE_D5, paus, H_MI_E5, paus,							--13
		  H_MI_E5, paus, M_DO_C4, paus);	--14
	
	-- datentyp integer!!
	constant overture_laenge: laenge_overture :=(
	 x*3, x, x*3, x, x*3, x, x*3, x, x*3, x, x*3, x, x*3, x, x*7, x, x*7, x, x*16, x*4,						--1
	   x*3, x, x*3, x, x*3, x, x*3, x, x*3, x, x*3, x, x*3, x, x*7, x, x*7, x, x*16, x*4,					--2
	   x*3, x, x*3, x, x*3, x, x*3, x, x*3, x, x*3, x, x*3, x, x*3, x, x*3, x, x*3, x, x*3, x, x*16, x*4,	--3
	   x*3, x, x*3, x, x*3, x, x*3, x, x*3, x, x*3, x, x*3, x, x*3, x, x*3, x, x*3, x, x*3, x, x*16, x*4,	--4
	   x*3, x, x*3, x, x*3, x, x*3, x, x*3, x, x*3, x, x*3, x, x*7, x, x*7, x, x*16, x*4,					--5
	   x*3, x, x*3, x, x*3, x, x*3, x, x*3, x, x*3, x, x*3, x, x*7, x, x*7, x, x*16, x*4,					--6
	   x*3, x, x*3, x, x*3, x, x*3, x, x*3, x, x*3, x, x*3, x, x*3, x, x*3, x, x*3, x, x*3, x, x*16, x*4,	--7
	   x*3, x, x*3, x, x*3, x, x*3, x, x*3, x, x*3, x, x*3, x, x*3, x, x*3, x, x*3, x, x*3, x, x*16, x*8,	--8
	   x*3, x, x*3, x, x*3, x, x*7, x, x*8, x*8,															--9
	   x*3, x, x*3, x, x*3, x, x*7, x, x*7, x*8,															--10
	   x*3, x, x*3, x, x*3, x, x*7, x, x*7, x, x*7, x, x*7, x, x*7, x, x*7, x, 										--11
	   x*7, x, x*7, x, x*7, x, x*7, x, x*7, x, x*7, x, x*7, x, x*7, x, x*7, x, x*7, x, x*7, x, x*7, x, x*8, x*8,	--12
	   x*8, x*8, x*8, x*8, x*8, x*8, x*3, x, x*3, x, x*3, x, x*3, x, x*3, x, x*3, x, x*3, x, x*3, x*8, x*40,		--13
	   x*8, x*8, x*48, x);
    
	   
	   
	 
	
	constant tom_dooley_hoehe	:	stuck_tom_dooley	:=(
	paus, M_DO_C4, paus, M_DO_C4, paus, M_DO_C4, paus, M_RE_D4, paus, M_FA_F4, paus, M_LA_A4, paus, M_LA_A4, paus, M_DO_C4, paus, M_DO_C4, paus, M_DO_C4, paus, M_RE_D4, paus,
	M_FA_F4, paus, M_SOL_G4, paus, M_DO_C4, paus, M_DO_C4, paus, M_DO_C4, paus, M_RE_D4, paus, M_FA_F4, paus, M_SOL_G4, paus, M_SOL_G4, paus, M_SOL_G4, paus, M_SOL_G4, paus, M_LA_A4, paus,
	M_FA_F4, paus, M_RE_D4, paus, M_FA_F4, paus, M_SOL_G4, paus, M_SOL_G4, paus, M_SOL_G4, paus, M_LA_A4, paus, M_DO_C5, paus, H_MI_E5, paus, H_MI_E5, paus, M_SOL_G4, paus, M_SOL_G4, paus,
	M_SOL_G4, paus, M_LA_A4, paus, M_DO_C5, paus, H_RE_D5, paus, M_SOL_G4, paus, M_SOL_G4, paus, M_SOL_G4, paus, M_LA_A4, paus, M_DO_C5, paus, H_RE_D5, paus, H_RE_D5, paus, H_RE_D5, paus,
	H_RE_D5, paus, H_MI_E5, paus, M_DO_C5, paus, M_LA_A4, paus, M_DO_C5, paus);
	
	constant tom_dooley_laenge	:	lange_tom_dooley	:=(
	3*v, v, 7*v, v, 3*v, v, 7*v, v, 8*v, 8*v, 7*v, v, 15*v, v, 3*v, v, 7*v, v, 3*v, v, 7*v, v, 7*v, v, 31*v, v,
	3*v, v, 7*v, v, 3*v, v, 7*v, v, 8*v, 8*v, 7*v, v, 15*v, v, 3*v, v, 7*v, v, 3*v, v, 7*v, v, 7*v, v, 31*v, v,
	3*v, v, 7*v, v, 3*v, v, 7*v, v, 8*v, 8*v, 7*v, v, 15*v, v, 3*v, v, 7*v, v, 3*v, v, 7*v, v, 7*v, v, 31*v, v,
	3*v, v, 7*v, v, 3*v, v, 7*v, v, 8*v, 8*v, 7*v, v, 15*v, v, 3*v, v, 7*v, v, 3*v, v, 7*v, v, 7*v, v, 31*v, v, 0);

	constant fuer_elise_hoehe	:	stuck_fuer_elise	:=(
	paus,  H_MI_E5, paus, H_RES_D5S, paus, H_MI_E5, paus, H_RES_D5S, paus, H_MI_E5, paus, M_SI_B4, paus, H_RE_D5, paus, M_DO_C5, paus,
	M_LA_A4, paus, M_DO_C4, paus, M_MI_E4, paus, M_LA_A4, paus, M_SI_B4, paus, M_MI_E4, paus, M_SOLS_G4S, paus, M_SI_B4, paus, M_DO_C5, paus,
	M_MI_E4, paus, H_MI_E5, paus, H_RES_D5S, paus, H_MI_E5, paus, H_RES_D5S, paus, H_MI_E5, paus, M_SI_B4, paus, H_RE_D5, paus, M_DO_C5, paus, M_LA_A4, paus,
	M_DO_C4, paus, M_MI_E4, paus, M_LA_A4, paus, M_SI_B4, paus, M_MI_E4, paus, M_DO_C5, paus, M_SI_B4, paus, 
	--Wiederholung Ende 1
	M_LA_A4, paus, H_MI_E5, paus, H_RES_D5S, paus, H_MI_E5, paus, H_RES_D5S, paus, H_MI_E5, paus, M_SI_B4, paus, H_RE_D5, paus, M_DO_C5, paus,
	--Wiederholung
	M_LA_A4, paus, M_DO_C4, paus, M_MI_E4, paus, M_LA_A4, paus, M_SI_B4, paus, M_MI_E4, paus, M_SOLS_G4S, paus, M_SI_B4, paus, M_DO_C5, paus,
	M_MI_E4, paus, H_MI_E5, paus, H_RES_D5S, paus, H_MI_E5, paus, H_RES_D5S, paus, H_MI_E5, paus, M_SI_B4, paus, H_RE_D5, paus, M_DO_C5, paus, M_LA_A4, paus,
	M_DO_C4, paus, M_MI_E4, paus, M_LA_A4, paus, M_SI_B4, paus, M_MI_E4, paus, M_DO_C5, paus, M_SI_B4, paus,
	--Wiederholung Ende 2
	M_LA_A4, paus, M_SI_B4, paus, M_DO_C5, paus, H_RE_D5, paus,
	--Wiederholung Teil 2
	H_MI_E5, paus, M_SOL_G4, paus, H_FA_F5, paus, H_MI_E5, paus, H_RE_D5, paus, M_FA_F4, paus, H_MI_E5, paus, H_RE_D5, paus, H_DO_C5, paus, M_MI_E4, paus, H_RE_D5, paus, H_DO_C5, paus, M_SI_B4, paus, M_SI_B4, paus,
	H_MI_E5, paus, H_RES_D5S, paus, H_MI_E5, paus, H_RES_D5S, paus, H_MI_E5, paus, M_SI_B4, paus, H_RE_D5, paus, M_DO_C5, paus, M_LA_A4, paus, M_DO_C4, paus, M_MI_E4, paus, M_LA_A4, paus, M_SI_B4, paus,
	M_MI_E4, paus, M_SOLS_G4S, paus, M_SI_B4, paus, M_DO_C5, paus, M_MI_E4, paus, H_MI_E5, paus, H_RES_D5S, paus, H_MI_E5, paus, H_RES_D5S, paus, H_MI_E5, paus, M_SI_B4, paus,
	H_RE_D5, paus, M_DO_C5, paus, M_LA_A4, paus, M_DO_C4, paus, M_MI_E4, paus, M_LA_A4, paus, M_SI_B4, paus, M_MI_E4, paus, M_DO_C5, paus, M_SI_B4, paus, 
	--Wiederholung Teil 2 Ende 1
	M_LA_A4, paus, M_SI_B4, paus, M_DO_C5, paus, H_RE_D5, paus,
	--Wiederholung Teil 2
	H_MI_E5, paus, M_SOL_G4, paus, H_FA_F5, paus, H_MI_E5, paus, H_RE_D5, paus, M_FA_F4, paus, H_MI_E5, paus, H_RE_D5, paus, H_DO_C5, paus, M_MI_E4, paus, H_RE_D5, paus, H_DO_C5, paus, M_SI_B4, paus, M_SI_B4, paus,
	H_MI_E5, paus, H_RES_D5S, paus, H_MI_E5, paus, H_RES_D5S, paus, H_MI_E5, paus, M_SI_B4, paus, H_RE_D5, paus, M_DO_C5, paus, M_LA_A4, paus, M_DO_C4, paus, M_MI_E4, paus, M_LA_A4, paus, M_SI_B4, paus,
	M_MI_E4, paus, M_SOLS_G4S, paus, M_SI_B4, paus, M_DO_C5, paus, M_MI_E4, paus, H_MI_E5, paus, H_RES_D5S, paus, H_MI_E5, paus, H_RES_D5S, paus, H_MI_E5, paus, M_SI_B4, paus,
	H_RE_D5, paus, M_DO_C5, paus, M_LA_A4, paus, M_DO_C4, paus, M_MI_E4, paus, M_LA_A4, paus, M_SI_B4, paus, M_MI_E4, paus, M_DO_C5, paus, M_SI_B4, paus,  
	--Wiederholung Teil 2 mit Ende 2
	M_LA_A4, paus);
	
	constant fuer_elise_laenge	:	lange_fuer_elise	:=(
	 3*e, e, 3*e, e, 3*e, e, 3*e, e, 3*e, e, 3*e, e, 3*e, e, 3*e, e, 
	--Wiederholung Teil 1
	8*e, 4*e, 3*e, e, 3*e, e, 3*e, e, 8*e, 4*e, 3*e, e, 3*e, e, 3*e, e, 8*e, 4*e, 3*e, e, 3*e, e, 3*e, e, 3*e, e, 3*e, e, 3*e, e, 3*e, e, 3*e, e, 3*e, e, 8*e, 4*e, 
	3*e, e, 3*e, e, 3*e, e, 8*e, 4*e, 3*e, e, 3*e, e, 3*e, e,
	--Wiederholung Teil 1 Ende 1
	8*e, 8*e, 3*e, e, 3*e, e, 3*e, e, 3*e, e, 3*e, e, 3*e, e, 3*e, e, 3*e, e,
	--Wiederholung Teil 1
	8*e, 4*e, 3*e, e, 3*e, e, 3*e, e, 8*e, 4*e, 3*e, e, 3*e, e, 3*e, e, 8*e, 4*e, 3*e, e, 3*e, e, 3*e, e, 3*e, e, 3*e, e, 3*e, e, 3*e, e, 3*e, e, 3*e, e, 8*e, 4*e, 
	3*e, e, 3*e, e, 3*e, e, 8*e, 4*e, 3*e, e, 3*e, e, 3*e, e,
	--Wiederholung Teil 1 Ende 2
	8*e, 4*e, 3*e, e, 3*e, e, 3*e, e,
	--Wiederholung Teil 2
	7*e, e, 3*e, e, 3*e, e, 3*e, e, 7*e, e, 3*e, e, 3*e, e, 3*e, e, 7*e, e, 3*e, e, 3*e, e, 3*e, e, 31*e, e, 8*e, 8*e, 3*e, e, 3*e, e,
	3*e, e, 3*e, e, 3*e, e, 3*e, e, 3*e, e, 3*e, e, 8*e, 4*e, 3*e, e, 3*e, e, 3*e, e, 8*e, 4*e, 3*e, e, 3*e, e, 3*e, e, 8*e, 4*e, 3*e, e, 3*e, e, 3*e, e,
	3*e, e, 3*e, e, 3*e, e, 3*e, e, 3*e, e, 3*e, e, 8*e, 4*e, 3*e, e, 3*e, e, 3*e, e, 8*e, 4*e, 3*e, e, 3*e, e, 3*e, e,
	--Wiederholung Teil 2 Ende 1
	8*e, 4*e, 3*e, e, 3*e, e, 3*e, e, 
	--Wiederholung Teil 2
	7*e, e, 3*e, e, 3*e, e, 3*e, e, 7*e, e, 3*e, e, 3*e, e, 3*e, e, 7*e, e, 3*e, e, 3*e, e, 3*e, e, 15*e, e, 8*e, 8*e, 3*e, e, 3*e, e,
	3*e, e, 3*e, e, 3*e, e, 3*e, e, 3*e, e, 3*e, e, 8*e, 4*e, 3*e, e, 3*e, e, 3*e, e, 8*e, 4*e, 3*e, e, 3*e, e, 3*e, e, 8*e, 4*e, 3*e, e, 3*e, e, 3*e, e,
	3*e, e, 3*e, e, 3*e, e, 3*e, e, 3*e, e, 3*e, e, 8*e, 4*e, 3*e, e, 3*e, e, 3*e, e, 8*e, 4*e, 3*e, e, 3*e, e, 3*e, e,
	--Wiederholung Teil 2 Ende 2
	 15*e, e, 0);


	-- More constant Declarations (Phase increment values for tones in 3 octaves of piano)
	-------------------------------------------------------------------------------
    -- PLAIN TONES MID-OCTAVE (C4 until C5)
    -- constant M_DO_C4: 		std_logic_vector(N_CUM-1 downto 0):= std_logic_vector(to_unsigned(2143,N_CUM)); -- DO-C4  tone ~261.63Hz
    -- constant M_RE_D4: 		std_logic_vector(N_CUM-1 downto 0):= std_logic_vector(to_unsigned(2406,N_CUM)); -- RE_D4  tone ~293.66Hz
    -- constant M_MI_E4: 		std_logic_vector(N_CUM-1 downto 0):= std_logic_vector(to_unsigned(2700,N_CUM)); -- MI_E4  tone ~329.63Hz
    -- constant M_FA_F4: 		std_logic_vector(N_CUM-1 downto 0):= std_logic_vector(to_unsigned(2861,N_CUM)); -- FA_F4  tone ~349.23Hz
    -- constant M_SOL_G4: 		std_logic_vector(N_CUM-1 downto 0):= std_logic_vector(to_unsigned(3211,N_CUM)); -- SOL_G4 tone ~392.00Hz
    -- constant M_LA_A4: 		std_logic_vector(N_CUM-1 downto 0):= std_logic_vector(to_unsigned(3604,N_CUM)); -- LA_A4  tone ~440.00Hz
    -- constant M_SI_B4: 		std_logic_vector(N_CUM-1 downto 0):= std_logic_vector(to_unsigned(4046,N_CUM)); -- SI_B4  tone ~493.88Hz
    -- constant M_DO_C5: 		std_logic_vector(N_CUM-1 downto 0):= std_logic_vector(to_unsigned(4286,N_CUM)); -- DO_C5  tone ~523.25Hz
    -- -- HARP TONES MID-OCTAVE
    -- constant M_DOS_C4S: 		std_logic_vector(N_CUM-1 downto 0):= std_logic_vector(to_unsigned(2271,N_CUM)); -- DOS_C4S  tone ~277.18Hz
    -- constant M_RES_D4S: 		std_logic_vector(N_CUM-1 downto 0):= std_logic_vector(to_unsigned(2549,N_CUM)); -- RES_D4S  tone ~311.13Hz
    -- constant M_FAS_F4S: 		std_logic_vector(N_CUM-1 downto 0):= std_logic_vector(to_unsigned(3031,N_CUM)); -- FAS_F4S  tone ~369.99Hz
    -- constant M_SOLS_G4S:		std_logic_vector(N_CUM-1 downto 0):= std_logic_vector(to_unsigned(3402,N_CUM)); -- SOLS_G4S tone ~415.30Hz
    -- constant M_LAS_A4S:	 	std_logic_vector(N_CUM-1 downto 0):= std_logic_vector(to_unsigned(3819,N_CUM)); -- LAS_A4S  tone ~466.16Hz
    -- -------------------------------------------------------------------------------
	-- -------------------------------------------------------------------------------
     -- --PLAIN TONES HIGH-OCTAVE (C5 until C6)
	-- constant H_DO_C5: 		std_logic_vector(N_CUM-1 downto 0):= std_logic_vector(to_unsigned(2143*2,N_CUM)); -- DO-C5  tone ~2*261.63Hz
    -- constant H_RE_D5: 		std_logic_vector(N_CUM-1 downto 0):= std_logic_vector(to_unsigned(2406*2,N_CUM)); -- RE_D5  tone ~2*293.66Hz
    -- constant H_MI_E5: 		std_logic_vector(N_CUM-1 downto 0):= std_logic_vector(to_unsigned(2700*2,N_CUM)); -- MI_E5  tone ~2*329.63Hz
    -- constant H_FA_F5: 		std_logic_vector(N_CUM-1 downto 0):= std_logic_vector(to_unsigned(2861*2,N_CUM)); -- FA_F5  tone ~2*349.23Hz
    -- constant H_SOL_G5: 		std_logic_vector(N_CUM-1 downto 0):= std_logic_vector(to_unsigned(3211*2,N_CUM)); -- SOL_G5 tone ~2*392.00Hz
    -- constant H_LA_A5: 		std_logic_vector(N_CUM-1 downto 0):= std_logic_vector(to_unsigned(3604*2,N_CUM)); -- LA_A5  tone ~2*440.00Hz
    -- constant H_SI_B5: 		std_logic_vector(N_CUM-1 downto 0):= std_logic_vector(to_unsigned(4046*2,N_CUM)); -- SI_B5  tone ~2*493.88Hz
    -- constant H_DO_C6: 		std_logic_vector(N_CUM-1 downto 0):= std_logic_vector(to_unsigned(4286*2,N_CUM)); -- DO_C6  tone ~2*523.25Hz
    -- -- SHARP TONES HIGH-OCTAVE
    -- constant H_DOS_C5S: 		std_logic_vector(N_CUM-1 downto 0):= std_logic_vector(to_unsigned(2271*2,N_CUM)); -- DOS_C5S  tone ~2*277.18Hz
    -- constant H_RES_D5S: 		std_logic_vector(N_CUM-1 downto 0):= std_logic_vector(to_unsigned(2549*2,N_CUM)); -- RES_D5S  tone ~2*311.13Hz
    -- constant H_FAS_F5S: 		std_logic_vector(N_CUM-1 downto 0):= std_logic_vector(to_unsigned(3031*2,N_CUM)); -- FAS_F5S  tone ~2*369.99Hz
    -- constant H_SOLS_G5S: 	std_logic_vector(N_CUM-1 downto 0):= std_logic_vector(to_unsigned(3402*2,N_CUM)); -- SOLS_G5S tone ~2*415.30Hz
    -- constant H_LAS_A5S: 		std_logic_vector(N_CUM-1 downto 0):= std_logic_vector(to_unsigned(3819*2,N_CUM)); -- LAS_A5S  tone ~2*466.16Hz
    -- -------------------------------------------------------------------------------
    -- -------------------------------------------------------------------------------
     -- -- PLAIN TONES LOW-OCTAVE (C3 until C4)
	-- constant L_DO_C3: 		std_logic_vector(N_CUM-1 downto 0):= std_logic_vector(to_unsigned(2144/2,N_CUM)); -- DO-C3  tone ~0,5*261.63Hz
    -- constant L_RE_D3: 		std_logic_vector(N_CUM-1 downto 0):= std_logic_vector(to_unsigned(2406/2,N_CUM)); -- RE_D3  tone ~0,5*293.66Hz
    -- constant L_MI_E3: 		std_logic_vector(N_CUM-1 downto 0):= std_logic_vector(to_unsigned(2700/2,N_CUM)); -- MI_E3  tone ~0,5*329.63Hz
    -- constant L_FA_F3: 		std_logic_vector(N_CUM-1 downto 0):= std_logic_vector(to_unsigned(2860/2,N_CUM)); -- FA_F3  tone ~0,5*349.23Hz
    -- constant L_SOL_G3: 		std_logic_vector(N_CUM-1 downto 0):= std_logic_vector(to_unsigned(3212/2,N_CUM)); -- SOL_G3 tone ~0,5*392.00Hz
    -- constant L_LA_A3: 		std_logic_vector(N_CUM-1 downto 0):= std_logic_vector(to_unsigned(3604/2,N_CUM)); -- LA_A3  tone ~0,5*440.00Hz
    -- constant L_SI_B3: 		std_logic_vector(N_CUM-1 downto 0):= std_logic_vector(to_unsigned(4046/2,N_CUM)); -- SI_B3  tone ~0,5*493.88Hz
    -- constant L_DO_C4: 		std_logic_vector(N_CUM-1 downto 0):= std_logic_vector(to_unsigned(4286/2,N_CUM)); -- DO_C4  tone ~0,5*523.25Hz
    -- -- SHARP TONES LOW-OCTAVE
    -- constant L_DOS_C3S: 		std_logic_vector(N_CUM-1 downto 0):= std_logic_vector(to_unsigned(2270/2,N_CUM)); -- DOS_C3S  tone ~0,5*277.18Hz
    -- constant L_RES_D3S: 		std_logic_vector(N_CUM-1 downto 0):= std_logic_vector(to_unsigned(2548/2,N_CUM)); -- RES_D3S  tone ~0,5*311.13Hz
    -- constant L_FAS_F3S: 		std_logic_vector(N_CUM-1 downto 0):= std_logic_vector(to_unsigned(3030/2,N_CUM)); -- FAS_F3S  tone ~0,5*369.99Hz
    -- constant L_SOLS_G3S: 	std_logic_vector(N_CUM-1 downto 0):= std_logic_vector(to_unsigned(3402/2,N_CUM)); -- SOLS_G3S tone ~0,5*415.30Hz
    -- constant L_LAS_A3S: 		std_logic_vector(N_CUM-1 downto 0):= std_logic_vector(to_unsigned(3818/2,N_CUM)); -- LAS_A3S  tone ~0,5*466.16Hz
    -- -------------------------------------------------------------------------------
	-- -------------------------------------------------------------------------------

end package;
