#!/usr/bin/dyalogscript

⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝
⍝ SOLUTION: PART 1
⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝

∇ res←candidates Ballot voters; rankings; abs; shuffled; unique
  ⍝ Generate the preliminary list (1 2 3 ... candidates) or (1 2 3 ... n 0 0 0) to use as rankings
  :If (×candidates)=0
    ⎕SIGNAL 11 
  :ElseIf (×candidates)=1
    ⍝ All the candidates must be ranked    
    rankings←voters⍴⊂⍳candidates
  :Else
    abs←|candidates
    ⍝ Pick a random number ran from 0 to abs-1 representing the number of empty choices
    ⍝ Then concatenate ⍳(not empty choices) to ran/0 for each voter
    rankings←{⍵+(⍳(abs-ran)),(ran←¯1+?abs)/0}¨voters⍴⊂abs⍴0
  :EndIf
  
  ⍝ An alternative solution which covers both the cases (|candidates)=1 is
  ⍝ {⍵+(⍳((|v2)-ran)),(ran←(1-0⌈×v2)×¯1+?|v2)/0}¨3⍴⊂(|v2)⍴0
  ⍝ However, I though the If..ElseIf..Else construct was cleaner.

  ⍝ Shuffle the rankings. More simply: ballot[(⍴ballot)?⍴ballot] for each ballot in rankings
  shuffled←({⊂?⍨⍴⍵}⌷⊢)¨rankings
  
  ⍝ Generate table of rankings
  unique←∪shuffled
  res←↑[1](+/unique∘.≡shuffled)(unique)
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

⍝⎕← IRV b
⍝⎕← IRV b2
⍝⎕← b3←300 200 100 50 50 100,⍪↓6 4⍴1 0 2 0 0 1 0 2 2 0 0 1 0 2 1 0 0 2 0 1 3 2 1 0
⍝⎕← IRV b3
⍝⎕← IRV ¯10 Ballot 200000
