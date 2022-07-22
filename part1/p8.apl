#!/usr/bin/dyalogscript

p8←{(,⍵)⊂⍨1+@(⌊/(,⍵)⍳⍺)+1,(⍴,⍵)/0}

⎕← 'do' p8 'Hello world'
⎕← 'KEI' p8 ⎕A
⎕← (⌽⎕A) p8 ⎕A
⎕← ⎕D p8 ⎕A
⎕← ⎕D p8 'Q'
⎕← ⎕A p8 'Q'
