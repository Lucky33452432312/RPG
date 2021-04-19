@echo off
title BattleTest
:start
cls
set hp=40000
set maxhp=40000
set enemyhp=100000
echo Battle Test
echo.
echo Which mode do you want.
echo Easy
echo Normal
set /p mode=
if %mode% == Normal goto playerturn
if %mode% == Easy goto seteasy
goto start
:seteasy
set hp=70000
set maxhp=70000
set enemyhp=70000
goto playerturn
:playerturn
if %hp% LEQ 0 goto gameover
cls
echo Stats
echo %hp% HP out of %maxhp%.
echo.
echo Choose a option.
echo.
echo Attack
echo Item
echo Run
echo.
set /p choice=
if %choice% == Attack goto attack
if %choice% == Item goto item
if %choice% == Run goto run
goto playerturn
:run
cls
echo You ran.
pause
goto start
:item
set item=ITEMTEST
echo You used %Item%
pause
goto enemyturn
:attack
set attackdamage=%random%
set /a enemyhp=%enemyhp%-%attackdamage%
echo %attackdamage% damage done to TEST.
echo %enemyhp% HP left.
if %enemyhp% LEQ 0 goto win
pause
goto enemyturn
:enemyturn
set enemyattack=%random%
set /a hp=%hp%-%enemyattack%
echo %enemyattack% damage done.
pause
goto playerturn
:gameover
cls
echo You lost.
pause
exit
:win
cls
echo You win.
pause
exit