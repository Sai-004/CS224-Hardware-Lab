
�
Command: %s
1870*	planAhead2�
�read_checkpoint -auto_incremental -incremental C:/Users/Adarsh/Downloads/Part2/Assignment_5b/Assignment_5b.srcs/utils_1/imports/synth_1/Top_Module.dcp2default:defaultZ12-2866h px� 
�
;Read reference checkpoint from %s for incremental synthesis3154*	planAhead2{
gC:/Users/Adarsh/Downloads/Part2/Assignment_5b/Assignment_5b.srcs/utils_1/imports/synth_1/Top_Module.dcp2default:defaultZ12-5825h px� 
T
-Please ensure there are no constraint changes3725*	planAheadZ12-7989h px� 
z
Command: %s
53*	vivadotcl2I
5synth_design -top Top_Module -part xc7a100ticsg324-1L2default:defaultZ4-113h px� 
:
Starting synth_design
149*	vivadotclZ4-321h px� 
�
@Attempting to get a license for feature '%s' and/or device '%s'
308*common2
	Synthesis2default:default2
	xc7a100ti2default:defaultZ17-347h px� 
�
0Got license for feature '%s' and/or device '%s'
310*common2
	Synthesis2default:default2
	xc7a100ti2default:defaultZ17-349h px� 
Y
Loading part %s157*device2&
xc7a100ticsg324-1L2default:defaultZ21-403h px� 
�
HMultithreading enabled for synth_design using a maximum of %s processes.4828*oasys2
22default:defaultZ8-7079h px� 
a
?Launching helper process for spawning children vivado processes4827*oasysZ8-7078h px� 
`
#Helper process launched with PID %s4824*oasys2
275082default:defaultZ8-7075h px� 
�
5undeclared symbol '%s', assumed default net type '%s'7502*oasys2
REGCCE2default:default2
wire2default:default2[
EC:/Xilinx/Vivado/2022.2/data/verilog/src/unimacro/BRAM_SINGLE_MACRO.v2default:default2
21702default:default8@Z8-11241h px� 
�
%s*synth2�
yStarting RTL Elaboration : Time (s): cpu = 00:00:04 ; elapsed = 00:00:06 . Memory (MB): peak = 1222.066 ; gain = 408.398
2default:defaulth px� 
�
synthesizing module '%s'%s4497*oasys2

Top_Module2default:default2
 2default:default2q
[C:/Users/Adarsh/Downloads/Part2/Assignment_5b/Assignment_5b.srcs/sources_1/new/Top_Module.v2default:default2
232default:default8@Z8-6157h px� 
�
synthesizing module '%s'%s4497*oasys2

slow_clock2default:default2
 2default:default2q
[C:/Users/Adarsh/Downloads/Part2/Assignment_5b/Assignment_5b.srcs/sources_1/new/Top_Module.v2default:default2
552default:default8@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2

slow_clock2default:default2
 2default:default2
02default:default2
12default:default2q
[C:/Users/Adarsh/Downloads/Part2/Assignment_5b/Assignment_5b.srcs/sources_1/new/Top_Module.v2default:default2
552default:default8@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2
Cache2default:default2
 2default:default2l
VC:/Users/Adarsh/Downloads/Part2/Assignment_5b/Assignment_5b.srcs/sources_1/new/Cache.v2default:default2
32default:default8@Z8-6157h px� 
�
7fork/join block will be implemented as sequential block290*oasys2l
VC:/Users/Adarsh/Downloads/Part2/Assignment_5b/Assignment_5b.srcs/sources_1/new/Cache.v2default:default2
912default:default8@Z8-290h px� 
�
7fork/join block will be implemented as sequential block290*oasys2l
VC:/Users/Adarsh/Downloads/Part2/Assignment_5b/Assignment_5b.srcs/sources_1/new/Cache.v2default:default2
2212default:default8@Z8-290h px� 
�
-case statement is not full and has no default155*oasys2l
VC:/Users/Adarsh/Downloads/Part2/Assignment_5b/Assignment_5b.srcs/sources_1/new/Cache.v2default:default2
572default:default8@Z8-155h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
Cache2default:default2
 2default:default2
02default:default2
12default:default2l
VC:/Users/Adarsh/Downloads/Part2/Assignment_5b/Assignment_5b.srcs/sources_1/new/Cache.v2default:default2
32default:default8@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2
uart2default:default2
 2default:default2k
UC:/Users/Adarsh/Downloads/Part2/Assignment_5b/Assignment_5b.srcs/sources_1/new/UART.v2default:default2
232default:default8@Z8-6157h px� 
�
default block is never used226*oasys2k
UC:/Users/Adarsh/Downloads/Part2/Assignment_5b/Assignment_5b.srcs/sources_1/new/UART.v2default:default2
842default:default8@Z8-226h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
uart2default:default2
 2default:default2
02default:default2
12default:default2k
UC:/Users/Adarsh/Downloads/Part2/Assignment_5b/Assignment_5b.srcs/sources_1/new/UART.v2default:default2
232default:default8@Z8-6155h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2

Top_Module2default:default2
 2default:default2
02default:default2
12default:default2q
[C:/Users/Adarsh/Downloads/Part2/Assignment_5b/Assignment_5b.srcs/sources_1/new/Top_Module.v2default:default2
232default:default8@Z8-6155h px� 
�
\Potential Runtime issue for 3D-RAM or RAM from Record/Structs for RAM  %s with %s registers
9240*oasys2
lru_reg2default:default2
133122default:defaultZ8-11357h px� 
�
\Potential Runtime issue for 3D-RAM or RAM from Record/Structs for RAM  %s with %s registers
9240*oasys2
tag_reg2default:default2
184322default:defaultZ8-11357h px� 
�
+Unused sequential element %s was removed. 
4326*oasys2
inx_reg2default:default2l
VC:/Users/Adarsh/Downloads/Part2/Assignment_5b/Assignment_5b.srcs/sources_1/new/Cache.v2default:default2
872default:default8@Z8-6014h px� 
�
+Unused sequential element %s was removed. 
4326*oasys2
c_reg2default:default2l
VC:/Users/Adarsh/Downloads/Part2/Assignment_5b/Assignment_5b.srcs/sources_1/new/Cache.v2default:default2
892default:default8@Z8-6014h px� 
�
+Unused sequential element %s was removed. 
4326*oasys2
d_reg2default:default2l
VC:/Users/Adarsh/Downloads/Part2/Assignment_5b/Assignment_5b.srcs/sources_1/new/Cache.v2default:default2
1222default:default8@Z8-6014h px� 
l
+Unused sequential element %s was removed. 
4326*oasys2
	queue_reg2default:defaultZ8-6014h px� 
�
+Unused sequential element %s was removed. 
4326*oasys2
	index_reg2default:default2l
VC:/Users/Adarsh/Downloads/Part2/Assignment_5b/Assignment_5b.srcs/sources_1/new/Cache.v2default:default2
1802default:default8@Z8-6014h px� 
�
+Unused sequential element %s was removed. 
4326*oasys2
e_reg2default:default2l
VC:/Users/Adarsh/Downloads/Part2/Assignment_5b/Assignment_5b.srcs/sources_1/new/Cache.v2default:default2
2142default:default8@Z8-6014h px� 
�
qTrying to implement RAM '%s' in registers. Block RAM or DRAM implementation is not possible; see log for reasons.3901*oasys2
	check_reg2default:defaultZ8-4767h px� 
U
%s
*synth2=
)Reason is one or more of the following :
2default:defaulth p
x
� 
�
%s
*synth2�
~	1: RAM has multiple writes via different ports in same process. If RAM inferencing intended, write to one port per process. 
2default:defaulth p
x
� 
j
%s
*synth2R
>	2: Unable to determine number of words or word size in RAM. 
2default:defaulth p
x
� 
T
%s
*synth2<
(	3: No valid read/write found for RAM. 
2default:defaulth p
x
� 
U
%s
*synth2=
)RAM "check_reg" dissolved into registers
2default:defaulth p
x
� 
�
+design %s has port %s driven by constant %s3447*oasys2

Top_Module2default:default2
an[7]2default:default2
02default:defaultZ8-3917h px� 
�
+design %s has port %s driven by constant %s3447*oasys2

Top_Module2default:default2
an[6]2default:default2
12default:defaultZ8-3917h px� 
�
+design %s has port %s driven by constant %s3447*oasys2

Top_Module2default:default2
an[5]2default:default2
12default:defaultZ8-3917h px� 
�
+design %s has port %s driven by constant %s3447*oasys2

Top_Module2default:default2
an[4]2default:default2
12default:defaultZ8-3917h px� 
�
+design %s has port %s driven by constant %s3447*oasys2

Top_Module2default:default2
an[3]2default:default2
12default:defaultZ8-3917h px� 
�
+design %s has port %s driven by constant %s3447*oasys2

Top_Module2default:default2
an[2]2default:default2
12default:defaultZ8-3917h px� 
�
+design %s has port %s driven by constant %s3447*oasys2

Top_Module2default:default2
an[1]2default:default2
12default:defaultZ8-3917h px� 
�
+design %s has port %s driven by constant %s3447*oasys2

Top_Module2default:default2
an[0]2default:default2
12default:defaultZ8-3917h px� 
�
%s*synth2�
yFinished RTL Elaboration : Time (s): cpu = 00:00:16 ; elapsed = 00:00:20 . Memory (MB): peak = 1692.355 ; gain = 878.688
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
M
%s
*synth25
!Start Handling Custom Attributes
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Handling Custom Attributes : Time (s): cpu = 00:00:17 ; elapsed = 00:00:21 . Memory (MB): peak = 1692.355 ; gain = 878.688
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished RTL Optimization Phase 1 : Time (s): cpu = 00:00:17 ; elapsed = 00:00:21 . Memory (MB): peak = 1692.355 ; gain = 878.688
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2 
00:00:00.7822default:default2
1692.3552default:default2
0.0002default:defaultZ17-268h px� 
K
)Preparing netlist for logic optimization
349*projectZ1-570h px� 
>

Processing XDC Constraints
244*projectZ1-262h px� 
=
Initializing timing engine
348*projectZ1-569h px� 
�
Parsing XDC File [%s]
179*designutils2q
[C:/Users/Adarsh/Downloads/Part2/Assignment_5b/Assignment_5b.srcs/constrs_1/new/nexys_a7.xdc2default:default8Z20-179h px� 
�
Finished Parsing XDC File [%s]
178*designutils2q
[C:/Users/Adarsh/Downloads/Part2/Assignment_5b/Assignment_5b.srcs/constrs_1/new/nexys_a7.xdc2default:default8Z20-178h px� 
�
�Implementation specific constraints were found while reading constraint file [%s]. These constraints will be ignored for synthesis but will be used in implementation. Impacted constraints are listed in the file [%s].
233*project2o
[C:/Users/Adarsh/Downloads/Part2/Assignment_5b/Assignment_5b.srcs/constrs_1/new/nexys_a7.xdc2default:default20
.Xil/Top_Module_propImpl.xdc2default:defaultZ1-236h px� 
H
&Completed Processing XDC Constraints

245*projectZ1-263h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2 
00:00:00.0132default:default2
1824.4652default:default2
0.0002default:defaultZ17-268h px� 
~
!Unisim Transformation Summary:
%s111*project29
%No Unisim elements were transformed.
2default:defaultZ1-111h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common24
 Constraint Validation Runtime : 2default:default2
00:00:002default:default2 
00:00:00.2282default:default2
1824.4652default:default2
0.0002default:defaultZ17-268h px� 
�
5undeclared symbol '%s', assumed default net type '%s'7502*oasys2
REGCCE2default:default2
wire2default:default2[
EC:/Xilinx/Vivado/2022.2/data/verilog/src/unimacro/BRAM_SINGLE_MACRO.v2default:default2
21702default:default8@Z8-11241h px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Constraint Validation : Time (s): cpu = 00:00:33 ; elapsed = 00:00:40 . Memory (MB): peak = 1824.465 ; gain = 1010.797
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
V
%s
*synth2>
*Start Loading Part and Timing Information
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
M
%s
*synth25
!Loading part: xc7a100ticsg324-1L
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Loading Part and Timing Information : Time (s): cpu = 00:00:33 ; elapsed = 00:00:40 . Memory (MB): peak = 1824.465 ; gain = 1010.797
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
Z
%s
*synth2B
.Start Applying 'set_property' XDC Constraints
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished applying 'set_property' XDC Constraints : Time (s): cpu = 00:00:33 ; elapsed = 00:00:40 . Memory (MB): peak = 1824.465 ; gain = 1010.797
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
I
%s
*synth21
Start Preparing Guide Design
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
}Finished Doing Graph Differ : Time (s): cpu = 00:00:37 ; elapsed = 00:00:45 . Memory (MB): peak = 1824.465 ; gain = 1010.797
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s
*synth2�
�Cache__GB13Cache__GB15Cache__GB7Cache__GB11Cache__GB4Cache__GB10Cache__GB1Cache__GB9Cache__GB0Cache__GB5Cache__GB8Cache__GB2Cache__GB17Cache__GB6Cache__GB14Cache__GB3Cache__GB12Top_Module__GC0Cache__GB16Cache__GB18---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Preparing Guide Design : Time (s): cpu = 00:00:39 ; elapsed = 00:00:47 . Memory (MB): peak = 1824.465 ; gain = 1010.797
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished RTL Optimization Phase 2 : Time (s): cpu = 00:00:41 ; elapsed = 00:00:49 . Memory (MB): peak = 1824.465 ; gain = 1010.797
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
P
%s
*synth28
$Start Mimic Skeleton from Reference
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Mimic Skeleton from Reference : Time (s): cpu = 00:00:42 ; elapsed = 00:00:51 . Memory (MB): peak = 1824.465 ; gain = 1010.797
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
U
%s
*synth2=
)

Incremental Synthesis Report Summary:

2default:defaulth p
x
� 
O
%s
*synth27
#1. Incremental synthesis run: yes

2default:defaulth p
x
� 
N
%s
*synth26
"   Stitch points used : changed


2default:defaulth p
x
� 
>
%s
*synth2&
2. Change Summary
2default:defaulth p
x
� 
J
%s
*synth22

Report Incremental Modules: 
2default:defaulth p
x
� 
d
%s
*synth2L
8+-+----------------+------------+----------+----------+
2default:defaulth p
x
� 
d
%s
*synth2L
8| |Changed Modules |Replication |Instances |Changed % |
2default:defaulth p
x
� 
d
%s
*synth2L
8+-+----------------+------------+----------+----------+
2default:defaulth p
x
� 
d
%s
*synth2L
8+-+----------------+------------+----------+----------+
2default:defaulth p
x
� 
.
%s
*synth2


2default:defaulth p
x
� 
[
%s
*synth2C
/   Full Design Size (number of cells) : 396520
2default:defaulth p
x
� 
]
%s
*synth2E
1   Resynthesis Design Size (number of cells) : 0
2default:defaulth p
x
� 
X
%s
*synth2@
,   Resynth % : 0.0000,  Reuse % : 100.0000

2default:defaulth p
x
� 
Q
%s
*synth29
%3. Reference Checkpoint Information

2default:defaulth p
x
� 
�
%s
*synth2�
}+--------------------------------------------------------------------------------------------------------------------------+
2default:defaulth p
x
� 
�
%s
*synth2�
}| DCP Location:  | C:/Users/Adarsh/Downloads/Part2/Assignment_5b/Assignment_5b.srcs/utils_1/imports/synth_1/Top_Module.dcp |
2default:defaulth p
x
� 
�
%s
*synth2�
+--------------------------------------------------------------------------------------------------------------------------+


2default:defaulth p
x
� 
n
%s
*synth2V
B+--------------------------------+------------------------------+
2default:defaulth p
x
� 
n
%s
*synth2V
B|         DCP Information        |             Value            |
2default:defaulth p
x
� 
n
%s
*synth2V
B+--------------------------------+------------------------------+
2default:defaulth p
x
� 
l
%s
*synth2T
@| Vivado Version                 |                    v2022.2 |
2default:defaulth p
x
� 
n
%s
*synth2V
B| DCP State                      |                              |
2default:defaulth p
x
� 
n
%s
*synth2V
B+--------------------------------+------------------------------+
2default:defaulth p
x
� 
.
%s
*synth2


2default:defaulth p
x
� 
E
%s
*synth2-

Report RTL Partitions: 
2default:defaulth p
x
� 
f
%s
*synth2N
:+------+------------------------+------------+----------+
2default:defaulth p
x
� 
f
%s
*synth2N
:|      |RTL Partition           |Replication |Instances |
2default:defaulth p
x
� 
f
%s
*synth2N
:+------+------------------------+------------+----------+
2default:defaulth p
x
� 
f
%s
*synth2N
:|1     |Cache__GB0_#REUSE#      |           1|         0|
2default:defaulth p
x
� 
f
%s
*synth2N
:|2     |Cache__GB1_#REUSE#      |           1|         0|
2default:defaulth p
x
� 
f
%s
*synth2N
:|3     |Cache__GB2_#REUSE#      |           1|         0|
2default:defaulth p
x
� 
f
%s
*synth2N
:|4     |Cache__GB3_#REUSE#      |           1|         0|
2default:defaulth p
x
� 
f
%s
*synth2N
:|5     |Cache__GB4_#REUSE#      |           1|         0|
2default:defaulth p
x
� 
f
%s
*synth2N
:|6     |Cache__GB5_#REUSE#      |           1|         0|
2default:defaulth p
x
� 
f
%s
*synth2N
:|7     |Cache__GB6_#REUSE#      |           1|         0|
2default:defaulth p
x
� 
f
%s
*synth2N
:|8     |Cache__GB7_#REUSE#      |           1|         0|
2default:defaulth p
x
� 
f
%s
*synth2N
:|9     |Cache__GB8_#REUSE#      |           1|         0|
2default:defaulth p
x
� 
f
%s
*synth2N
:|10    |Cache__GB9_#REUSE#      |           1|         0|
2default:defaulth p
x
� 
f
%s
*synth2N
:|11    |Cache__GB10_#REUSE#     |           1|         0|
2default:defaulth p
x
� 
f
%s
*synth2N
:|12    |Cache__GB11_#REUSE#     |           1|         0|
2default:defaulth p
x
� 
f
%s
*synth2N
:|13    |Cache__GB12_#REUSE#     |           1|         0|
2default:defaulth p
x
� 
f
%s
*synth2N
:|14    |Cache__GB13_#REUSE#     |           1|         0|
2default:defaulth p
x
� 
f
%s
*synth2N
:|15    |Cache__GB14_#REUSE#     |           1|         0|
2default:defaulth p
x
� 
f
%s
*synth2N
:|16    |Cache__GB15_#REUSE#     |           1|         0|
2default:defaulth p
x
� 
f
%s
*synth2N
:|17    |Cache__GB16_#REUSE#     |           1|         0|
2default:defaulth p
x
� 
f
%s
*synth2N
:|18    |Cache__GB17_#REUSE#     |           1|         0|
2default:defaulth p
x
� 
f
%s
*synth2N
:|19    |Cache__GB18_#REUSE#     |           1|         0|
2default:defaulth p
x
� 
f
%s
*synth2N
:|20    |Top_Module__GC0_#REUSE# |           1|         0|
2default:defaulth p
x
� 
f
%s
*synth2N
:+------+------------------------+------------+----------+
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
L
%s
*synth24
 Start RTL Component Statistics 
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
K
%s
*synth23
Detailed RTL Component Info : 
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
O
%s
*synth27
#Finished RTL Component Statistics 
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
H
%s
*synth20
Start Part Resource Summary
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s
*synth2k
WPart Resources:
DSPs: 240 (col length:80)
BRAMs: 270 (col length: RAMB18 80 RAMB36 40)
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
K
%s
*synth23
Finished Part Resource Summary
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
W
%s
*synth2?
+Start Cross Boundary and Area Optimization
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
H
&Parallel synthesis criteria is not met4829*oasysZ8-7080h px� 
�
lIncrSyn: subsequent runs will still be incremental as the reference run was parallel and that data is reused4826*oasysZ8-7077h px� 
�
+design %s has port %s driven by constant %s3447*oasys2

Top_Module2default:default2
an[7]2default:default2
02default:defaultZ8-3917h px� 
�
+design %s has port %s driven by constant %s3447*oasys2

Top_Module2default:default2
an[6]2default:default2
12default:defaultZ8-3917h px� 
�
+design %s has port %s driven by constant %s3447*oasys2

Top_Module2default:default2
an[5]2default:default2
12default:defaultZ8-3917h px� 
�
+design %s has port %s driven by constant %s3447*oasys2

Top_Module2default:default2
an[4]2default:default2
12default:defaultZ8-3917h px� 
�
+design %s has port %s driven by constant %s3447*oasys2

Top_Module2default:default2
an[3]2default:default2
12default:defaultZ8-3917h px� 
�
+design %s has port %s driven by constant %s3447*oasys2

Top_Module2default:default2
an[2]2default:default2
12default:defaultZ8-3917h px� 
�
+design %s has port %s driven by constant %s3447*oasys2

Top_Module2default:default2
an[1]2default:default2
12default:defaultZ8-3917h px� 
�
+design %s has port %s driven by constant %s3447*oasys2

Top_Module2default:default2
an[0]2default:default2
12default:defaultZ8-3917h px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Cross Boundary and Area Optimization : Time (s): cpu = 00:00:46 ; elapsed = 00:01:04 . Memory (MB): peak = 1824.465 ; gain = 1010.797
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
V
%s
*synth2>
*Start Stitch Unchanged AreaOpt Partitions
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Stitch Unchanged AreaOpt Partitions : Time (s): cpu = 00:00:47 ; elapsed = 00:01:05 . Memory (MB): peak = 1824.465 ; gain = 1010.797
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
R
%s
*synth2:
&Start Applying XDC Timing Constraints
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Applying XDC Timing Constraints : Time (s): cpu = 00:00:53 ; elapsed = 00:01:12 . Memory (MB): peak = 1824.465 ; gain = 1010.797
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
F
%s
*synth2.
Start Timing Optimization
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
~Finished Timing Optimization : Time (s): cpu = 00:00:54 ; elapsed = 00:01:13 . Memory (MB): peak = 1824.465 ; gain = 1010.797
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
E
%s
*synth2-
Start Technology Mapping
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
H
&Parallel synthesis criteria is not met4829*oasysZ8-7080h px� 
�
lIncrSyn: subsequent runs will still be incremental as the reference run was parallel and that data is reused4826*oasysZ8-7077h px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
}Finished Technology Mapping : Time (s): cpu = 00:00:54 ; elapsed = 00:01:13 . Memory (MB): peak = 1824.465 ; gain = 1010.797
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
N
%s
*synth26
"Start Stitch Unchanged Partitions
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Stitch Unchanged Partitions : Time (s): cpu = 00:00:55 ; elapsed = 00:01:13 . Memory (MB): peak = 1824.465 ; gain = 1010.797
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
?
%s
*synth2'
Start IO Insertion
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
Q
%s
*synth29
%Start Flattening Before IO Insertion
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
T
%s
*synth2<
(Finished Flattening Before IO Insertion
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
H
%s
*synth20
Start Final Netlist Cleanup
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
K
%s
*synth23
Finished Final Netlist Cleanup
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
wFinished IO Insertion : Time (s): cpu = 00:01:25 ; elapsed = 00:01:47 . Memory (MB): peak = 1824.465 ; gain = 1010.797
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
O
%s
*synth27
#Start Renaming Generated Instances
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Renaming Generated Instances : Time (s): cpu = 00:01:25 ; elapsed = 00:01:48 . Memory (MB): peak = 1824.465 ; gain = 1010.797
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
L
%s
*synth24
 Start Rebuilding User Hierarchy
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Rebuilding User Hierarchy : Time (s): cpu = 00:01:27 ; elapsed = 00:01:50 . Memory (MB): peak = 1824.465 ; gain = 1010.797
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
K
%s
*synth23
Start Renaming Generated Ports
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Renaming Generated Ports : Time (s): cpu = 00:01:27 ; elapsed = 00:01:50 . Memory (MB): peak = 1824.465 ; gain = 1010.797
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
M
%s
*synth25
!Start Handling Custom Attributes
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Handling Custom Attributes : Time (s): cpu = 00:01:31 ; elapsed = 00:01:55 . Memory (MB): peak = 1824.465 ; gain = 1010.797
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
J
%s
*synth22
Start Renaming Generated Nets
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Renaming Generated Nets : Time (s): cpu = 00:01:32 ; elapsed = 00:01:55 . Memory (MB): peak = 1824.465 ; gain = 1010.797
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
K
%s
*synth23
Start Writing Synthesis Report
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
A
%s
*synth2)

Report BlackBoxes: 
2default:defaulth p
x
� 
J
%s
*synth22
+-+--------------+----------+
2default:defaulth p
x
� 
J
%s
*synth22
| |BlackBox name |Instances |
2default:defaulth p
x
� 
J
%s
*synth22
+-+--------------+----------+
2default:defaulth p
x
� 
J
%s
*synth22
+-+--------------+----------+
2default:defaulth p
x
� 
A
%s*synth2)

Report Cell Usage: 
2default:defaulth px� 
D
%s*synth2,
+------+-------+------+
2default:defaulth px� 
D
%s*synth2,
|      |Cell   |Count |
2default:defaulth px� 
D
%s*synth2,
+------+-------+------+
2default:defaulth px� 
D
%s*synth2,
|1     |BUFG   |     2|
2default:defaulth px� 
D
%s*synth2,
|2     |CARRY4 |    89|
2default:defaulth px� 
D
%s*synth2,
|3     |LUT1   |     5|
2default:defaulth px� 
D
%s*synth2,
|4     |LUT2   |   328|
2default:defaulth px� 
D
%s*synth2,
|5     |LUT3   |  8794|
2default:defaulth px� 
D
%s*synth2,
|6     |LUT4   |  8440|
2default:defaulth px� 
D
%s*synth2,
|7     |LUT5   |  4436|
2default:defaulth px� 
D
%s*synth2,
|8     |LUT6   | 22245|
2default:defaulth px� 
D
%s*synth2,
|9     |MUXF7  |  3055|
2default:defaulth px� 
D
%s*synth2,
|10    |MUXF8  |  1322|
2default:defaulth px� 
D
%s*synth2,
|11    |FDRE   | 32145|
2default:defaulth px� 
D
%s*synth2,
|12    |IBUF   |     3|
2default:defaulth px� 
D
%s*synth2,
|13    |OBUF   |    25|
2default:defaulth px� 
D
%s*synth2,
+------+-------+------+
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Writing Synthesis Report : Time (s): cpu = 00:01:32 ; elapsed = 00:01:55 . Memory (MB): peak = 1824.465 ; gain = 1010.797
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
s
%s
*synth2[
GSynthesis finished with 0 errors, 0 critical warnings and 12 warnings.
2default:defaulth p
x
� 
�
%s
*synth2�
Synthesis Optimization Runtime : Time (s): cpu = 00:01:06 ; elapsed = 00:01:44 . Memory (MB): peak = 1824.465 ; gain = 878.688
2default:defaulth p
x
� 
�
%s
*synth2�
�Synthesis Optimization Complete : Time (s): cpu = 00:01:32 ; elapsed = 00:01:56 . Memory (MB): peak = 1824.465 ; gain = 1010.797
2default:defaulth p
x
� 
B
 Translating synthesized netlist
350*projectZ1-571h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2.
Netlist sorting complete. 2default:default2
00:00:012default:default2 
00:00:00.8762default:default2
1824.4652default:default2
0.0002default:defaultZ17-268h px� 
h
-Analyzing %s Unisim elements for replacement
17*netlist2
44662default:defaultZ29-17h px� 
j
2Unisim Transformation completed in %s CPU seconds
28*netlist2
02default:defaultZ29-28h px� 
�
�Netlist '%s' is not ideal for floorplanning, since the cellview '%s' contains a large number of primitives.  Please consider enabling hierarchy in synthesis if you want to do floorplanning.
310*netlist2

Top_Module2default:default2
Cache2default:defaultZ29-101h px� 
K
)Preparing netlist for logic optimization
349*projectZ1-570h px� 
u
)Pushed %s inverter(s) to %s load pin(s).
98*opt2
02default:default2
02default:defaultZ31-138h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2 
00:00:00.0262default:default2
1824.4652default:default2
0.0002default:defaultZ17-268h px� 
~
!Unisim Transformation Summary:
%s111*project29
%No Unisim elements were transformed.
2default:defaultZ1-111h px� 
g
$Synth Design complete, checksum: %s
562*	vivadotcl2
45d8ab7a2default:defaultZ4-1430h px� 
U
Releasing license: %s
83*common2
	Synthesis2default:defaultZ17-83h px� 
�
G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
292default:default2
322default:default2
02default:default2
02default:defaultZ4-41h px� 
^
%s completed successfully
29*	vivadotcl2 
synth_design2default:defaultZ4-42h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2"
synth_design: 2default:default2
00:01:492default:default2
00:02:172default:default2
1824.4652default:default2
1405.8052default:defaultZ17-268h px� 
�
 The %s '%s' has been generated.
621*common2

checkpoint2default:default2k
WC:/Users/Adarsh/Downloads/Part2/Assignment_5b/Assignment_5b.runs/synth_1/Top_Module.dcp2default:defaultZ17-1381h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2&
write_checkpoint: 2default:default2
00:00:092default:default2
00:00:082default:default2
1824.4652default:default2
0.0002default:defaultZ17-268h px� 
�
%s4*runtcl2~
jExecuting : report_utilization -file Top_Module_utilization_synth.rpt -pb Top_Module_utilization_synth.pb
2default:defaulth px� 
�
Exiting %s at %s...
206*common2
Vivado2default:default2,
Fri Apr 14 11:14:27 20232default:defaultZ17-206h px� 


End Record