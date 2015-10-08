**Final


.title NMOS
.options post

** include model file
.inc ../par0.18um.net
.param M1Width = 50u
.param M3Width = 50u
.param M5Width = 200u
.param M7Width = 10u
.param M8Width = 100u
**Components

M1 drain1 drain1 vss vss N_18 W=M1Width L=0.25u M=1 AD=0.6u*M1Width AS=0.6u*M1Width PS=1.2u+2*M1Width PD=1.2u+2*M1Width

M2 drain2 drain1 vss vss N_18 W=M1Width L=0.25u M=1 AD=0.6u*M1Width AS=0.6u*M1Width PS=1.2u+2*M1Width PD=1.2u+2*M1Width

M3 drain5 E+ drain2 drain2 N_18 W=M3Width L=0.25u M=1 AD=0.6u*M3Width AS=0.6u*M3Width PS=1.2u+2*M3Width PD=1.2u+2*M3Width

M4 drain6 E- drain2 drain2 N_18 W=M3Width L=0.25u M=1 AD=0.6u*M3Width AS=0.6u*M3Width PS=1.2u+2*M3Width PD=1.2u+2*M3Width

M5 drain5 drain5 vdd vdd P_18 W=M5Width L=0.25u M=1 AD=0.6u*M5Width AS=0.6u*M5Width PS=1.2u+2*M5Width PD=1.2u+2*M5Width

M6 drain6 drain5 vdd vdd P_18 W=M5Width L=0.25u M=1 AD=0.6u*M5Width AS=0.6u*M5Width PS=1.2u+2*M5Width PD=1.2u+2*M5Width

M7 out drain1 vss vss N_18 W=M7Width L=0.25u M=1 AD=0.6u*M7Width AS=0.6u*M7Width PS=1.2u+2*M7Width PD=1.2u+2*M7Width

M8 out drain6 vdd vdd P_18 W=M8Width L=0.25u M=1 AD=0.6u*M8Width AS=0.6u*M8Width PS=1.2u+2*M8Width PD=1.2u+2*M8Width



R1 vdd drain1 1166
R2 drain6 C1 170
Cc C1 oout 1p
C_load oout 0 5p

**Sources
Vddx vdd 0 DC=0.9V
Vssx vss 0 DC=-0.9V
VDM 1 0 DC=0V AC=1,0
E+ gate3 2 1 0 0.5 
E- gate4 2 1 0 -0.5
VCM 2 0 DC=0V AC=0V

**Controls
.op
.pz v(out) VDM
.ac dec 100 1e3 1e12
**.dc VCM -1 1 0.01
.print dc i(M1) i(M3) i(M5) i(M6) v(drain2)
.print ac vdb(out)
**.plot ac vdb(drain2)



.end
