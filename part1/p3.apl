#!/usr/bin/dyalogscript

p3←{((,⍺)~,⍵),(,⍵)~,⍺}

⎕← 'DYALOG' p3 'APL'
⎕← 'DYALOG' p3 ⊂'APL'
⎕← (2 2⍴'Hello'(⊂'World')(2 2⍴⍳4)42) p3 42 'Have a nice day'
⎕← 1 1 1 p3 2 2
