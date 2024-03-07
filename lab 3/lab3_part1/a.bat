:menu
echo 1. sozdati directoriu
echo 2. sozdati 2 fila
echo 3. obiediniti file
echo 4. copy 3 file v d1
echo 5. exit

set /p r = 
if %r% == 1 go to e1
if %r% == 2 go to e2
if %r% == 3 go to e3
if %r% == 4 go to e4
if %r% == 5 go to e5

:e1
md MPA\d1
tree
goto menu

:e2
copy con MPA\f1
copy con MPA\f2
tree /f
goto menu

:e3
echo vizov b.bat
call b.bat
echo mi vernuli
goto menu

:e4
copy MDA\f3 MDA\D1
tree /f 
goto menu

:exit