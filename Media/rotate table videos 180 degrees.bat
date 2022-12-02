@echo off
for %%D in ("Table Videos\*.mp4") do call :conv "%%D"
goto :EOF

:conv
set _extension=%~x1
ffmpeg.exe -y -i %1 -vf "transpose=2,transpose=2" "output%_extension%"
copy /y "output%_extension%" %1
del /F "output%_extension%"
goto :EOF
