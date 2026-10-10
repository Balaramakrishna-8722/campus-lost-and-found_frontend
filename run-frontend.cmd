@echo off
setlocal

set "BACKEND_DIR=%~dp0..\backend"
set "BACKEND_POM=%BACKEND_DIR%\pom.xml"
set "MAVEN_WRAPPER=%BACKEND_DIR%\mvnw.cmd"
set "FRONTEND_URL=http://localhost:8083/"

if not exist "%BACKEND_POM%" (
    echo Backend Maven project was not found at "%BACKEND_POM%".
    exit /b 1
)

if not exist "%MAVEN_WRAPPER%" (
    echo Maven wrapper was not found at "%MAVEN_WRAPPER%".
    exit /b 1
)

curl.exe --silent --fail "%FRONTEND_URL%" --output NUL
if not errorlevel 1 (
    echo Campus Lost ^& Found is already running at %FRONTEND_URL%
    start "" "%FRONTEND_URL%"
    exit /b 0
)

call "%MAVEN_WRAPPER%" -f "%BACKEND_POM%" spring-boot:run
exit /b %ERRORLEVEL%
