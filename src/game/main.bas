1 ' ------------------------------------'
1 '               MAIN                  '
1 ' ------------------------------------'


1 ' neceswitamos decirle a nuestro juego don de hay una pared: una casa: etc'
1 ' Como son 256x212px y heos dibujado cuadros de 16 por 16px necesitamos un mapa
1 '' de 13 filas y 16 columnas recordemos que la posición 1 tambien s cuenta en un array'
1 ' inicializamos el mapa'
5 OPEN"grp:"AS#1: defint a-z
10 gosub 30000
20 dim m(12,15,mm1)




10010 gosub 30100
10020 'COLOR15:PRESET(0,10):PRINT#1,"Mapa leido"



20000 goto 20000





1 ' ------------------------------------'
1 '               Render system         '
1 ' ------------------------------------'





1 ' ------------------------------------'
1 '               Entidades             '
1 ' ------------------------------------'

1 'mapas'
1 ' ms=mapa seleccionado'
1 ' mm=mapa maximo '
    30000 ms=0:mm=1:mt=1
30010 return


1' funcion mostrar los tiles que hemos guardado en el array
1 ' Hacemos un blucle para los mapas'
30100 'for i=0 to mm1
    1 ' ahora leemos las filas f'
    30110 for f=0 to 12
        1 ' ahora leemos las columnas c
        30120 for c=0 to 15
            30130 read a$
            30140 'PRINT#1,VAL(a$);
            30150 mt=VAL(a$)
            30160 if mt=0 then copy (c*16,f*16)-((c*16)+16,(f*16)+16),1 to (c*16,f*16) 
        30210 next c
    30220 next f
30230 'next i
30240 return



1 ' Los mapas estámn hechos con el programa tiled, incluido en el proyecto'
1 ' LEVELS'


1' level 1
30800 data 0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1
30810 data 1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1
30820 data 1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1
30830 data 1,1,1,0,1,1,1,1,1,1,1,0,1,1,1,1
30840 data 1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1
30850 data 1,1,1,1,1,0,1,1,1,1,1,1,1,1,1,1
30860 data 1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1
30870 data 1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1
30880 data 1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1
30890 data 1,0,1,1,1,1,1,1,1,1,1,1,1,1,0,1
30900 data 1,1,1,1,1,1,1,1,1,1,0,1,1,1,1,1
30910 data 1,1,1,1,0,1,1,1,1,1,1,1,1,1,1,1
30920 data 1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1







