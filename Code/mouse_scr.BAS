'mouse and cursor test
dim integer quit, mp, mt
dim string key
CLS
MODE 1,8

mp = 2 ' assume Hobbytronik Mouse at Port 2

GUI CURSOR ON

CONTROLLER MOUSE OPEN mp, leftclick, rightclick

CLS
PRINT @(10,10);"Mouseport = ";mp
PRINT @(750,10,2)"QUIT"
SETTICK 50, myint
DO
 Key=INKEY$
LOOP UNTIL quit = 1 or key=chr$(27)
SETTICK 0, myint
CONTROLLER MOUSE CLOSE mp
pause 20
GUI CURSOR OFF
CLS
END

SUB myint
GUI CURSOR MOUSE(x,mp),MOUSE(y,mp)
PRINT @(10,30)MOUSE(x,mp);"  ";MOUSE(y,mp);"  s";MOUSE(s,mp);"  w";MOUSE(w,mp);"  "
IF MOUSE(D,mp) THEN
  PRINT @(200,30)"Doubleclick"
ELSE
  PRINT @(200,30)"            "
ENDIF
END SUB
'
SUB leftclick
STATIC INTEGER n
LOCAL INTEGER x=MOUSE(x,mp),y=MOUSE(y,mp)
GUI CURSOR OFF
GUI CURSOR ON 1,x,y, RGB(RED)
n=n+1
PRINT @(100,100)"left",n
if x > 750 and y < 25 then quit = 1
END SUB
'
SUB rightclick
STATIC INTEGER n=0
LOCAL INTEGER x=MOUSE(x,mp),y=MOUSE(y,mp)
GUI CURSOR OFF
GUI CURSOR ON 0,x,y
n=n+1
PRINT @(200,100)"Right",n
END SUB