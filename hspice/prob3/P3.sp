.title NMOS
.options post

** include model file
.inc ../par0.18um.net
.param M1Width = 60u
.param M3Width = 100u
.param M5Width = 60u

**Components

M1 drain5 gate1 idd 0 P_18 W=M1Width L=0.25u M=1 AD=0.6u*M1Width AS=0.6u*M1Width PS=1.2u+2*M1Width PD=1.2u+2*M1Width

M2 drain6 gate2 idd 0 P_18 W=M1Width L=0.25u M=1 AD=0.6u*M1Width AS=0.6u*M1Width PS=1.2u+2*M1Width PD=1.2u+2*M1Width

M3 drain5 vb1 0 0 N_18 W=M3Width L=0.5u M=1 AD=0.6u*M3Width AS=0.6u*M3Width PS=1.2u+2*M3Width PD=1.2u+2*M3Width

M4 drain6 vb1 0 0 N_18 W=M3Width L=0.5u M=1 AD=0.6u*M3Width AS=0.6u*M3Width PS=1.2u+2*M3Width PD=1.2u+2*M3Width

M5 out1 vb2 drain5 0 N_18 W=M5Width L=0.5u M=1 AD=0.6u*M5Width AS=0.6u*M5Width PS=1.2u+2*M5Width PD=1.2u+2*M5Width

M6 out2 vb2 drain6 0 N_18 W=M5Width L=0.5u M=1 AD=0.6u*M5Width AS=0.6u*M5Width PS=1.2u+2*M5Width PD=1.2u+2*M5Width

R1 vdd out1 4000
R2 vdd out2 4000
C1 out1 out2 1p


**Sources
Vddx vdd 0 DC=1.8V
Iddx idd 0 DC 300u
VDM 1 0 DC=0V AC=1,0
E+ gate1 2 1 0 0.5 
E- gate2 2 1 0 -0.5
VCM 2 0 DC=0V AC=0V
Vb1x vb1 0 DC=0V
Vb2x vb2 0 DC=0V

**Controls
.op
**.pz v(out1,out2) 
.ac dec 100 1e3 1e9
.print dc i(M1) i(M2) i(M3) i(M4) i(M5) i(M6) v(drain2) v(drain5)
**.print ac vdb(drain2)
**.plot ac vdb(drain2)

.end
