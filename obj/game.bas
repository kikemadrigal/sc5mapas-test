5 OPEN"grp:"AS#1: defint a-z
10 gosub 30000
10010 gosub 30100
10030 'print#1,"en la posición del array fila 10, columna 2 hay un "m(9,1,ms)
10040 'print#1," "
10050 'print#1,"en la posición del array fila 1, columna 4 hay un "m(0,3,ms)
10060 gosub 30300
20000 goto 20000
    30000 ms=0:mm=1:tn=-1:ts=0:tf=0:tc=0
    30010 dim m(12,15,mm-1)
30020 return
    30100 for f=0 to 12
        30120 for c=0 to 15
            30130 read a$ 
            30150 m(f,c,ms)=VAL(a$)
        30210 next c
    30220 next f
30240 return
    30300 for f=0 to 12
        30310 tn=tn+1
        30320 for c=0 to 15
            30330 'print#1,"tile"mt": "m(f,c,ms);
            30340 if m(f,c,ms) =0 then copy (0*16,0*16)-((0*16)+16,(0*16)+16),1 to (c*16,f*16)
            30350 if m(f,c,ms) =9 then copy (9*16,0*16)-((9*16)+16,(0*16)+16),1 to (c*16,f*16)
            30370 'if m(f,c,ms) =17 then print#1,"f "f", c "c
        30380 next c
        30390 'print#1,""
    30420 next f
30430 return
30800 data -1,9,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,9
30810 data -1,-1,-1,-1,-1,0,-1,9,-1,-1,-1,-1,-1,-1,-1,-1
30820 data -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1
30830 data -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,0,-1,-1,-1,-1
30840 data -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1
30850 data -1,-1,-1,-1,-1,0,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1
30860 data -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1
30870 data -1,-1,-1,-1,-1,-1,-1,9,-1,-1,-1,-1,-1,-1,-1,-1
30880 data -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1
30890 data -1,0,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,0,-1
30900 data -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,0,-1,-1,-1,-1,-1
30910 data -1,-1,-1,-1,0,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1
30920 data 9,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,9
