@echo off
:start
color 07
chcp 866 >nul
title Dictionary
cls
set /p search="Поиск (чтобы добавить слово введите "/add ^<слово^> - ^<перевод^>"): "
echo %search%>temp
for /f tokens^=1 %%i in ('findstr/bc:/add temp') do (set "add=%%i") >nul
del temp
if "%add%"=="/add" (
goto:addword
)
cls
echo По запросу "%search%" найдено:
findstr /B /L /I /C:"%search%" ENG-RUS.dbase || cls && goto:userdb
:userdb
findstr /B /L /I /C:"%search%" %username%.dbase || echo По запросу "%search%" ничего не найдено :(
pause
cls
goto:start
:addword
echo %search%>temp
for /f tokens^=1* %%n in ('findstr/bc:/add temp') do (set "newword=%%o") >nul
del temp
echo %newword%>>%username%.dbase
echo %newword% успешно добавлено в %cd%\%username%.dbase
pause
goto:start