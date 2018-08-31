@echo off
setlocal

call:time2ms TIME_START
testspace result*.xml [ALL]result*.xml [%JOB%]result*.xml
call:time2ms TIME_END
set /a TIME_DIFF=%TIME_END% - %TIME_START%

testspace results.xml [ALL]results.xml [%JOB%]results.xml file://%CD%/check-size.xml
for /f "tokens=*" %%A in ("check-size.xml") do set CONTENT_SIZE=%%~zA

for /f %%A in ('dir result*.xml ^| find "File(s)"') do set NUM_FILES=%%A

rem Log file
echo TIMING STATS: > timing.log
echo   Number of files: %NUM_FILES% >> timing.log
echo   Size of content(files X 3): %CONTENT_SIZE% >> timing.log
echo   %JOB% Upload time in milliseconds: %TIME_DIFF% >> timing.log

rem CSV file
echo %JOB% Upload time, %TIME_DIFF% > timing.csv
echo %JOB% Content size, %CONTENT_SIZE% >> timing.csv

testspace [%JOB%]"timing.log{timing.csv:Tracking Time for %JOB%}"

goto:eof


:time2ms
setlocal
rem The format of %TIME% is HH:MM:SS,CS for example 23:59:59,99 (centiseconds)
set t=%TIME%
endlocal&set /a %~1=(1%t:~0,2%-100)*3600000 + (1%t:~3,2%-100)*60000 + (1%t:~6,2%-100)*1000 + (1%t:~9,2%-100)*10
goto:eof
