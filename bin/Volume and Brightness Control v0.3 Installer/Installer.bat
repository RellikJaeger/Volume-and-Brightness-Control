::##########################################################################################:
::#                                                                                        #:
::#    GNU GPL information                                                                 #:
::#                                                                                        #:
::#         This program is free software: you can redistribute it and/or modify           #:
::#         it under the terms of the GNU General Public License as published by           #:
::#         the Free Software Foundation, either version 3 of the License, or              #:
::#         (at your option) any later version.                                            #:
::#                                                                                        #:
::#         This program is distributed in the hope that it will be useful,                #:
::#         but WITHOUT ANY WARRANTY; without even the implied warranty of                 #:
::#         MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the                  #:
::#         GNU General Public License for more details.                                   #:
::#                                                                                        #:
::#         You should have received a copy of the GNU General Public License              #:
::#         along with this program.  If not, see <https://www.gnu.org/licenses/>.         #:
::#                                                                                        #:
::#                                                                  Rellik Jaeger         #:
::#                                                                                        #:
::##########################################################################################:
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

@ECHO OFF
TITLE Volume and Brightness Control v0.3 Installer
COLOR 0A
MODE CON COLS=54 LINES=3
IF "%PROCESSOR_ARCHITECTURE%" EQU "amd64" (
>nul 2>&1 "%SYSTEMROOT%\SysWOW64\cacls.exe" "%SYSTEMROOT%\SysWOW64\config\system"
) ELSE (
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
)

IF '%ERRORLEVEL%' NEQ '0' (
    ECHO.
    ECHO                     Loading . . .
    GOTO UACPrompt
) ELSE ( GOTO gotAdmin )

:UACPrompt
    ECHO Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    SET params= %*
    ECHO UAC.ShellExecute "cmd.exe", "/c ""%~s0"" %params:"=""%", "", "runas", 1 >> "%temp%\getadmin.vbs"

    "%temp%\getadmin.vbs"
    DEL "%temp%\getadmin.vbs"
    EXIT /B

:gotAdmin
    pushd "%CD%"
    CD /D "%~dp0"
    COLOR 0A
    MODE CON COLS=70 LINES=2
    PUSHD "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\StartUp"
    DEL "Volume and Brightness Control.exe"
    POPD
    COPY "Licenses\res\Vol*Bri*.exe" "C:/ProgramData/Microsoft/Windows/Start Menu/Programs/StartUp" /-Y
    COLOR 0A
    MODE CON COLS=54 LINES=3
    CLS
    ECHO.
    ECHO                     Installing . . .
    TITLE Volume and Brightness Control v0.3 Installer
    COLOR 0A
    CLS
    ECHO.
    ECHO                         DONE!
    MSG * Volume and Brightness Control v0.3 Installation complete!
    CD "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\StartUp\"
    START "" /b "Volume and Brightness Control v0.3.exe"
    ::@RD /S /Q "..\Volume and Brightness Control v0.3"


::  Rellik Jaeger

