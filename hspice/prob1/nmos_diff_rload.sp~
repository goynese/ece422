.title NMOS
.options post

** include model file
.inc ../par0.18um.net
.param M1Width = 60u
**Components
M1 drain gate 0 0 N_18 W=60u L=0.2u M=1 AD=0.6u*M1Width AS=0.6u*M1Width PS=1.2u+2*M1Width PD=1.2u+2*M1Width

R1 vin1 gate 1e3
R2 drain vdd 1e3
C1 drain 0 1e-12


**Sources
Vddx  vdd 0 DC=1.8V 
Vin1x vin1 0 DC=0.6V AC=0.5,0


**Controls
.op
.pz v(drain) vin1x
.ac dec 100 1e3 1e9
.print dc i(M1) v(drain)
.print ac vdb(drain)
.plot ac vdb(drain)

.end
