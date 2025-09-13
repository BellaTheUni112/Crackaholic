@echo off
echo Binary must be root!
set /p x="Directory: "
if not exist "%x%" (
	echo Directory doesn't exist.
	pause
	exit
)
for %%f in ("%x%\*.exe") do (
    set "exe=%%~nxf"
    goto :gotbin
)
echo No binary found in directory.
pause
exit /b

:gotbin

(
    echo [SteamClient]
    echo Exe=%exe%
    echo ExeRunDir=.
    echo ExeCommandLine=
    echo AppId=6860
    echo.
    echo SteamClientDll=steamclient.dll
    echo SteamClient64Dll=steamclient64.dll
) > "%x%\ColdClientLoader.ini"

xcopy "%~dp0crackfiles\*" "%x%" /E /H /I

(
    echo Cracked with Crackaholic
    echo Do not run "%exe%", run "steamclient_loader.exe" or it will refuse to run.
) > "%x%\README.txt"
cd "%x%"
"%homedir%Steamless.CLI.exe" %exe%
echo Done.

pause
