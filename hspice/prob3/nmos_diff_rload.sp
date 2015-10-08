** Eddie's Problem 3 netlist file.

.title NMOS
.options post

** include model file
.inc ../par0.18um.net
.param M1Width = 60u
.param M2Width = 60u
.param M3Width = 100u
.param M4Width = 100u
.param M5Width = 60u
.param M6Width = 60u

**Components
M1 g34 vin1 b 0 P_18 W=60u L=0.25u M=1 AD=0.6u*M1Width AS=0.6u*M1Width PS=1.2u+2*M1Width PD=1.2u+2*M1Width
M2 vout vin2 b 0 P_18 W=60u L=0.25u M=1 AD=0.6u*M2Width AS=0.6u*M2Width PS=1.2u+2*M2Width PD=1.2u+2*M2Width
M3 g34 g34 vcc 0 N_18 W=100u L=0.5u M=1 AD=0.6u*M3Width AS=0.6u*M3Width PS=1.2u+2*M3Width PD=1.2u+2*M3Width
M4 vout g34 vcc 0 N_18 W=100u L=0.5u M=1 AD=0.6u*M4Width AS=0.6u*M4Width PS=1.2u+2*M4Width PD=1.2u+2*M4Width
M5 b g56 vdd 0 N_18 W=60u L=0.5u M=1 AD=0.6u*M5Width AS=0.6u*M5Width PS=1.2u+2*M5Width PD=1.2u+2*M5Width
M6 g56 g56 vdd 0 N_18 W=60u L=0.5u M=1 AD=0.6u*M6Width AS=0.6u*M6Width PS=1.2u+2*M6Width PD=1.2u+2*M6Width


R1 vcc g56 8560

C1 vout vdd 1e-12 


**Sources
Vccx  vdd 0 DC=0.9V 
Vddx  vdd 0 DC=-0.9V

Vin1x vin1 0 DC=0.6V AC=0.5,0


**Controls
.op
.pz v(drain) vin1x
.ac dec 100 1e3 1e9
.print dc i(M1) v(drain)
.print ac vdb(drain)
.plot ac vdb(drain)

.end
