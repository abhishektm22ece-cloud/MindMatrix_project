@echo off
setlocal

echo.
echo ==========================================
echo  Sahyadri-Samrakshane Live Demo Launcher
echo ==========================================
echo.

set "PROJECT_DIR=%~dp0"
cd /d "%PROJECT_DIR%"

if exist "D:\Program Files\Android\Android Studio\jbr\bin\java.exe" (
    set "JAVA_HOME=D:\Program Files\Android\Android Studio\jbr"
) else if exist "C:\Program Files\Eclipse Adoptium\jdk-17.0.15.6-hotspot\bin\java.exe" (
    set "JAVA_HOME=C:\Program Files\Eclipse Adoptium\jdk-17.0.15.6-hotspot"
) else if exist "C:\Program Files\Eclipse Adoptium\jdk-20.0.2.9-hotspot\bin\java.exe" (
    set "JAVA_HOME=C:\Program Files\Eclipse Adoptium\jdk-20.0.2.9-hotspot"
) else (
    echo Could not find Java automatically.
    echo Set JAVA_HOME manually, then run:
    echo .\gradlew.bat :app:assembleDebug
    pause
    exit /b 1
)

set "PATH=%JAVA_HOME%\bin;%PATH%"

echo Using JAVA_HOME:
echo %JAVA_HOME%
echo.

echo Building debug APK...
call .\gradlew.bat :app:assembleDebug
if errorlevel 1 (
    echo.
    echo Build failed. Check the Gradle error above.
    pause
    exit /b 1
)

echo.
echo Build successful.
echo APK:
echo %PROJECT_DIR%app\build\outputs\apk\debug\app-debug.apk
echo.

where adb >nul 2>nul
if errorlevel 1 (
    echo ADB was not found in PATH.
    echo Open Android Studio, select an emulator or phone, then click Run.
    echo.
    echo Demo guide:
    echo %PROJECT_DIR%LIVE_DEMO.md
    pause
    exit /b 0
)

echo Installing APK on connected device/emulator...
adb install -r "%PROJECT_DIR%app\build\outputs\apk\debug\app-debug.apk"
if errorlevel 1 (
    echo.
    echo APK built, but install failed. Start an emulator or connect a phone with USB debugging.
    pause
    exit /b 0
)

echo.
echo Launching app...
adb shell monkey -p com.sahyadri.samrakshane -c android.intent.category.LAUNCHER 1

echo.
echo Login:
echo Email: abhishektm.22ece@cambridge.edu.in
echo Password: abhi@2003
echo.
echo Demo guide:
echo %PROJECT_DIR%LIVE_DEMO.md
echo.
echo Chrome presentation page:
echo file:///%PROJECT_DIR:\=/%live-demo.html
echo.
pause
