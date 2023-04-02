#!/usr/bin/dyalogscript

p2←{+/⍺≠⍵}

⎕← 'GAGCCTACTAACGGGAT' p2 'CATCGTAATGACGGCCT' 
⎕← 'A' p2 'T'
⎕← '' p2 ''
⎕← p2 ⍨ 'CATCGTAATGACGGCCT'
