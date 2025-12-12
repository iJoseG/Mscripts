#!/bin/bash

sudo apt install wget xorg-xwayland

wget  https://www.mathworks.com/mpm/glnxa64/mpm

sudo chmod +x mpm

./mpm install --release=R2025a --destination=/home/jguerra/matlab MATLAB Simulink Deep_Learning_Toolbox Parallel_Computing_Toolbox Antenna_Toolbox Communications_Toolbox Control_System_Toolbox DSP_System_Toolbox Fixed-Point_Designer Fuzzy_Logic_Toolbox MATLAB_Coder MATLAB_Compiler Model_Predictive_Control_Toolbox Motor_Control_Blockset Optimization_Toolbox Signal_Processing_Toolbox Simscape Simscape_Battery Simscape_Electrical Simulink_Coder Simulink_Compiler Simulink_Control_Design Simulink_PLC_Coder SoC_Blockset Symbolic_Math_Toolbox

/home/jguerra/matlab/bin/glnxa64/MathWorksProductAuthorizer.sh
