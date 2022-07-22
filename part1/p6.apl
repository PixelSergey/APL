#!/usr/bin/dyalogscript

p6←{⍵-∘.⌈⍨|(-⍵)+⍳0⌈¯1+2×⍵}

⎕← p6 3
⎕← p6 5
⎕← p6 1
⎕← p6 0
⎕← ⍴p6 0