@ECHO OFF
ECHO FreeGEM Output Build Script
ECHO Owen Rudge
ECHO.
ECHO Press any key to build OUTPUT.APP
PAUSE > NUL
ECHO.
COPY ..\RSC\OUTPUT.RSC .
COPY ..\RSC\OUTPUT.DFN .
COPY ..\RSC\OUTPUT.H .
ECHO.
CALL OC
CALL OLINK
ECHO.
CHOICE /C:YN Do you want to PKLITE OUTPUT.APP?
IF ERRORLEVEL 2 GOTO SKIPLITE
REN OUTPUT.APP OUTPUT.EXE
PKLITE OUTPUT.EXE
REN OUTPUT.EXE OUTPUT.APP
:SKIPLITE
ECHO.
ECHO Do you want to copy OUTPUT.APP to D:\GEMAPPS? Press any key for
ECHO yes, or CTRL-C for no.
PAUSE > NUL
COPY OUTPUT.APP D:\GEMAPPS
COPY OUTPUT.RSC D:\GEMAPPS
ECHO.
CHOICE /C:YN Do you want to delete the *.OBJ files? 
IF ERRORLEVEL 2 GOTO FINISHED
CALL CLEANUP.BAT
:FINISHED
ECHO.
ECHO Build complete.
