100 Rem LOAD IMAGE. CONVERT TO ASM.
105 Dim I$(5)
110 Graphics 7+16
115 Setcolor 4,0,14
120 Setcolor 0,0,12
125 Setcolor 1,12,12
130 Setcolor 2,15,6
135 Open #1,4,0,"H4:image.asc"
140   For Y=0 To 95
145   Position 0,Y
150     For X=0 To 159
155     Get #1,P
160     If P=Asc("
") Then Goto 155
165     Position X,Y:Put #6,P
170     Next X
175   Next Y
180 Close #1
185 Open #1,8,0,"H9:image.asm"
190 Dlstart=Dpeek(560)
195 Grend=Dpeek(88)+(40*96)
200   For L=Dlstart To Grend Step 16
205   Print #1;"   .byte ";
210     For D=0 To 15
215     If D+L>Grend Then Goto 245
220     I$=Hex$(Peek(D+L))
225     Print #1;"$";I$(3,4);
230       If D<15 And D+L<Grend:Print #1;",";
235       Else :Print #1
240       Endif 
245     Next D
250   Next L
255 Close #1
