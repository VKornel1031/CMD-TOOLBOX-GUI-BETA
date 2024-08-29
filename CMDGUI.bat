@echo off
title 'CMD GUI' Interface 

:main
cls
echo ====================================
echo               CMD GUI
echo ====================================
echo 1. Option 1 - Display Date and Time (Fixing!!)
echo 2. Option 2 - Remove Temporary files
echo 3. Option 3 - Command Line Options
echo 4. Option 4 - Programs
echo 5. Option 5 - Exit
echo ====================================
set /p choice="Please choose an option (1-5): "

if "%choice%"=="1" goto option1
if "%choice%"=="2" goto option2
if "%choice%"=="3" goto option3
if "%choice%"=="5" goto exit
if "%choice%"=="4" goto programs

echo Invalid choice. Please choose a number from 1 to 5.
pause
goto main

:option1
title 'Date And Time'
@echo off
:: Set the title of the command prompt window
echo Use 'Esc' or 'Q' to exit

:: Get the current date and time
for /f "tokens=1-4 delims=/ " %%a in ("%date%") do set today=%%a-%%b-%%c
for /f "tokens=1-2 delims=: " %%a in ("%time%") do set currentTime=%%a:%%b

:: loop
:loop
:: Clear the screen
cls

:: Display the formatted date and time
echo ================================
echo       Current Date and Time
echo ================================
echo.
echo    Date: %today%
echo    Time: %currentTime%
echo.
echo ================================
echo     Use 'Esc' or 'Q' to exit
echo ================================
echo.

pause
goto main

:option2
title 'Delete Temp. Files'
cls
echo ====================================
echo        Delete Temporary Files
echo  (Needs Admin Rights,If given ignore)
echo ====================================
echo 1. Option 1 - Common Temporary "(All Users)"
echo 2. Option 2 - Temporary Internet
echo 3. Option 3 - Windows update cache
echo 4. Option 4 - All
echo 5. Option 5 - Back
echo ====================================
set /p choice="Please choose an option (1-5): "

if "%choice%"=="1" goto common
if "%choice%"=="2" goto internet
if "%choice%"=="3" goto updatecache
if "%choice%"=="4" goto alltemp
if "%choice%"=="5" goto main

echo Invalid choice. Please choose a number from 1 to 5.
pause
goto option2

:option3
title 'Command Line Options.'
cls
echo ====================================
echo         Command Line Options
echo ====================================
echo 1. Option 1 - Test Network
echo 2. Option 2 - Administrator
echo 3. Option 3 - IPConfig
echo 4. Option 4 - Back
echo ====================================
set /p choice="Please choose an option (1-4): "

if "%choice%"=="1" goto testnetwork
if "%choice%"=="2" goto administrator
if "%choice%"=="3" goto ipconfiguration
if "%choice%"=="4" goto main

echo Invalid choice. Please choose a number from 1 to 4.
pause
goto option3

:common
title 'Common Temp. Delete'
@echo off
echo Deleting temporary files in the system temp directory...

:: Delete files in the system temp directory
del /q /f C:\Windows\Temp\*

:: Delete empty subdirectories in the system temp directory
for /d %%p in (C:\Windows\Temp\*) do rd /s /q "%%p"

echo Common Temporary Files deleted!
timeout /t 2
goto option2

:internet
title 'Temp. Internet files Delete' 
@echo off
echo Deleting temporary Internet files...

:: Delete files in the temporary Internet files directory
del /q /f "%LocalAppData%\Microsoft\Windows\INetCache\*"

:: Delete empty subdirectories in the temporary Internet files directory
for /d %%p in ("%LocalAppData%\Microsoft\Windows\INetCache\*") do rd /s /q "%%p"

echo Temporary Internet files deleted!
timeout /t 2
goto option2

:updatecache
title 'Update Cache Delete'
@echo off
echo Stopping Windows Update service...

:: Stop the Windows Update service
net stop wuauserv

echo Deleting Windows Update cache...

:: Delete the Windows Update cache
del /q /f C:\Windows\SoftwareDistribution\*

:: Restart the Windows Update service
net start wuauserv

echo Windows Update cache deleted!
timeout /t 2
goto option2

:ipconfiguration
title 'IpConfiguration'
ipconfig
pause
goto option3

:administrator
title 'Admin Check'
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo CMDGUI requires administrative privileges.
    echo.
    echo Attempting to restart with administrative privileges...
    
    :: Restart the script with administrative privileges
    powershell -Command "Start-Process cmd.exe -ArgumentList '/c %~s0 %*' -Verb RunAs"
    exit /b
)

:: If the script is running with admin rights, continue with the rest of the script
echo CMDGUI is running with administrative privileges.
pause
goto option3

:testnetwork
title 'Network test'
ping google.com
echo If "0 precent" Loss then your wifi is perfect, if above "10 precent" loss then your wifi is not the best right now. if above "50" precent loss then your wifi is bad right now.   
pause
goto option3

:alltemp
title 'All Temp. Delete'
@echo off
echo Deleting temporary files in the system temp directory...

