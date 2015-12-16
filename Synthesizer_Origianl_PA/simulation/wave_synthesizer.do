onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -color {Slate Blue} -itemcolor {Slate Blue} -label clk_50M -radix hexadecimal /tb_synthesizer/tb_clk_50M
<<<<<<< HEAD
=======
add wave -noupdate -color {Cornflower Blue} -itemcolor {Cornflower Blue} -label infrastructure -radix hexadecimal /tb_synthesizer/i_TOP_LEVEL/INFRASTRUCTURE_BLOCK_INST/key_in
>>>>>>> branch_is_working
add wave -noupdate -color {Cornflower Blue} -itemcolor {Cornflower Blue} -label {infrastrucure: clk 12M5 out} -radix hexadecimal /tb_synthesizer/i_TOP_LEVEL/INFRASTRUCTURE_BLOCK_INST/clk_12M
add wave -noupdate -color {Slate Blue} -itemcolor {Slate Blue} -label serial_in -radix hexadecimal /tb_synthesizer/i_TOP_LEVEL/i_MIDI_INTERFACE/serial_i
add wave -noupdate -color {Slate Blue} -itemcolor {Slate Blue} -label {uart: data out} -radix hexadecimal /tb_synthesizer/i_TOP_LEVEL/i_MIDI_INTERFACE/i_uart_top/rx_data
add wave -noupdate -color {Slate Blue} -itemcolor {Slate Blue} -label {midi control: note out} -radix hexadecimal /tb_synthesizer/i_TOP_LEVEL/i_MIDI_INTERFACE/i_midi_control/note_out_o
add wave -noupdate -color {Slate Blue} -itemcolor {Slate Blue} -label {polyphony: note_0 out} -radix hexadecimal /tb_synthesizer/i_TOP_LEVEL/i_MIDI_INTERFACE/i_polyphone_out/note_0
add wave -noupdate -color {Slate Blue} -itemcolor {Slate Blue} -label {poliphony: note_1 out} -radix hexadecimal /tb_synthesizer/i_TOP_LEVEL/i_MIDI_INTERFACE/i_polyphone_out/note_1
add wave -noupdate -color {Slate Blue} -itemcolor {Slate Blue} -label {polyphony: note_2 out} -radix hexadecimal /tb_synthesizer/i_TOP_LEVEL/i_MIDI_INTERFACE/i_polyphone_out/note_2
add wave -noupdate -color {Slate Blue} -itemcolor {Slate Blue} -label {poliphony: note_3 out} -radix hexadecimal /tb_synthesizer/i_TOP_LEVEL/i_MIDI_INTERFACE/i_polyphone_out/note_3
add wave -noupdate -color {Slate Blue} -itemcolor {Slate Blue} -label {poliphony: note_4 out} -radix hexadecimal /tb_synthesizer/i_TOP_LEVEL/i_MIDI_INTERFACE/i_polyphone_out/note_4
add wave -noupdate -color {Slate Blue} -itemcolor {Slate Blue} -label {poliphony: note_5 out} -radix hexadecimal /tb_synthesizer/i_TOP_LEVEL/i_MIDI_INTERFACE/i_polyphone_out/note_5
add wave -noupdate -color {Slate Blue} -itemcolor {Slate Blue} -label {midi interface: note_out} -radix hexadecimal -childformat {{/tb_synthesizer/i_TOP_LEVEL/i_MIDI_INTERFACE/note_o(0) -radix hexadecimal} {/tb_synthesizer/i_TOP_LEVEL/i_MIDI_INTERFACE/note_o(1) -radix hexadecimal} {/tb_synthesizer/i_TOP_LEVEL/i_MIDI_INTERFACE/note_o(2) -radix hexadecimal} {/tb_synthesizer/i_TOP_LEVEL/i_MIDI_INTERFACE/note_o(3) -radix hexadecimal} {/tb_synthesizer/i_TOP_LEVEL/i_MIDI_INTERFACE/note_o(4) -radix hexadecimal} {/tb_synthesizer/i_TOP_LEVEL/i_MIDI_INTERFACE/note_o(5) -radix hexadecimal} {/tb_synthesizer/i_TOP_LEVEL/i_MIDI_INTERFACE/note_o(6) -radix hexadecimal} {/tb_synthesizer/i_TOP_LEVEL/i_MIDI_INTERFACE/note_o(7) -radix hexadecimal} {/tb_synthesizer/i_TOP_LEVEL/i_MIDI_INTERFACE/note_o(8) -radix hexadecimal} {/tb_synthesizer/i_TOP_LEVEL/i_MIDI_INTERFACE/note_o(9) -radix hexadecimal}} -expand -subitemconfig {/tb_synthesizer/i_TOP_LEVEL/i_MIDI_INTERFACE/note_o(0) {-color {Slate Blue} -height 17 -itemcolor {Slate Blue} -radix hexadecimal} /tb_synthesizer/i_TOP_LEVEL/i_MIDI_INTERFACE/note_o(1) {-color {Slate Blue} -height 17 -itemcolor {Slate Blue} -radix hexadecimal} /tb_synthesizer/i_TOP_LEVEL/i_MIDI_INTERFACE/note_o(2) {-color {Slate Blue} -height 17 -itemcolor {Slate Blue} -radix hexadecimal} /tb_synthesizer/i_TOP_LEVEL/i_MIDI_INTERFACE/note_o(3) {-color {Slate Blue} -height 17 -itemcolor {Slate Blue} -radix hexadecimal} /tb_synthesizer/i_TOP_LEVEL/i_MIDI_INTERFACE/note_o(4) {-color {Slate Blue} -height 17 -itemcolor {Slate Blue} -radix hexadecimal} /tb_synthesizer/i_TOP_LEVEL/i_MIDI_INTERFACE/note_o(5) {-color {Slate Blue} -height 17 -itemcolor {Slate Blue} -radix hexadecimal} /tb_synthesizer/i_TOP_LEVEL/i_MIDI_INTERFACE/note_o(6) {-color {Slate Blue} -height 17 -itemcolor {Slate Blue} -radix hexadecimal} /tb_synthesizer/i_TOP_LEVEL/i_MIDI_INTERFACE/note_o(7) {-color {Slate Blue} -height 17 -itemcolor {Slate Blue} -radix hexadecimal} /tb_synthesizer/i_TOP_LEVEL/i_MIDI_INTERFACE/note_o(8) {-color {Slate Blue} -height 17 -itemcolor {Slate Blue} -radix hexadecimal} /tb_synthesizer/i_TOP_LEVEL/i_MIDI_INTERFACE/note_o(9) {-color {Slate Blue} -height 17 -itemcolor {Slate Blue} -radix hexadecimal}} /tb_synthesizer/i_TOP_LEVEL/i_MIDI_INTERFACE/note_o
add wave -noupdate -color Gold -itemcolor Gold -label {decoder_0: note_in} -radix hexadecimal /tb_synthesizer/i_TOP_LEVEL/TONE_DECODER_INST_0/notes_keyboard
add wave -noupdate -color Gold -itemcolor Gold -label {decoder_0: NUM_notes} /tb_synthesizer/i_TOP_LEVEL/TONE_DECODER_INST_0/N_CUM_keyboard
add wave -noupdate -color Gold -itemcolor Gold -label {decoder_0: NUM_switch} /tb_synthesizer/i_TOP_LEVEL/TONE_DECODER_INST_0/N_CUM_taster
add wave -noupdate -color Gold -itemcolor Gold -label {decoder_0: note on_out} /tb_synthesizer/i_TOP_LEVEL/TONE_DECODER_INST_0/tone_on_o
add wave -noupdate -color Coral -itemcolor Coral -label {decoder_1: note_on_out} -radix hexadecimal /tb_synthesizer/i_TOP_LEVEL/TONE_DECODER_INST_1/tone_on_o
add wave -noupdate -color Coral -itemcolor Coral -label {decoder_1: NUM_switch} -radix hexadecimal /tb_synthesizer/i_TOP_LEVEL/TONE_DECODER_INST_1/N_CUM_taster
add wave -noupdate -color Coral -itemcolor Coral -label {decoder_1: NUM_notes} -radix hexadecimal /tb_synthesizer/i_TOP_LEVEL/TONE_DECODER_INST_1/N_CUM_keyboard
add wave -noupdate -color Coral -itemcolor Coral -label {decoder_1: note_in} -radix hexadecimal /tb_synthesizer/i_TOP_LEVEL/TONE_DECODER_INST_1/notes_keyboard
add wave -noupdate -color Gold -itemcolor Gold -label {decoder_2: note_in} -radix hexadecimal /tb_synthesizer/i_TOP_LEVEL/TONE_DECODER_INST_2/notes_keyboard
add wave -noupdate -color Gold -itemcolor Gold -label {decoder_2: NUM_notes} /tb_synthesizer/i_TOP_LEVEL/TONE_DECODER_INST_2/N_CUM_keyboard
add wave -noupdate -color Gold -itemcolor Gold -label {decoder_2: note_on out} -radix hexadecimal /tb_synthesizer/i_TOP_LEVEL/TONE_DECODER_INST_2/tone_on_o
add wave -noupdate -color Coral -itemcolor Coral -label {decoder_3: note_on out} -radix hexadecimal /tb_synthesizer/i_TOP_LEVEL/TONE_DECODER_INST_3/tone_on_o
add wave -noupdate -color Coral -itemcolor Coral -label {decoder_3: NUM_notes} -radix hexadecimal /tb_synthesizer/i_TOP_LEVEL/TONE_DECODER_INST_3/N_CUM_keyboard
add wave -noupdate -color Coral -itemcolor Coral -label {decoder_3: note_in} -radix hexadecimal /tb_synthesizer/i_TOP_LEVEL/TONE_DECODER_INST_3/notes_keyboard
add wave -noupdate -color Gold -itemcolor Gold -label {decoder_4: note_in} -radix hexadecimal /tb_synthesizer/i_TOP_LEVEL/TONE_DECODER_INST_4/notes_keyboard
add wave -noupdate -color Gold -itemcolor Gold -label {decoder_4: NUM_note} -radix hexadecimal /tb_synthesizer/i_TOP_LEVEL/TONE_DECODER_INST_4/N_CUM_keyboard
add wave -noupdate -color Gold -itemcolor Gold -label {decoder_4: note on out} /tb_synthesizer/i_TOP_LEVEL/TONE_DECODER_INST_4/tone_on_o
add wave -noupdate -color Coral -itemcolor Coral -label {decoder_5: note on out} -radix hexadecimal /tb_synthesizer/i_TOP_LEVEL/TONE_DECODER_INST_5/tone_on_o
add wave -noupdate -color Coral -itemcolor Coral -label {decoder_5: note_in} -radix hexadecimal /tb_synthesizer/i_TOP_LEVEL/TONE_DECODER_INST_5/notes_keyboard
add wave -noupdate -color Coral -itemcolor Coral -label {decoder_5: NUM_note} -radix hexadecimal /tb_synthesizer/i_TOP_LEVEL/TONE_DECODER_INST_5/N_CUM_keyboard
add wave -noupdate -color {Cadet Blue} -itemcolor {Cadet Blue} -label {fm_0: data_out} -radix hexadecimal /tb_synthesizer/i_TOP_LEVEL/FM_SYNTH_INST_0/data_o
add wave -noupdate -color {Dark Slate Gray} -itemcolor {Dark Slate Gray} -label {fm_1: data_out} -radix hexadecimal /tb_synthesizer/i_TOP_LEVEL/FM_SYNTH_INST_2/data_o
add wave -noupdate -color {Cadet Blue} -itemcolor {Cadet Blue} -label {fm_2: data_out} -radix hexadecimal /tb_synthesizer/i_TOP_LEVEL/FM_SYNTH_INST_3/data_o
add wave -noupdate -color {Dark Slate Gray} -itemcolor {Dark Slate Gray} -label {fm_3: data out} -radix hexadecimal /tb_synthesizer/i_TOP_LEVEL/FM_SYNTH_INST_4/data_o
add wave -noupdate -color {Cadet Blue} -itemcolor {Cadet Blue} -label {fm_4: data_out} -radix hexadecimal /tb_synthesizer/i_TOP_LEVEL/FM_SYNTH_INST_5/data_o
add wave -noupdate -color {Dark Slate Gray} -itemcolor {Dark Slate Gray} -label {fm_5: data out} -radix hexadecimal /tb_synthesizer/i_TOP_LEVEL/FM_SYNTH_INST_6/data_o
TreeUpdate [SetDefaultTree]
<<<<<<< HEAD
WaveRestoreCursors {{Cursor 1} {17393544 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 234
=======
WaveRestoreCursors {{Cursor 1} {0 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 162
>>>>>>> branch_is_working
configure wave -valuecolwidth 48
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits us
update
<<<<<<< HEAD
WaveRestoreZoom {16933436 ns} {22266662 ns}
=======
WaveRestoreZoom {0 ns} {5775104 ns}
  <div class="btn-group right">
    <a href="/coolt/zhaw-pa-synthesizer/find/master"
          class="js-show-file-finder btn btn-sm"
          data-pjax
          data-hotkey="t">
      Find file
    </a>
    <button aria-label="Copy file path to clipboard" class="js-zeroclipboard btn btn-sm zeroclipboard-button tooltipped tooltipped-s" data-copied-hint="Copied!" type="button">Copy path</button>
  </div>
  <div class="breadcrumb js-zeroclipboard-target">
    <span class="repo-root js-repo-root"><span itemscope="" itemtype="http://data-vocabulary.org/Breadcrumb"><a href="/coolt/zhaw-pa-synthesizer" class="" data-branch="master" data-pjax="true" itemscope="url"><span itemprop="title">zhaw-pa-synthesizer</span></a></span></span><span class="separator">/</span><span itemscope="" itemtype="http://data-vocabulary.org/Breadcrumb"><a href="/coolt/zhaw-pa-synthesizer/tree/master/Synthesizer_Original_2" class="" data-branch="master" data-pjax="true" itemscope="url"><span itemprop="title">Synthesizer_Original_2</span></a></span><span class="separator">/</span><span itemscope="" itemtype="http://data-vocabulary.org/Breadcrumb"><a href="/coolt/zhaw-pa-synthesizer/tree/master/Synthesizer_Original_2/simulation" class="" data-branch="master" data-pjax="true" itemscope="url"><span itemprop="title">simulation</span></a></span><span class="separator">/</span><strong class="final-path">wave_synthesizer.do</strong>
  </div>
</div>


  <div class="commit-tease">
      <span class="right">
        <a class="commit-tease-sha" href="/coolt/zhaw-pa-synthesizer/commit/13dc27092533148ce1a4580eb2cb340d3334e8d1" data-pjax>
          13dc270
        </a>
        <time datetime="2015-12-11T15:44:55Z" is="relative-time">Dec 11, 2015</time>
      </span>
      <div>
        <img alt="" class="avatar" height="20" src="https://0.gravatar.com/avatar/d98a73844ffad48766077b7c356b9921?d=https%3A%2F%2Fassets-cdn.github.com%2Fimages%2Fgravatars%2Fgravatar-user-420.png&amp;r=x&amp;s=140" width="20" />
        <span class="user-mention">Katrin  Baechli</span>
          <a href="/coolt/zhaw-pa-synthesizer/commit/13dc27092533148ce1a4580eb2cb340d3334e8d1" class="message" data-pjax="true" title="new project. Intention: Audio will working on FPGA. Result: Audio doesn&#39;t work. Project not useful.">new project. Intention: Audio will working on FPGA. Result: Audio doe…</a>
      </div>

    <div class="commit-tease-contributors">
      <a class="muted-link contributors-toggle" href="#blob_contributors_box" rel="facebox">
        <strong>0</strong>
         contributors
      </a>
      
    </div>

    <div id="blob_contributors_box" style="display:none">
      <h2 class="facebox-header" data-facebox-id="facebox-header">Users who have contributed to this file</h2>
      <ul class="facebox-user-list" data-facebox-id="facebox-description">
      </ul>
    </div>
  </div>

<div class="file">
  <div class="file-header">
  <div class="file-actions">

    <div class="btn-group">
      <a href="/coolt/zhaw-pa-synthesizer/raw/master/Synthesizer_Original_2/simulation/wave_synthesizer.do" class="btn btn-sm " id="raw-url">Raw</a>
        <a href="/coolt/zhaw-pa-synthesizer/blame/master/Synthesizer_Original_2/simulation/wave_synthesizer.do" class="btn btn-sm js-update-url-with-hash">Blame</a>
      <a href="/coolt/zhaw-pa-synthesizer/commits/master/Synthesizer_Original_2/simulation/wave_synthesizer.do" class="btn btn-sm " rel="nofollow">History</a>
    </div>


        <button type="button" class="octicon-btn disabled tooltipped tooltipped-nw"
          aria-label="You must be signed in to make or propose changes">
          <span class="octicon octicon-pencil"></span>
        </button>
        <button type="button" class="octicon-btn octicon-btn-danger disabled tooltipped tooltipped-nw"
          aria-label="You must be signed in to make or propose changes">
          <span class="octicon octicon-trashcan"></span>
        </button>
  </div>

  <div class="file-info">
      60 lines (59 sloc)
      <span class="file-info-divider"></span>
    8.79 KB
  </div>
</div>

  

  <div class="blob-wrapper data type-stata">
      <table class="highlight tab-size js-file-line-container" data-tab-size="8">
      <tr>
        <td id="L1" class="blob-num js-line-number" data-line-number="1"></td>
        <td id="LC1" class="blob-code blob-code-inner js-file-line">onerror {resume}</td>
      </tr>
      <tr>
        <td id="L2" class="blob-num js-line-number" data-line-number="2"></td>
        <td id="LC2" class="blob-code blob-code-inner js-file-line">quietly WaveActivateNextPane {} 0</td>
      </tr>
      <tr>
        <td id="L3" class="blob-num js-line-number" data-line-number="3"></td>
        <td id="LC3" class="blob-code blob-code-inner js-file-line">add wave <span class="pl-k">-</span>noupdate <span class="pl-k">-</span>color {Slate Blue} <span class="pl-k">-</span>itemcolor {Slate Blue} <span class="pl-k">-</span>label clk_50M <span class="pl-k">-</span>radix hexadecimal /tb_synthesizer/tb_clk_50M</td>
      </tr>
      <tr>
        <td id="L4" class="blob-num js-line-number" data-line-number="4"></td>
        <td id="LC4" class="blob-code blob-code-inner js-file-line">add wave <span class="pl-k">-</span>noupdate <span class="pl-k">-</span>color {Cornflower Blue} <span class="pl-k">-</span>itemcolor {Cornflower Blue} <span class="pl-k">-</span>label infrastructure <span class="pl-k">-</span>radix hexadecimal /tb_synthesizer/i_TOP_LEVEL/INFRASTRUCTURE_BLOCK_INST/key_in</td>
      </tr>
      <tr>
        <td id="L5" class="blob-num js-line-number" data-line-number="5"></td>
        <td id="LC5" class="blob-code blob-code-inner js-file-line">add wave <span class="pl-k">-</span>noupdate <span class="pl-k">-</span>color {Cornflower Blue} <span class="pl-k">-</span>itemcolor {Cornflower Blue} <span class="pl-k">-</span>label {infrastrucure: clk 12M5 out} <span class="pl-k">-</span>radix hexadecimal /tb_synthesizer/i_TOP_LEVEL/INFRASTRUCTURE_BLOCK_INST/clk_12M</td>
      </tr>
      <tr>
        <td id="L6" class="blob-num js-line-number" data-line-number="6"></td>
        <td id="LC6" class="blob-code blob-code-inner js-file-line">add wave <span class="pl-k">-</span>noupdate <span class="pl-k">-</span>color {Slate Blue} <span class="pl-k">-</span>itemcolor {Slate Blue} <span class="pl-k">-</span>label serial_in <span class="pl-k">-</span>radix hexadecimal /tb_synthesizer/i_TOP_LEVEL/i_MIDI_INTERFACE/serial_i</td>
      </tr>
      <tr>
        <td id="L7" class="blob-num js-line-number" data-line-number="7"></td>
        <td id="LC7" class="blob-code blob-code-inner js-file-line">add wave <span class="pl-k">-</span>noupdate <span class="pl-k">-</span>color {Slate Blue} <span class="pl-k">-</span>itemcolor {Slate Blue} <span class="pl-k">-</span>label {uart: data out} <span class="pl-k">-</span>radix hexadecimal /tb_synthesizer/i_TOP_LEVEL/i_MIDI_INTERFACE/i_uart_top/rx_data</td>
      </tr>
      <tr>
        <td id="L8" class="blob-num js-line-number" data-line-number="8"></td>
        <td id="LC8" class="blob-code blob-code-inner js-file-line">add wave <span class="pl-k">-</span>noupdate <span class="pl-k">-</span>color {Slate Blue} <span class="pl-k">-</span>itemcolor {Slate Blue} <span class="pl-k">-</span>label {midi control: note out} <span class="pl-k">-</span>radix hexadecimal /tb_synthesizer/i_TOP_LEVEL/i_MIDI_INTERFACE/i_midi_control/note_out_o</td>
      </tr>
      <tr>
        <td id="L9" class="blob-num js-line-number" data-line-number="9"></td>
        <td id="LC9" class="blob-code blob-code-inner js-file-line">add wave <span class="pl-k">-</span>noupdate <span class="pl-k">-</span>color {Slate Blue} <span class="pl-k">-</span>itemcolor {Slate Blue} <span class="pl-k">-</span>label {polyphony: note_0 out} <span class="pl-k">-</span>radix hexadecimal /tb_synthesizer/i_TOP_LEVEL/i_MIDI_INTERFACE/i_polyphone_out/note_0</td>
      </tr>
      <tr>
        <td id="L10" class="blob-num js-line-number" data-line-number="10"></td>
        <td id="LC10" class="blob-code blob-code-inner js-file-line">add wave <span class="pl-k">-</span>noupdate <span class="pl-k">-</span>color {Slate Blue} <span class="pl-k">-</span>itemcolor {Slate Blue} <span class="pl-k">-</span>label {poliphony: note_1 out} <span class="pl-k">-</span>radix hexadecimal /tb_synthesizer/i_TOP_LEVEL/i_MIDI_INTERFACE/i_polyphone_out/note_1</td>
      </tr>
      <tr>
        <td id="L11" class="blob-num js-line-number" data-line-number="11"></td>
        <td id="LC11" class="blob-code blob-code-inner js-file-line">add wave <span class="pl-k">-</span>noupdate <span class="pl-k">-</span>color {Slate Blue} <span class="pl-k">-</span>itemcolor {Slate Blue} <span class="pl-k">-</span>label {polyphony: note_2 out} <span class="pl-k">-</span>radix hexadecimal /tb_synthesizer/i_TOP_LEVEL/i_MIDI_INTERFACE/i_polyphone_out/note_2</td>
      </tr>
      <tr>
        <td id="L12" class="blob-num js-line-number" data-line-number="12"></td>
        <td id="LC12" class="blob-code blob-code-inner js-file-line">add wave <span class="pl-k">-</span>noupdate <span class="pl-k">-</span>color {Slate Blue} <span class="pl-k">-</span>itemcolor {Slate Blue} <span class="pl-k">-</span>label {poliphony: note_3 out} <span class="pl-k">-</span>radix hexadecimal /tb_synthesizer/i_TOP_LEVEL/i_MIDI_INTERFACE/i_polyphone_out/note_3</td>
      </tr>
      <tr>
        <td id="L13" class="blob-num js-line-number" data-line-number="13"></td>
        <td id="LC13" class="blob-code blob-code-inner js-file-line">add wave <span class="pl-k">-</span>noupdate <span class="pl-k">-</span>color {Slate Blue} <span class="pl-k">-</span>itemcolor {Slate Blue} <span class="pl-k">-</span>label {poliphony: note_4 out} <span class="pl-k">-</span>radix hexadecimal /tb_synthesizer/i_TOP_LEVEL/i_MIDI_INTERFACE/i_polyphone_out/note_4</td>
      </tr>
      <tr>
        <td id="L14" class="blob-num js-line-number" data-line-number="14"></td>
        <td id="LC14" class="blob-code blob-code-inner js-file-line">add wave <span class="pl-k">-</span>noupdate <span class="pl-k">-</span>color {Slate Blue} <span class="pl-k">-</span>itemcolor {Slate Blue} <span class="pl-k">-</span>label {poliphony: note_5 out} <span class="pl-k">-</span>radix hexadecimal /tb_synthesizer/i_TOP_LEVEL/i_MIDI_INTERFACE/i_polyphone_out/note_5</td>
      </tr>
      <tr>
        <td id="L15" class="blob-num js-line-number" data-line-number="15"></td>
        <td id="LC15" class="blob-code blob-code-inner js-file-line">add wave -noupdate -color {Slate Blue} -itemcolor {Slate Blue} -label {midi interface: note_out} -radix hexadecimal -childformat {{/tb_synthesizer/i_TOP_LEVEL/i_MIDI_INTERFACE/note_o(0) -radix hexadecimal} {/tb_synthesizer/i_TOP_LEVEL/i_MIDI_INTERFACE/note_o(1) -radix hexadecimal} {/tb_synthesizer/i_TOP_LEVEL/i_MIDI_INTERFACE/note_o(2) -radix hexadecimal} {/tb_synthesizer/i_TOP_LEVEL/i_MIDI_INTERFACE/note_o(3) -radix hexadecimal} {/tb_synthesizer/i_TOP_LEVEL/i_MIDI_INTERFACE/note_o(4) -radix hexadecimal} {/tb_synthesizer/i_TOP_LEVEL/i_MIDI_INTERFACE/note_o(5) -radix hexadecimal} {/tb_synthesizer/i_TOP_LEVEL/i_MIDI_INTERFACE/note_o(6) -radix hexadecimal} {/tb_synthesizer/i_TOP_LEVEL/i_MIDI_INTERFACE/note_o(7) -radix hexadecimal} {/tb_synthesizer/i_TOP_LEVEL/i_MIDI_INTERFACE/note_o(8) -radix hexadecimal} {/tb_synthesizer/i_TOP_LEVEL/i_MIDI_INTERFACE/note_o(9) -radix hexadecimal}} -expand -subitemconfig {/tb_synthesizer/i_TOP_LEVEL/i_MIDI_INTERFACE/note_o(0) {-color {Slate Blue} -height 17 -itemcolor {Slate Blue} -radix hexadecimal} /tb_synthesizer/i_TOP_LEVEL/i_MIDI_INTERFACE/note_o(1) {-color {Slate Blue} -height 17 -itemcolor {Slate Blue} -radix hexadecimal} /tb_synthesizer/i_TOP_LEVEL/i_MIDI_INTERFACE/note_o(2) {-color {Slate Blue} -height 17 -itemcolor {Slate Blue} -radix hexadecimal} /tb_synthesizer/i_TOP_LEVEL/i_MIDI_INTERFACE/note_o(3) {-color {Slate Blue} -height 17 -itemcolor {Slate Blue} -radix hexadecimal} /tb_synthesizer/i_TOP_LEVEL/i_MIDI_INTERFACE/note_o(4) {-color {Slate Blue} -height 17 -itemcolor {Slate Blue} -radix hexadecimal} /tb_synthesizer/i_TOP_LEVEL/i_MIDI_INTERFACE/note_o(5) {-color {Slate Blue} -height 17 -itemcolor {Slate Blue} -radix hexadecimal} /tb_synthesizer/i_TOP_LEVEL/i_MIDI_INTERFACE/note_o(6) {-color {Slate Blue} -height 17 -itemcolor {Slate Blue} -radix hexadecimal} /tb_synthesizer/i_TOP_LEVEL/i_MIDI_INTERFACE/note_o(7) {-color {Slate Blue} -height 17 -itemcolor {Slate Blue} -radix hexadecimal} /tb_synthesizer/i_TOP_LEVEL/i_MIDI_INTERFACE/note_o(8) {-color {Slate Blue} -height 17 -itemcolor {Slate Blue} -radix hexadecimal} /tb_synthesizer/i_TOP_LEVEL/i_MIDI_INTERFACE/note_o(9) {-color {Slate Blue} -height 17 -itemcolor {Slate Blue} -radix hexadecimal}} /tb_synthesizer/i_TOP_LEVEL/i_MIDI_INTERFACE/note_o</td>
      </tr>
      <tr>
        <td id="L16" class="blob-num js-line-number" data-line-number="16"></td>
        <td id="LC16" class="blob-code blob-code-inner js-file-line">add wave <span class="pl-k">-</span>noupdate <span class="pl-k">-</span>color Gold <span class="pl-k">-</span>itemcolor Gold <span class="pl-k">-</span>label {decoder_0: note_in} <span class="pl-k">-</span>radix hexadecimal /tb_synthesizer/i_TOP_LEVEL/TONE_DECODER_INST_0/notes_keyboard</td>
      </tr>
      <tr>
        <td id="L17" class="blob-num js-line-number" data-line-number="17"></td>
        <td id="LC17" class="blob-code blob-code-inner js-file-line">add wave <span class="pl-k">-</span>noupdate <span class="pl-k">-</span>color Gold <span class="pl-k">-</span>itemcolor Gold <span class="pl-k">-</span>label {decoder_0: NUM_notes} /tb_synthesizer/i_TOP_LEVEL/TONE_DECODER_INST_0/N_CUM_keyboard</td>
      </tr>
      <tr>
        <td id="L18" class="blob-num js-line-number" data-line-number="18"></td>
        <td id="LC18" class="blob-code blob-code-inner js-file-line">add wave <span class="pl-k">-</span>noupdate <span class="pl-k">-</span>color Gold <span class="pl-k">-</span>itemcolor Gold <span class="pl-k">-</span>label {decoder_0: NUM_switch} /tb_synthesizer/i_TOP_LEVEL/TONE_DECODER_INST_0/N_CUM_taster</td>
      </tr>
      <tr>
        <td id="L19" class="blob-num js-line-number" data-line-number="19"></td>
        <td id="LC19" class="blob-code blob-code-inner js-file-line">add wave <span class="pl-k">-</span>noupdate <span class="pl-k">-</span>color Gold <span class="pl-k">-</span>itemcolor Gold <span class="pl-k">-</span>label {decoder_0: note on_out} /tb_synthesizer/i_TOP_LEVEL/TONE_DECODER_INST_0/tone_on_o</td>
      </tr>
      <tr>
        <td id="L20" class="blob-num js-line-number" data-line-number="20"></td>
        <td id="LC20" class="blob-code blob-code-inner js-file-line">add wave <span class="pl-k">-</span>noupdate <span class="pl-k">-</span>color Coral <span class="pl-k">-</span>itemcolor Coral <span class="pl-k">-</span>label {decoder_1: note_on_out} <span class="pl-k">-</span>radix hexadecimal /tb_synthesizer/i_TOP_LEVEL/TONE_DECODER_INST_1/tone_on_o</td>
      </tr>
      <tr>
        <td id="L21" class="blob-num js-line-number" data-line-number="21"></td>
        <td id="LC21" class="blob-code blob-code-inner js-file-line">add wave <span class="pl-k">-</span>noupdate <span class="pl-k">-</span>color Coral <span class="pl-k">-</span>itemcolor Coral <span class="pl-k">-</span>label {decoder_1: NUM_switch} <span class="pl-k">-</span>radix hexadecimal /tb_synthesizer/i_TOP_LEVEL/TONE_DECODER_INST_1/N_CUM_taster</td>
      </tr>
      <tr>
        <td id="L22" class="blob-num js-line-number" data-line-number="22"></td>
        <td id="LC22" class="blob-code blob-code-inner js-file-line">add wave <span class="pl-k">-</span>noupdate <span class="pl-k">-</span>color Coral <span class="pl-k">-</span>itemcolor Coral <span class="pl-k">-</span>label {decoder_1: NUM_notes} <span class="pl-k">-</span>radix hexadecimal /tb_synthesizer/i_TOP_LEVEL/TONE_DECODER_INST_1/N_CUM_keyboard</td>
      </tr>
      <tr>
        <td id="L23" class="blob-num js-line-number" data-line-number="23"></td>
        <td id="LC23" class="blob-code blob-code-inner js-file-line">add wave <span class="pl-k">-</span>noupdate <span class="pl-k">-</span>color Coral <span class="pl-k">-</span>itemcolor Coral <span class="pl-k">-</span>label {decoder_1: note_in} <span class="pl-k">-</span>radix hexadecimal /tb_synthesizer/i_TOP_LEVEL/TONE_DECODER_INST_1/notes_keyboard</td>
      </tr>
      <tr>
        <td id="L24" class="blob-num js-line-number" data-line-number="24"></td>
        <td id="LC24" class="blob-code blob-code-inner js-file-line">add wave <span class="pl-k">-</span>noupdate <span class="pl-k">-</span>color Gold <span class="pl-k">-</span>itemcolor Gold <span class="pl-k">-</span>label {decoder_2: note_in} <span class="pl-k">-</span>radix hexadecimal /tb_synthesizer/i_TOP_LEVEL/TONE_DECODER_INST_2/notes_keyboard</td>
      </tr>
      <tr>
        <td id="L25" class="blob-num js-line-number" data-line-number="25"></td>
        <td id="LC25" class="blob-code blob-code-inner js-file-line">add wave <span class="pl-k">-</span>noupdate <span class="pl-k">-</span>color Gold <span class="pl-k">-</span>itemcolor Gold <span class="pl-k">-</span>label {decoder_2: NUM_notes} /tb_synthesizer/i_TOP_LEVEL/TONE_DECODER_INST_2/N_CUM_keyboard</td>
      </tr>
      <tr>
        <td id="L26" class="blob-num js-line-number" data-line-number="26"></td>
        <td id="LC26" class="blob-code blob-code-inner js-file-line">add wave <span class="pl-k">-</span>noupdate <span class="pl-k">-</span>color Gold <span class="pl-k">-</span>itemcolor Gold <span class="pl-k">-</span>label {decoder_2: note_on out} <span class="pl-k">-</span>radix hexadecimal /tb_synthesizer/i_TOP_LEVEL/TONE_DECODER_INST_2/tone_on_o</td>
      </tr>
      <tr>
        <td id="L27" class="blob-num js-line-number" data-line-number="27"></td>
        <td id="LC27" class="blob-code blob-code-inner js-file-line">add wave <span class="pl-k">-</span>noupdate <span class="pl-k">-</span>color Coral <span class="pl-k">-</span>itemcolor Coral <span class="pl-k">-</span>label {decoder_3: note_on out} <span class="pl-k">-</span>radix hexadecimal /tb_synthesizer/i_TOP_LEVEL/TONE_DECODER_INST_3/tone_on_o</td>
      </tr>
      <tr>
        <td id="L28" class="blob-num js-line-number" data-line-number="28"></td>
        <td id="LC28" class="blob-code blob-code-inner js-file-line">add wave <span class="pl-k">-</span>noupdate <span class="pl-k">-</span>color Coral <span class="pl-k">-</span>itemcolor Coral <span class="pl-k">-</span>label {decoder_3: NUM_notes} <span class="pl-k">-</span>radix hexadecimal /tb_synthesizer/i_TOP_LEVEL/TONE_DECODER_INST_3/N_CUM_keyboard</td>
      </tr>
      <tr>
        <td id="L29" class="blob-num js-line-number" data-line-number="29"></td>
        <td id="LC29" class="blob-code blob-code-inner js-file-line">add wave <span class="pl-k">-</span>noupdate <span class="pl-k">-</span>color Coral <span class="pl-k">-</span>itemcolor Coral <span class="pl-k">-</span>label {decoder_3: note_in} <span class="pl-k">-</span>radix hexadecimal /tb_synthesizer/i_TOP_LEVEL/TONE_DECODER_INST_3/notes_keyboard</td>
      </tr>
      <tr>
        <td id="L30" class="blob-num js-line-number" data-line-number="30"></td>
        <td id="LC30" class="blob-code blob-code-inner js-file-line">add wave <span class="pl-k">-</span>noupdate <span class="pl-k">-</span>color Gold <span class="pl-k">-</span>itemcolor Gold <span class="pl-k">-</span>label {decoder_4: note_in} <span class="pl-k">-</span>radix hexadecimal /tb_synthesizer/i_TOP_LEVEL/TONE_DECODER_INST_4/notes_keyboard</td>
      </tr>
      <tr>
        <td id="L31" class="blob-num js-line-number" data-line-number="31"></td>
        <td id="LC31" class="blob-code blob-code-inner js-file-line">add wave <span class="pl-k">-</span>noupdate <span class="pl-k">-</span>color Gold <span class="pl-k">-</span>itemcolor Gold <span class="pl-k">-</span>label {decoder_4: NUM_note} <span class="pl-k">-</span>radix hexadecimal /tb_synthesizer/i_TOP_LEVEL/TONE_DECODER_INST_4/N_CUM_keyboard</td>
      </tr>
      <tr>
        <td id="L32" class="blob-num js-line-number" data-line-number="32"></td>
        <td id="LC32" class="blob-code blob-code-inner js-file-line">add wave <span class="pl-k">-</span>noupdate <span class="pl-k">-</span>color Gold <span class="pl-k">-</span>itemcolor Gold <span class="pl-k">-</span>label {decoder_4: note on out} /tb_synthesizer/i_TOP_LEVEL/TONE_DECODER_INST_4/tone_on_o</td>
      </tr>
      <tr>
        <td id="L33" class="blob-num js-line-number" data-line-number="33"></td>
        <td id="LC33" class="blob-code blob-code-inner js-file-line">add wave <span class="pl-k">-</span>noupdate <span class="pl-k">-</span>color Coral <span class="pl-k">-</span>itemcolor Coral <span class="pl-k">-</span>label {decoder_5: note on out} <span class="pl-k">-</span>radix hexadecimal /tb_synthesizer/i_TOP_LEVEL/TONE_DECODER_INST_5/tone_on_o</td>
      </tr>
      <tr>
        <td id="L34" class="blob-num js-line-number" data-line-number="34"></td>
        <td id="LC34" class="blob-code blob-code-inner js-file-line">add wave <span class="pl-k">-</span>noupdate <span class="pl-k">-</span>color Coral <span class="pl-k">-</span>itemcolor Coral <span class="pl-k">-</span>label {decoder_5: note_in} <span class="pl-k">-</span>radix hexadecimal /tb_synthesizer/i_TOP_LEVEL/TONE_DECODER_INST_5/notes_keyboard</td>
      </tr>
      <tr>
        <td id="L35" class="blob-num js-line-number" data-line-number="35"></td>
        <td id="LC35" class="blob-code blob-code-inner js-file-line">add wave <span class="pl-k">-</span>noupdate <span class="pl-k">-</span>color Coral <span class="pl-k">-</span>itemcolor Coral <span class="pl-k">-</span>label {decoder_5: NUM_note} <span class="pl-k">-</span>radix hexadecimal /tb_synthesizer/i_TOP_LEVEL/TONE_DECODER_INST_5/N_CUM_keyboard</td>
      </tr>
      <tr>
        <td id="L36" class="blob-num js-line-number" data-line-number="36"></td>
        <td id="LC36" class="blob-code blob-code-inner js-file-line">add wave <span class="pl-k">-</span>noupdate <span class="pl-k">-</span>color {Cadet Blue} <span class="pl-k">-</span>itemcolor {Cadet Blue} <span class="pl-k">-</span>label {fm_0: data_out} <span class="pl-k">-</span>radix hexadecimal /tb_synthesizer/i_TOP_LEVEL/FM_SYNTH_INST_0/data_o</td>
      </tr>
      <tr>
        <td id="L37" class="blob-num js-line-number" data-line-number="37"></td>
        <td id="LC37" class="blob-code blob-code-inner js-file-line">add wave <span class="pl-k">-</span>noupdate <span class="pl-k">-</span>color {Dark Slate Gray} <span class="pl-k">-</span>itemcolor {Dark Slate Gray} <span class="pl-k">-</span>label {fm_1: data_out} <span class="pl-k">-</span>radix hexadecimal /tb_synthesizer/i_TOP_LEVEL/FM_SYNTH_INST_2/data_o</td>
      </tr>
      <tr>
        <td id="L38" class="blob-num js-line-number" data-line-number="38"></td>
        <td id="LC38" class="blob-code blob-code-inner js-file-line">add wave <span class="pl-k">-</span>noupdate <span class="pl-k">-</span>color {Cadet Blue} <span class="pl-k">-</span>itemcolor {Cadet Blue} <span class="pl-k">-</span>label {fm_2: data_out} <span class="pl-k">-</span>radix hexadecimal /tb_synthesizer/i_TOP_LEVEL/FM_SYNTH_INST_3/data_o</td>
      </tr>
      <tr>
        <td id="L39" class="blob-num js-line-number" data-line-number="39"></td>
        <td id="LC39" class="blob-code blob-code-inner js-file-line">add wave <span class="pl-k">-</span>noupdate <span class="pl-k">-</span>color {Dark Slate Gray} <span class="pl-k">-</span>itemcolor {Dark Slate Gray} <span class="pl-k">-</span>label {fm_3: data out} <span class="pl-k">-</span>radix hexadecimal /tb_synthesizer/i_TOP_LEVEL/FM_SYNTH_INST_4/data_o</td>
      </tr>
      <tr>
        <td id="L40" class="blob-num js-line-number" data-line-number="40"></td>
        <td id="LC40" class="blob-code blob-code-inner js-file-line">add wave <span class="pl-k">-</span>noupdate <span class="pl-k">-</span>color {Cadet Blue} <span class="pl-k">-</span>itemcolor {Cadet Blue} <span class="pl-k">-</span>label {fm_4: data_out} <span class="pl-k">-</span>radix hexadecimal /tb_synthesizer/i_TOP_LEVEL/FM_SYNTH_INST_5/data_o</td>
      </tr>
      <tr>
        <td id="L41" class="blob-num js-line-number" data-line-number="41"></td>
        <td id="LC41" class="blob-code blob-code-inner js-file-line">add wave <span class="pl-k">-</span>noupdate <span class="pl-k">-</span>color {Dark Slate Gray} <span class="pl-k">-</span>itemcolor {Dark Slate Gray} <span class="pl-k">-</span>label {fm_5: data out} <span class="pl-k">-</span>radix hexadecimal /tb_synthesizer/i_TOP_LEVEL/FM_SYNTH_INST_6/data_o</td>
      </tr>
      <tr>
        <td id="L42" class="blob-num js-line-number" data-line-number="42"></td>
        <td id="LC42" class="blob-code blob-code-inner js-file-line">TreeUpdate [SetDefaultTree]</td>
      </tr>
      <tr>
        <td id="L43" class="blob-num js-line-number" data-line-number="43"></td>
        <td id="LC43" class="blob-code blob-code-inner js-file-line">WaveRestoreCursors {{Cursor 1} {0 ns} 0}</td>
      </tr>
      <tr>
        <td id="L44" class="blob-num js-line-number" data-line-number="44"></td>
        <td id="LC44" class="blob-code blob-code-inner js-file-line">quietly wave cursor active 1</td>
      </tr>
      <tr>
        <td id="L45" class="blob-num js-line-number" data-line-number="45"></td>
        <td id="LC45" class="blob-code blob-code-inner js-file-line">configure wave <span class="pl-k">-</span>namecolwidth 162</td>
      </tr>
      <tr>
        <td id="L46" class="blob-num js-line-number" data-line-number="46"></td>
        <td id="LC46" class="blob-code blob-code-inner js-file-line">configure wave <span class="pl-k">-</span>valuecolwidth 48</td>
      </tr>
      <tr>
        <td id="L47" class="blob-num js-line-number" data-line-number="47"></td>
        <td id="LC47" class="blob-code blob-code-inner js-file-line">configure wave <span class="pl-k">-</span>justifyvalue left</td>
      </tr>
      <tr>
        <td id="L48" class="blob-num js-line-number" data-line-number="48"></td>
        <td id="LC48" class="blob-code blob-code-inner js-file-line">configure wave <span class="pl-k">-</span>signalnamewidth 0</td>
      </tr>
      <tr>
        <td id="L49" class="blob-num js-line-number" data-line-number="49"></td>
        <td id="LC49" class="blob-code blob-code-inner js-file-line">configure wave <span class="pl-k">-</span>snapdistance 10</td>
      </tr>
      <tr>
        <td id="L50" class="blob-num js-line-number" data-line-number="50"></td>
        <td id="LC50" class="blob-code blob-code-inner js-file-line">configure wave <span class="pl-k">-</span>datasetprefix 0</td>
      </tr>
      <tr>
        <td id="L51" class="blob-num js-line-number" data-line-number="51"></td>
        <td id="LC51" class="blob-code blob-code-inner js-file-line">configure wave <span class="pl-k">-</span>rowmargin 4</td>
      </tr>
      <tr>
        <td id="L52" class="blob-num js-line-number" data-line-number="52"></td>
        <td id="LC52" class="blob-code blob-code-inner js-file-line">configure wave <span class="pl-k">-</span>childrowmargin 2</td>
      </tr>
      <tr>
        <td id="L53" class="blob-num js-line-number" data-line-number="53"></td>
        <td id="LC53" class="blob-code blob-code-inner js-file-line">configure wave <span class="pl-k">-</span>gridoffset 0</td>
      </tr>
      <tr>
        <td id="L54" class="blob-num js-line-number" data-line-number="54"></td>
        <td id="LC54" class="blob-code blob-code-inner js-file-line">configure wave <span class="pl-k">-</span>gridperiod 1</td>
      </tr>
      <tr>
        <td id="L55" class="blob-num js-line-number" data-line-number="55"></td>
        <td id="LC55" class="blob-code blob-code-inner js-file-line">configure wave <span class="pl-k">-</span>griddelta 40</td>
      </tr>
      <tr>
        <td id="L56" class="blob-num js-line-number" data-line-number="56"></td>
        <td id="LC56" class="blob-code blob-code-inner js-file-line">configure wave <span class="pl-k">-</span>timeline 0</td>
      </tr>
      <tr>
        <td id="L57" class="blob-num js-line-number" data-line-number="57"></td>
        <td id="LC57" class="blob-code blob-code-inner js-file-line">configure wave <span class="pl-k">-</span>timelineunits us</td>
      </tr>
      <tr>
        <td id="L58" class="blob-num js-line-number" data-line-number="58"></td>
        <td id="LC58" class="blob-code blob-code-inner js-file-line">update</td>
      </tr>
      <tr>
        <td id="L59" class="blob-num js-line-number" data-line-number="59"></td>
        <td id="LC59" class="blob-code blob-code-inner js-file-line">WaveRestoreZoom {0 ns} {5775104 ns}</td>
      </tr>
</table>

  </div>

</div>

<a href="#jump-to-line" rel="facebox[.linejump]" data-hotkey="l" style="display:none">Jump to Line</a>
<div id="jump-to-line" style="display:none">
  <!-- </textarea> --><!-- '"` --><form accept-charset="UTF-8" action="" class="js-jump-to-line-form" method="get"><div style="margin:0;padding:0;display:inline"><input name="utf8" type="hidden" value="&#x2713;" /></div>
    <input class="linejump-input js-jump-to-line-field" type="text" placeholder="Jump to line&hellip;" aria-label="Jump to line" autofocus>
    <button type="submit" class="btn">Go</button>
</form></div>

  </div>
  <div class="modal-backdrop"></div>
</div>

    </div>
  </div>

    </div>

        <div class="container">
  <div class="site-footer" role="contentinfo">
    <ul class="site-footer-links right">
        <li><a href="https://status.github.com/" data-ga-click="Footer, go to status, text:status">Status</a></li>
      <li><a href="https://developer.github.com" data-ga-click="Footer, go to api, text:api">API</a></li>
      <li><a href="https://training.github.com" data-ga-click="Footer, go to training, text:training">Training</a></li>
      <li><a href="https://shop.github.com" data-ga-click="Footer, go to shop, text:shop">Shop</a></li>
        <li><a href="https://github.com/blog" data-ga-click="Footer, go to blog, text:blog">Blog</a></li>
        <li><a href="https://github.com/about" data-ga-click="Footer, go to about, text:about">About</a></li>
        <li><a href="https://github.com/pricing" data-ga-click="Footer, go to pricing, text:pricing">Pricing</a></li>

    </ul>

    <a href="https://github.com" aria-label="Homepage">
      <span class="mega-octicon octicon-mark-github" title="GitHub"></span>
</a>
    <ul class="site-footer-links">
      <li>&copy; 2015 <span title="0.02996s from github-fe142-cp1-prd.iad.github.net">GitHub</span>, Inc.</li>
        <li><a href="https://github.com/site/terms" data-ga-click="Footer, go to terms, text:terms">Terms</a></li>
        <li><a href="https://github.com/site/privacy" data-ga-click="Footer, go to privacy, text:privacy">Privacy</a></li>
        <li><a href="https://github.com/security" data-ga-click="Footer, go to security, text:security">Security</a></li>
        <li><a href="https://github.com/contact" data-ga-click="Footer, go to contact, text:contact">Contact</a></li>
        <li><a href="https://help.github.com" data-ga-click="Footer, go to help, text:help">Help</a></li>
    </ul>
  </div>
</div>



    
    
    

    <div id="ajax-error-message" class="flash flash-error">
      <span class="octicon octicon-alert"></span>
      <button type="button" class="flash-close js-flash-close js-ajax-error-dismiss" aria-label="Dismiss error">
        <span class="octicon octicon-x"></span>
      </button>
      Something went wrong with that request. Please try again.
    </div>


      <script crossorigin="anonymous" src="https://assets-cdn.github.com/assets/frameworks-b7c9523d93e6cd0235a0a8b7d1a691f7909d3834cd9c9caa7b1674ba508b644c.js"></script>
      <script async="async" crossorigin="anonymous" src="https://assets-cdn.github.com/assets/github-72578de8b1f2fde1c0a710cc5c6b7f7689e940c0b0988275850c25f75af5d00a.js"></script>
      
      
      
    <div class="js-stale-session-flash stale-session-flash flash flash-warn flash-banner hidden">
      <span class="octicon octicon-alert"></span>
      <span class="signed-in-tab-flash">You signed in with another tab or window. <a href="">Reload</a> to refresh your session.</span>
      <span class="signed-out-tab-flash">You signed out in another tab or window. <a href="">Reload</a> to refresh your session.</span>
    </div>
  </body>
</html>

>>>>>>> branch_is_working
