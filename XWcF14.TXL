100 Rem XWCF14 CONVERT TO GR MODE 7
105 Dim I$(161)
110 Graphics 7+16
115 Setcolor 4,0,14
120 Setcolor 0,0,12
125 Setcolor 1,12,12
130 Setcolor 2,15,6
135 Open #1,4,0,"H4:XWcF14.asc"
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
185 Open #1,8,0,"H4:XWcF14.xex"
190 Put #1,$ff:Put #1,$ff
195 Put #1,Peek(560):Put #1,Peek(561)
200 Scn=Dpeek(87)+(40*96)
205 Put #1,Scn&$ff
210 Put #1,(Scn&$ff00)/256
215 Bput #1,Dpeek(560),Scn
220 Rem $2C4 TO $2C8
225 Put #1,$c4:Put #1,$02
230 Put #1,$c8:Put #1,$02
235 Bput #1,$02c4,$02c8
240 Rem DISPLAY LIST $230 - $231
245 Put #1,$30:Put #1,$02
250 Put #1,$31:Put #1,$02
255 Put #1,Peek(560):Put #1,Peek(561)
260 Rem CODE TO LOOP FOREVER
265 Rem JMP $00FD
270 Put #1,$fd:Put #1,$00
275 Put #1,$ff:Put #1,$00
280 Put #1,$4c:Put #1,$fd:Put #1,$00
285 Rem TELL DOS TO EXECUTE.
290 Rem DPOKE $2E0, $2E1
295 Put #1,$e0:Put #1,$02
300 Put #1,$e1:Put #1,$02
305 Put #1,$fd:Put #1,$00
310 Close #1
