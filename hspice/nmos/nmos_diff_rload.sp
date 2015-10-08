.title NMOS
.options post

** include model file
.inc ../par0.18um.net
.param M1Width = 60u
**Components
M1 nout1 nin1 Vs 0 N_18 W=M1Width L=0.2u M=1 AD=0.6u*M1Width AS=0.6u*M1Width PS=1.2u+2*M1Width PD=1.2u+2*M1Width
M2 nout2 nin2 Vs 0 N_18 W=M1Width L=0.2u M=1 AD=0.6u*M1Width AS=0.6u*M1Width PS=1.2u+2*M1Width PD=1.2u+2*M1Width
R1 Vdd nout1 1e3
R2 Vdd nout2 1e3
C1 nout1 0 1e-12
C2 nout2 0 1e-12

**Sources
Vds  Vdd 0 DC=1.8V 
Vin1 nin1 0 DC=0.9V AC=0.5,0
Vin2 nin2 0 DC=0.9V AC=0.5,180
ISS  Vs 0 DC=200u

**Controls
.op
.pz v(nout1) Vin1
.ac dec 100 1e3 1e9
.print dc i(M1) v(nout1)
.print ac vdb(nout1,nout2)
.plot ac vdb(nout1,nout2)

.end
