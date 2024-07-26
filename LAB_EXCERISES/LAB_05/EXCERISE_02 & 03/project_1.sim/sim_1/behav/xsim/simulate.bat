@echo off
REM ****************************************************************************
REM Vivado (TM) v2024.1 (64-bit)
REM
REM Filename    : simulate.bat
REM Simulator   : AMD Vivado Simulator
REM Description : Script for simulating the design by launching the simulator
REM
REM Generated by Vivado on Fri Jul 26 00:28:35 +0200 2024
REM SW Build 5076996 on Wed May 22 18:37:14 MDT 2024
REM
REM Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
REM Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
REM
REM usage: simulate.bat
REM
REM ****************************************************************************
REM simulate design
echo "xsim tb_Counter_3bit_Sync_behav -key {Behavioral:sim_1:Functional:tb_Counter_3bit_Sync} -tclbatch tb_Counter_3bit_Sync.tcl -log simulate.log"
call xsim  tb_Counter_3bit_Sync_behav -key {Behavioral:sim_1:Functional:tb_Counter_3bit_Sync} -tclbatch tb_Counter_3bit_Sync.tcl -log simulate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0