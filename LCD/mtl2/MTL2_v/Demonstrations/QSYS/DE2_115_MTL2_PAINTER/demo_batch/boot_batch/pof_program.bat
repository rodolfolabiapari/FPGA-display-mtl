@ REM ######################################
@ REM # Variable to ignore <CR> in DOS
@ REM # line endings
@ set SHELLOPTS=igncr

@ REM ######################################
@ REM # Variable to ignore mixed paths
@ REM # i.e. G:/$SOPC_KIT_NIOS2/bin
@ set CYGWIN=nodosfilewarning


REM Please set the swich SW19 as 'AS Mode'.
%QUARTUS_ROOTDIR%\\bin\\quartus_pgm.exe -m AS -c USB-Blaster[USB-0] -o "p;Painter.pof"
REM Please resotre the swich SW19 to 'Run Mode'.
pause 

