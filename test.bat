@echo off
java -cp build Hello > test-output.txt
findstr /C:"Hello from Week 5 Jenkins CI/CD!" test-output.txt >nul
if errorlevel 1 (
  echo TEST FAILED
  type test-output.txt
  exit /b 1
)
echo TEST PASSED
