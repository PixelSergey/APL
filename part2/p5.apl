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

∇ res ← variant Base85Encode data; padded
  padded←(4×⌈(÷4)×⍴data)↑data              ⍝ Pad the data with 0s to a length divisible by 4
  base10←256⊥¨((⍴padded)⍴1 0 0 0)⊂padded   ⍝ Decode groups of 4 from base 256 to base 10
  base85←,↑(5⍴¨85)⊤¨base10                 ⍝ Encode to base 85, taking 5 digits of output
  res←variant[1+base85]                    ⍝ Map the base 85 numbers to Base85 characters
∇

∇ res ← variant Base85Decode data
  res←0 1 2 3 4 5
∇

⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝
⍝ TEST CASES
⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝

⎕← Original Base85 ⎕UCS 'Hello World'
⎕← Z85 Base85 ⎕UCS 'Hello World'
⎕← Original Base85 0 0 0 0 0 0
⍝⎕← Original Base85 8⍴'!'
⍝⎕← 'Hello World' ≡ ⎕UCS Z85 Base85 Z85 Base85 ⎕UCS 'Hello World'
⍝⎕← Z85 (Base85⍣2 ≡ ⊢) ⎕UCS 'Hello'
⍝⎕← ⎕UCS Original Base85 '7!W 3WD ⍴ eC1 ⌈ Y:eU'

⍝    8   7   c   U   R
⍝    24  23  67  53  50
⍝    
⍝    7   u   _   g   8
⍝    23  85  63  71  24