:: Delete files in the system temp directory
del /q /f C:\Windows\Temp\*

:: Delete empty subdirectories in the system temp directory
for /d %%p in (C:\Windows\Temp\*) do rd /s /q "%%p"

echo Deleting temporary Internet files...

:: Delete files in the temporary Internet files directory
del /q /f "%LocalAppData%\Microsoft\Windows\INetCache\*"

:: Delete empty subdirectories in the temporary Internet files directory
for /d %%p in ("%LocalAppData%\Microsoft\Windows\INetCache\*") do rd /s /q "%%p"

echo Stopping Windows Update service...

:: Stop the Windows Update service
net stop wuauserv

echo Deleting Windows Update cache...

:: Delete the Windows Update cache
del /q /f C:\Windows\SoftwareDistribution\*

:: Restart the Windows Update service
net start wuauserv

echo All Temporary Files Deleted!
timeout /t 3
goto option2

:programs
title 'Programs'
cls
echo ====================================
echo               Programs
echo ====================================
echo 1. Option 1 - Install
echo 2. Option 2 - Uninstall
echo 3. Option 3 - Back
echo ====================================
set /p choice="Please choose an option (1-3): "

if "%choice%"=="1" goto installprog
if "%choice%"=="2" goto uninstallprog
if "%choice%"=="3" goto main

echo Invalid choice. Please choose a number from 1 to 3.
pause
goto programs

:installprog
title 'Programs'
cls
echo ====================================
echo               Programs
echo ====================================
echo 1. Option 1 - Search Engine
echo 2. Option 2 - Other
echo 3. Option 3 - Back
echo ====================================
set /p choice="Please choose an option (1-3): "

if "%choice%"=="1" goto sengine
if "%choice%"=="2" goto otherinstall
if "%choice%"=="3" goto programs

echo Invalid choice. Please choose a number from 1 to 3.
pause
goto installprog

:sengine

title 'Programs'
cls
echo ====================================
echo               Programs
echo ====================================
echo 1. Option 1 - Google Chrome
echo 2. Option 2 - Microsoft Edge
echo 3. Option 3 - Mozilla Firefox
echo 4. Option 4 - Opera Browser
echo 5. Option 5 - Brave Browser
echo 6. Option 6 - Vivaldi Browser
echo 7. Option 7 - Back
echo ====================================
set /p choice="Please choose an option (1-7): "

if "%choice%"=="1" goto googleinstall
if "%choice%"=="2" goto edgeinstall
if "%choice%"=="3" goto firefoxinstall
if "%choice%"=="4" goto operainstall
if "%choice%"=="5" goto braveinstall
if "%choice%"=="6" goto vivaldiinstall
if "%choice%"=="7" goto programs

echo Invalid choice. Please choose a number from 1 to 7.
pause
goto installprog

:googleinstall
winget install --id Google.Chrome --silent
timeout /t 3
goto programs

:edgeinstall
winget install --id Microsoft.Edge --silent
timeout /t 3
goto programs

:firefoxinstall
winget install --id Mozilla.Firefox --silent
timeout /t 3
goto programs

:operainstall
winget install --id Opera.Opera --silent
timeout /t 3
goto programs

:braveinstall
winget install --id Brave.Brave --silent
timeout /t 3
goto programs

:vivaldiinstall
winget install --id VivaldiTechnologies.Vivaldi --silent
timeout /t 3
goto programs

:uninstallprog
control appwiz.cpl
timeout /t 3
goto programs

:otherinstall
title 'Programs'
cls
echo ====================================
echo               Programs
echo ====================================
echo 1. Option 1 - Steam
echo 2. Option 2 - Visual Studio Code
echo 3. Option 3 - CrystalDiskInfo
echo 4. Option 4 - GPU-Z
echo 5. Option 5 - CPU-Z
echo 6. Option 6 - Epic Games Launcher
echo 7. Option 7 - Back
echo ====================================
set /p choice="Please choose an option (1-7): "

if "%choice%"=="1" goto steam
if "%choice%"=="2" goto vscode
if "%choice%"=="3" goto crystaldiskinfo
if "%choice%"=="4" goto gpuz
if "%choice%"=="5" goto cpuz
if "%choice%"=="6" goto epicgames
if "%choice%"=="7" goto programs

echo Invalid choice. Please choose a number from 1 to 7.
pause
goto programs

:steam
winget install --id Valve.Steam --silent
timeout /t 3
goto programs

:vscode
winget install --id Microsoft.VisualStudioCode --silent
timeout /t 3
goto programs

:crystaldiskinfo
winget install --id hiyohiyo.crystaldiskinfo --silent
timeout /t 3
goto programs

:gpuz
winget install --id TechPowerUp.GPU-Z --silent
timeout /t 3
goto programs

:cpuz
winget install --id CPUID.CPU-Z --silent
timeout /t 3
goto programs

:epicgames
winget install --id EpicGames.EpicGamesLauncher --silent
timeout /t 3
goto programs

:exit
echo Exited... Thank you for using this program!
pause
exit
