#!/usr/bin/dyalogscript

Original←⎕UCS 32+⍳85
Z85←'0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ.-:+=^!/*?&<>()[]{}@%$#'

∇ res←variant Base85 data
  :IF ∧/data∊variant      ⍝ Check if the data is all Base85 symbols
    res←'CHARACTER'       ⍝ Decode if so
  :ElseIf ∧/data∊¯1+⍳256  ⍝ Check if the data is all valid numbers
    res←'NUMERIC'         ⍝ Encode if so
  :Else                   ⍝ Otherwise, raise an error
   'INVALID INPUT DATA' ⎕SIGNAL 6
  :Endif
∇
