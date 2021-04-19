@echo off
title Custom Battle
:start
cls
:: This sets the HP for normal.
set hp=40000
set maxhp=40000
set enemyhp=100000
echo Custom Battle
echo.
echo Which mode do you want to choose.
echo Easy
echo Normal
echo Hard
set /p mode=
if %mode% == Normal goto playerturn
if %mode% == Easy goto seteasy
if %mode% == Hard goto sethard
goto start
:seteasy
:: This sets the HP for easy.
set hp=70000
set maxhp=70000
set enemyhp=70000
goto playerturn
:sethard
:: This sets the HP for hard.
set hp=20000
set maxhp=20000
set enemyhp=130000
goto playerturn
:playerturn
:: This triggers the gameover screen.
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
:: Here is the item menu, you can change the name of the item and how much it heals.
set /a hp=%hp%+100
set item=ITEMTEST
echo You used %Item%
pause
goto enemyturn
:attack
:: Here is how much attack damage you do.
set attackdamage=%random%
set /a enemyhp=%enemyhp%-%attackdamage%
echo %attackdamage% damage done to TEST.
echo %enemyhp% HP left.
:: This triggers the win screen.
if %enemyhp% LEQ 0 goto win
pause
goto enemyturn
:enemyturn
:: Here is how much attack damage the enemy does.
set enemyattack=%random%
set /a hp=%hp%-%enemyattack%
echo %enemyattack% damage done.
pause
goto playerturn
:gameover
:: This is the gameover screen.
cls
echo You lost.
pause
exit
:win
:: This is the win screen.
cls
echo You win.
pause
exit