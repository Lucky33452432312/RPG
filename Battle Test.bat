@echo off
title BattleTest
:start
cls
set hp=40000
set maxhp=40000
set enemyhp=100000
echo Battle Test
echo.
echo What battle do you want to play?
echo Tutorial
echo Main
echo Custom
set /p battle=
if %battle% == Main goto mode
if %battle% == Custom goto custom
if %battle% == Tutorial goto starttutorial
goto start
:starttutorial
start Tutorial.bat
exit
:custom
cls
cd Custom
dir
echo Select the battle you want to play (.bat added).
set /p custombattle=
if exist %custombattle%.bat start %custombattle%.bat
if not exist %custombattle%.bat goto customfailed
:customfailed
echo That battle doesn't exist.
pause
goto start
:mode
cls
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
set hp=70000
set maxhp=70000
set enemyhp=70000
goto playerturn
:sethard
set hp=20000
set maxhp=20000
set enemyhp=130000
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
set /a hp=%hp%+100
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