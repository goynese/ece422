.title NMOS
.options post

** include model file
.inc ../par0.18um.net
.param M1Width = 60u
.param Vic=-0.5V
**Components
M1 B vi1 vp vp N_18 W=M1Width L=0.5u M=1 AD=0.6u*M1Width AS=0.6u*M1Width PS=1.2u+2*M1Width PD=1.2u+2*M1Width
M2 vout vi2 vp vp N_18 W=M1Width L=0.5u M=1 AD=0.6u*M1Width AS=0.6u*M1Width PS=1.2u+2*M1Width PD=1.2u+2*M1Width
M3 B B vds vds P_18 W=2*M1Width L=0.5u M=1 AD=0.6u*2*M1Width AS=0.6u*2*M1Width PS=1.2u+2*2*M1Width PD=1.2u+2*2*M1Width
M4 vout B vds vds P_18 W=2*M1Width L=0.5u M=1 AD=0.6u*2*M1Width AS=0.6u*2*M1Width PS=1.2u+2*2*M1Width PD=1.2u+2*2*M1Width
M5 vp A vss vss N_18 W=2.25*M1Width L=0.5u M=1 AD=0.6u*2.25*M1Width AS=0.6u*2.25*M1Width PS=1.2u+2*2.25*M1Width PD=1.2u+2*2.25*M1Width
M6 A A vss vss N_18 W=0.58*M1Width L=0.5u M=1 AD=0.6u*0.58*M1Width AS=0.6u*0.58*M1Width PS=1.2u+2*0.58*M1Width PD=1.2u+2*0.58*M1Width

R1 vds A 8.1e3

C1 vout vss 1e-12


**Sources
Vid 1 0 DC 0V AC 1V
E+ vi1 2 1 0 0.5
E- vi2 2 1 0 -0.5
Vic 2 0 DC -0.5V
Vds vds 0 DC=0.9V
Vss 0 vss DC=0.9V

**Controls
.op
.ac dec 100 1e3 1e12 sweep Vic -0.5 0.5 0.1

**.dc Vic -0.5v 0.5v 0.01v
.print dc v(vout)  v(Vic)

.end
