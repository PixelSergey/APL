#!/usr/bin/dyalogscript

p5←{' ⎕'[1+⊖∘.≤⍨⍳⍵]}

⎕← p5 10
⎕← p5 0
⎕← ⍴p5 0
