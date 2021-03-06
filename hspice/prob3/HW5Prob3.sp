.title HW5Prob3
.options post

**** inlude model file ****
.inc  ../par0.18um.net

**** Parameters ****
.param M12W = 60u
.param M34W = 100u
.param M56W = 60u

**** Transistors ****
M1 n5 n3 n2 n1 P_18 W=M12W L=0.25u M=1 AD=0.6u*M12W AS=0.6u*M12W PS=1.2u+2*M12W PD=1.2u+2*M12W
M2 n6 n4 n2 n1 P_18 W=M12W L=0.25u M=1 AD=0.6u*M12W AS=0.6u*M12W PS=1.2u+2*M12W PD=1.2u+2*M12W
M3 n5 n7 0 0 N_18 W=M34W L=0.5u M=1 AD=0.6u*M34W AS=0.6u*M34W PS=1.2u+2*M34W PD=1.2u+2*M34W
M4 n6 n7 0 0 N_18 W=M34W L=0.5u M=1 AD=0.6u*M34W AS=0.6u*M34W PS=1.2u+2*M34W PD=1.2u+2*M34W
M5 n9 n8 n5 0 N_18 W=M56W L=0.5u M=1 AD=0.6u*M56W AS=0.6u*M56W PS=1.2u+2*M56W PD=1.2u+2*M56W
M6 n10 n8 n6 0 N_18 W=M56W L=0.5u M=1 AD=0.6u*M56W AS=0.6u*M56W PS=1.2u+2*M56W PD=1.2u+2*M56W

**** Passive Components ****
R1 n1 n9 R=4K
R2 n1 n10 R=4K
C1 n9 n10 C=1p

**** Sources ****
Vdd n1 0 DC=1.8v
Iss n1 n2 DC=300u
Vin1 n3 0 DC=0.9v AC=0.5v,0
Vin2 n4 0 DC=0.9v AC=0.5v,180
Vb1 n7 0 DC=0.58v
Vb2 n8 0 DC=1v

**** Controls ****                                                                 
.op
.ac dec 10 1k 100meg
.print ac vdb(n9,n10) vp(n9,n10)
.pz v(n9) Vin1

.end
