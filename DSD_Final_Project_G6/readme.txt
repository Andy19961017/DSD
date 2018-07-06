DSD Final Project README

* Files
  - DSD Final Project Scores.pdf: required scores
  - Present.pptx: final presentation slides
  - readme.txt: this file
  - Report.pdf: report
  - Src/Baseline: baseline with synthesis files
  - Src/Extension: three extensions with synthesis files

* Notes
  - CHIP.v is modified due to:
    1. separate design for ICACHE and DCACHE
    2. remove excess comma in CHIP port definition
  - Synthesis cycle constraint
    * Baseline: 3.8ns
    * BrPred: 4ns
    * L2Cache: 5ns
    * MultDiv: 5ns