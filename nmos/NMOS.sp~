.title NMOS
.options post

**** include model file ****
.inc ./par0.18um.net

**** Components ****
M1 Vd Vg 0 0 N_18 W=3u L=1u M=2

**** Sources ****
Vds Vd 0
Vgs Vg 0

**** Controls ****
.dc Vds 0v 1.8v 0.01v Vgs 0.6v 1.8v 0.2v
.op
.print dc i(m1)

.end
