**Final


.title NMOS
.options post

** include model file
.inc ../par0.18um.net
.param M1Width = 60u
.param M3Width = 120u
.param M5Width = 100u
.param M6Width = 25u
.param M7Width = 10u
**Components

M1 drain1 gate1 drain5 drain5 N_18 W=M1Width L=0.5u M=1 AD=0.6u*M1Width AS=0.6u*M1Width PS=1.2u+2*M1Width PD=1.2u+2*M1Width

M2 drain2 gate2 drain5 drain5 N_18 W=M1Width L=0.5u M=1 AD=0.6u*M1Width AS=0.6u*M1Width PS=1.2u+2*M1Width PD=1.2u+2*M1Width

M3 drain1 drain1 vdd vdd P_18 W=M3Width L=1u M=1 AD=0.6u*M3Width AS=0.6u*M3Width PS=1.2u+2*M3Width PD=1.2u+2*M3Width

M4 drain2 drain1 vdd vdd P_18 W=M3Width L=1u M=1 AD=0.6u*M3Width AS=0.6u*M3Width PS=1.2u+2*M3Width PD=1.2u+2*M3Width

M5 drain5 drain6 vss vss N_18 W=M5Width L=0.4u M=1 AD=0.6u*M5Width AS=0.6u*M5Width PS=1.2u+2*M5Width PD=1.2u+2*M5Width

M6 drain6 drain6 vss vss N_18 W=M6Width L=0.4u M=1 AD=0.6u*M6Width AS=0.6u*M6Width PS=1.2u+2*M6Width PD=1.2u+2*M6Width

M7 out drain6 vss vss N_18 W=M7Width L=0.5u M=1 AD=0.6u*M7Width AS=0.6u*M7Width PS=1.2u+2*M7Width PD=1.2u+2*M7Width

M8 out drain2 vdd vdd P_18 W=M6Width L=1u M=1 AD=0.6u*M6Width AS=0.6u*M6Width PS=1.2u+2*M6Width PD=1.2u+2*M6Width


R1 vdd drain6 8560
R2 drain2 N1 700
C1 N1 out 8p
C2 out vss 5p

**Sources
Vddx vdd 0 DC=0.9V
Vssx vss 0 DC=-0.9V
VDM 1 0 DC=0V AC=1,0
E+ gate1 2 1 0 0.5 
E- gate2 2 1 0 -0.5
VCM 2 0 DC=0V AC=0V

**Controls
.op
.pz v(drain2) VDM
.ac dec 100 1e3 1e9
.print dc i(M1) i(M3) i(M5) i(M6) i(M7) v(drain2)
**.print ac vdb(drain2)
**.plot ac vdb(drain2)



.end
