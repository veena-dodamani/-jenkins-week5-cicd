@echo off
if not exist build mkdir build
javac -d build src\Hello.java
if errorlevel 1 exit /b 1
echo BUILD SUCCESS
