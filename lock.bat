@echo off
title Ordnerschutz
if EXIST "Control Panel.{21EC2020-3AEA-1069-A2DD-08002B30309D}" goto UNLOCK
if NOT EXIST Locker goto MDLOCKER

:CONFIRM
echo Sind Sie sicher, dass Sie den Ordner sperren möchten (Ja/Nein)?
set/p "cho=>"
if %cho%==J goto LOCK
if %cho%==j goto LOCK
if %cho%==JA goto LOCK
if %cho%==ja goto LOCK
if %cho%==n goto END
if %cho%==N goto END
if %cho%==nein goto END
if %cho%==NEIN goto END
echo Üngültige Antwort: Soll der Ordner gesperrt werden, "Ja" oder "Nein"?
pause
goto CONFIRM

:LOCK
ren Locker "Control Panel.{21EC2020-3AEA-1069-A2DD-08002B30309D}"
attrib +h +s "Control Panel.{21EC2020-3AEA-1069-A2DD-08002B30309D}"
echo Ordner gesperrt!
goto End

:UNLOCK
echo Geben Sie das Passwort zum entsperren des Ordners ein
set/p "pass=>"
if NOT %pass%==YOUR PASSWORD HERE goto FAIL
attrib -h -s "Control Panel.{21EC2020-3AEA-1069-A2DD-08002B30309D}"
ren "Control Panel.{21EC2020-3AEA-1069-A2DD-08002B30309D}" Locker
echo Der Ordner wurde entschlüsselt
goto End

:FAIL
echo Falsches Passwort
pause
goto end

:MDLOCKER
md Locker
echo Der Gesicherter Ordner wurde erfolgreich erstellt
pause
goto End

:End
