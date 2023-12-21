@echo off
FOR %%a in ("encrypted\*.wav") do ("vgmstream.exe" -i -o "decrypted\%%~nxa" "%%a")
pause