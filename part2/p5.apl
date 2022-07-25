#!/usr/bin/dyalogscript

⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝
⍝ GLOBAL VARIABLES
⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝

⎕←Original←⎕UCS 32+⍳85
Z85←'0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ.-:+=^!/*?&<>()[]{}@%$#'

⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝
⍝ SOLUTION
⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝

∇ res ← variant Base85 data; clean
  :If ∧/data∊¯1+⍳256                ⍝ Check if the data consisists of valid numbers (0-255)
    res←variant Base85Encode data
  :Else                             ⍝ Otherwise, treat it like a vector of Base85 symbols
    clean←(data∊variant)/data       ⍝ Strip all non-Base85 characters
    res←variant Base85Decode clean
  :Endif
∇

∇ res ← variant Base85Encode data; padded; base10; base85
  padding←(4×⌈(÷4)×⍴data)                  ⍝ Calculate total padded size
  padded←padding↑data                      ⍝ Pad the data with 0s to a length divisible by 4
  base10←256⊥¨((⍴padded)⍴1 0 0 0)⊂padded   ⍝ Decode groups of 4 from base 256 to base 10
  base85←,↑(5⍴¨85)⊤¨base10                 ⍝ Encode to base 85, taking 5 digits of output
  res←((⍴data)-padding)↓variant[1+base85]  ⍝ Map the base 85 numbers to Base85 characters, dropping extras
∇

∇ res ← variant Base85Decode data
  padding←(5|5-5|⍴data)                    ⍝ Calculate amount of padding required (different from Base85Encode logic)
  padded←data,padding⍴¯1↑variant           ⍝ Pad the data with the last element of the charset to a length divisible by 5
  base85←¯1+variant⍳padded                 ⍝ Map the Base85 characters to base 85 numbers
  base10←85⊥¨((⍴base85)⍴1 0 0 0 0)⊂base85  ⍝ Decode groups of 5 from base 85 to base 10
  res←(-padding)↓,↑(4⍴¨256)⊤¨base10        ⍝ Encode to base 256, taking 4 digits of output, and dropping extras
∇

⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝
⍝ TEST CASES
⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝

⎕← Original Base85 ⎕UCS 'Hello World'
⎕← ⎕UCS Original Base85 '87cURD]i,"Ebo7'
⎕← Z85 Base85 ⎕UCS 'Hello World'
⎕← Original Base85 0 0 0 0 0 0
⎕← Original Base85 8⍴'!'
⎕← 'Hello World' ≡ ⎕UCS Z85 Base85 Z85 Base85 ⎕UCS 'Hello World'
⎕← Z85 (Base85⍣2 ≡ ⊢) ⎕UCS 'Hello'
⎕← ⎕UCS Original Base85 '7!W 3WD ⍴ eC1 ⌈ Y:eU'
