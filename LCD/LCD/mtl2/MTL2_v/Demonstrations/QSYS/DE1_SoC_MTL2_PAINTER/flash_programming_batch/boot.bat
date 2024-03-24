
@ REM ######################################
@ REM # Variable to ignore <CR> in DOS
@ REM # line endings
@ set SHELLOPTS=igncr

@ REM ######################################
@ REM # Variable to ignore mixed paths
@ REM # i.e. G:/$SOPC_KIT_NIOS2/bin
@ set CYGWIN=nodosfilewarning

@set QUARTUS_BIN=%QUARTUS_ROOTDIR%\\bin
@if exist %QUARTUS_BIN%\\quartus_pgm.exe (goto DownLoad)
@set QUARTUS_BIN=%QUARTUS_ROOTDIR%\\bin64
@if exist %QUARTUS_BIN%\\quartus_pgm.exe (goto DownLoad)

:: Prepare for future use (if exes are in bin32)
@set QUARTUS_BIN=%QUARTUS_ROOTDIR%\\bin32


:DownLoad
@ REM ######################################
@ echo off
%QUARTUS_BIN%\\jtagconfig.exe > %%JTAG_INFO
IF ERRORLEVEL 1 goto error
setlocal enableextensions

rem check DE-SoC Board
for /f "tokens=2" %%a in (
%%JTAG_INFO
) do (
if %%a == DE-SoC goto Board_Ready
)

echo Can not find DE-SoC board, please check the hardware.
goto end


:Board_Ready
rem Find out device index
set /a Index=0
for /f "tokens=1" %%a in (
%%JTAG_INFO) do (
if %%a == 02D120DD goto Find_FPGA
set /a Index+=1
)

echo Can not find 5CSE(BA5|MA5)/5CSTFD5D5 FPGA Device, please check the hardware.
goto end


:Find_FPGA
::echo INDEX = %Index%
if %Index% == 1 goto Rev_B
if %Index% == 2 goto Rev_C

echo Device out of range(1 or 2), please check the hardware.
goto end


:Rev_B
echo ===========================================================
echo "DE1-SoC rev B"
echo ===========================================================
goto Program_FPGA


:Rev_C
echo ===========================================================
echo "DE1-SoC rev C or later"
echo ===========================================================

:Program_FPGA

echo ===========================================================
echo "Convert .sof to .jic"
echo ===========================================================
%QUARTUS_BIN%\\quartus_cpf -c -d epcs128 -s 5csema5  DE1_SoC_MTL2_PAINTER.sof DE1_SoC_MTL2_PAINTER.jic

echo ===========================================================
echo "Programming EPCS with .jic"
echo ===========================================================
%QUARTUS_BIN%\\quartus_pgm.exe -m jtag -c 1 -o "p;sfl_enhanced_01_02d120dd.sof@%Index%"
%QUARTUS_BIN%\\quartus_pgm.exe -m jtag -c 1 -o "p;DE1_SoC_MTL2_PAINTER.jic@%Index%"

echo ===========================================================
echo "Progrming .sof to FPGA"
echo ===========================================================
%QUARTUS_BIN%\\quartus_pgm.exe -m jtag -c 1 -o "p;DE1_SoC_MTL2_PAINTER.sof@%Index%"

@ set SOPC_BUILDER_PATH=%SOPC_KIT_NIOS2%+%SOPC_BUILDER_PATH%
@ "%QUARTUS_BIN%\\cygwin\bin\bash.exe" --rcfile ".\boot_bashrc_64"

pause
