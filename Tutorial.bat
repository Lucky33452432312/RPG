@echo off
title Tutorial
echo Hello!
echo Welcome to the tutorial!
pause
:attack
cls
echo Start by typing Attack!
set /p attack=
if %attack% == Attack goto item
if not %attackdamage% == Attack goto attack
:item
cls
echo You did 100 damage.
echo.
echo Great!
echo Now type Item!
set /p item=
if %item% == Item goto run
if not %item% == Item goto item
:run
cls
echo You healed 100 HP.
echo.
echo Great!
echo Finally, type Run!
set /p run=
if %run% == Run goto end
if not %run% == Run goto run
:end
echo You ran away from the battle.
echo.
echo Congrats, you beat the tutorial.
echo Press any key to quit the battle.
pause
exit