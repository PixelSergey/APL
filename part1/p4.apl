#!/usr/bin/dyalogscript

p4←{0⌈⊃⌈/⍴¨⍵⊆,⍵}

⎕← p4 1 1 1 0 1 1 0 0 1 1 1 1 0
⎕← p4 ⍬
⎕← p4 1
⎕← p4 0
⎕← p4 12/0 1 0 1
