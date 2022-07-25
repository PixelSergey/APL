#!/usr/bin/dyalogscript

⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝
⍝ SOLUTION: PART 1
⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝

∇ res←candidates Ballot voters
  'TODO'
∇

⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝
⍝ SOLUTION: PART 2
⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝

∇ res←IRV ballot
  'TODO'
∇

⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝
⍝ TEST CASES
⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝

⎕← b←3 Ballot 150
⎕← ('#',b[;1]),'Bob' 'Mary' 'Larry' ⍪↑b[;2]
⎕← b2←¯3 Ballot 150
⎕← ('#',b2[;1]),'Bob' 'Mary' 'Larry' ⍪↑b2[;2]
⎕← 1 Ballot 150

⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝

⎕← IRV b
⎕← IRV b2
⎕← b3←300 200 100 50 50 100,⍪↓6 4⍴1 0 2 0 0 1 0 2 2 0 0 1 0 2 1 0 0 2 0 1 3 2 1 0
⎕← IRV b3
⎕← IRV ¯10 Ballot 200000
