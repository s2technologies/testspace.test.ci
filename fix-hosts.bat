@echo off

set /p IP_URL=<commit-trigger.txt
for /f "tokens=1" %%a IN ("%IP_URL%") DO (set IP=%%a)
for /f "tokens=2" %%a IN ("%IP_URL%") DO (set URL=%%a)
set DOMAIN=%URL:http://=%
if "%DOMAIN%" == "s2.test.stridespace.com" (
  echo. >> "%windir%\System32\drivers\etc\hosts"
  echo %IP% %DOMAIN%>>"%windir%\System32\drivers\etc\hosts"
)

echo %URL% > testspace-url