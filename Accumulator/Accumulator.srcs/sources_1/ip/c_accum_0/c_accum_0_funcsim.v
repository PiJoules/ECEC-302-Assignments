// Copyright 1986-2014 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2014.4 (win64) Build 1071353 Tue Nov 18 18:29:27 MST 2014
// Date        : Wed May 27 14:25:52 2015
// Host        : ECE-RM215-06 running 64-bit Service Pack 1  (build 7601)
// Command     : write_verilog -force -mode funcsim
//               c:/Users/lc599.DREXEL/Desktop/Accumulator/Accumulator.srcs/sources_1/ip/c_accum_0/c_accum_0_funcsim.v
// Design      : c_accum_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a35tcpg236-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "c_accum_v12_0,Vivado 2014.4" *) (* CHECK_LICENSE_TYPE = "c_accum_0,c_accum_v12_0,{}" *) 
(* core_generation_info = "c_accum_0,c_accum_v12_0,{x_ipProduct=Vivado 2014.4,x_ipVendor=xilinx.com,x_ipLibrary=ip,x_ipName=c_accum,x_ipVersion=12.0,x_ipCoreRevision=5,x_ipLanguage=VERILOG,x_ipSimLanguage=MIXED,C_XDEVICEFAMILY=artix7,C_IMPLEMENTATION=0,C_VERBOSITY=0,C_B_WIDTH=4,C_OUT_WIDTH=8,C_B_TYPE=0,C_CE_OVERRIDES_SCLR=0,C_ADD_MODE=0,C_HAS_C_IN=0,C_HAS_CE=0,C_HAS_BYPASS=0,C_HAS_SCLR=1,C_LATENCY=1,C_SCALE=0,C_AINIT_VAL=0,C_SINIT_VAL=0,C_BYPASS_LOW=0,C_SCLR_OVERRIDES_SSET=1,C_HAS_SSET=0,C_HAS_SINIT=0}" *) 
(* NotValidForBitStream *)
module c_accum_0
   (B,
    CLK,
    SCLR,
    Q);
  input [3:0]B;
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clk_intf CLK" *) input CLK;
  (* x_interface_info = "xilinx.com:signal:reset:1.0 sclr_intf RST" *) input SCLR;
  output [7:0]Q;

  wire [3:0]B;
  wire CLK;
  wire [7:0]Q;
  wire SCLR;

(* C_AINIT_VAL = "0" *) 
   (* C_CE_OVERRIDES_SCLR = "0" *) 
   (* C_HAS_CE = "0" *) 
   (* C_HAS_SCLR = "1" *) 
   (* C_HAS_SINIT = "0" *) 
   (* C_HAS_SSET = "0" *) 
   (* C_IMPLEMENTATION = "0" *) 
   (* C_SCLR_OVERRIDES_SSET = "1" *) 
   (* C_SINIT_VAL = "0" *) 
   (* C_XDEVICEFAMILY = "artix7" *) 
   (* DONT_TOUCH *) 
   (* c_add_mode = "0" *) 
   (* c_b_type = "0" *) 
   (* c_b_width = "4" *) 
   (* c_bypass_low = "0" *) 
   (* c_has_bypass = "0" *) 
   (* c_has_c_in = "0" *) 
   (* c_latency = "1" *) 
   (* c_out_width = "8" *) 
   (* c_scale = "0" *) 
   (* c_verbosity = "0" *) 
   (* downgradeipidentifiedwarnings = "yes" *) 
   c_accum_0_c_accum_v12_0__parameterized0 U0
       (.ADD(1'b1),
        .B(B),
        .BYPASS(1'b0),
        .CE(1'b1),
        .CLK(CLK),
        .C_IN(1'b0),
        .Q(Q),
        .SCLR(SCLR),
        .SINIT(1'b0),
        .SSET(1'b0));
endmodule

(* ORIG_REF_NAME = "c_accum_v12_0" *) (* C_XDEVICEFAMILY = "artix7" *) (* C_IMPLEMENTATION = "0" *) 
(* C_VERBOSITY = "0" *) (* C_B_WIDTH = "4" *) (* C_OUT_WIDTH = "8" *) 
(* C_B_TYPE = "0" *) (* C_CE_OVERRIDES_SCLR = "0" *) (* C_ADD_MODE = "0" *) 
(* C_HAS_C_IN = "0" *) (* C_HAS_CE = "0" *) (* C_HAS_BYPASS = "0" *) 
(* C_HAS_SCLR = "1" *) (* C_LATENCY = "1" *) (* C_SCALE = "0" *) 
(* C_AINIT_VAL = "0" *) (* C_SINIT_VAL = "0" *) (* C_BYPASS_LOW = "0" *) 
(* C_SCLR_OVERRIDES_SSET = "1" *) (* C_HAS_SSET = "0" *) (* C_HAS_SINIT = "0" *) 
(* downgradeipidentifiedwarnings = "yes" *) 
module c_accum_0_c_accum_v12_0__parameterized0
   (B,
    CLK,
    ADD,
    C_IN,
    CE,
    BYPASS,
    SCLR,
    SSET,
    SINIT,
    Q);
  input [3:0]B;
  input CLK;
  input ADD;
  input C_IN;
  input CE;
  input BYPASS;
  input SCLR;
  input SSET;
  input SINIT;
  output [7:0]Q;

  wire ADD;
  wire [3:0]B;
  wire BYPASS;
  wire CE;
  wire CLK;
  wire C_IN;
  wire [7:0]Q;
  wire SCLR;
  wire SINIT;
  wire SSET;

(* C_AINIT_VAL = "0" *) 
   (* C_CE_OVERRIDES_SCLR = "0" *) 
   (* C_HAS_CE = "0" *) 
   (* C_HAS_SCLR = "1" *) 
   (* C_HAS_SINIT = "0" *) 
   (* C_HAS_SSET = "0" *) 
   (* C_IMPLEMENTATION = "0" *) 
   (* C_SCLR_OVERRIDES_SSET = "1" *) 
   (* C_SINIT_VAL = "0" *) 
   (* C_XDEVICEFAMILY = "artix7" *) 
   (* c_add_mode = "0" *) 
   (* c_b_type = "0" *) 
   (* c_b_width = "4" *) 
   (* c_bypass_low = "0" *) 
   (* c_has_bypass = "0" *) 
   (* c_has_c_in = "0" *) 
   (* c_latency = "1" *) 
   (* c_out_width = "8" *) 
   (* c_scale = "0" *) 
   (* c_verbosity = "0" *) 
   (* downgradeipidentifiedwarnings = "yes" *) 
   c_accum_0_c_accum_v12_0_viv__parameterized0 i_synth
       (.ADD(ADD),
        .B(B),
        .BYPASS(BYPASS),
        .CE(CE),
        .CLK(CLK),
        .C_IN(C_IN),
        .Q(Q),
        .SCLR(SCLR),
        .SINIT(SINIT),
        .SSET(SSET));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2014"
`pragma protect key_keyowner = "Cadence Design Systems.", key_keyname= "cds_rsa_key", key_method = "rsa"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 64)
`pragma protect key_block
EqeSQPTUNoqpnK4nVrjuhvpLxxZNDJh+LNRK2Fq61au3XOscZMNjSdFnJGIReM9px3jwUK8mWPLM
l2UaT6RoRA==


`pragma protect key_keyowner = "Mentor Graphics Corporation", key_keyname= "MGC-VERIF-SIM-RSA-1", key_method = "rsa"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 128)
`pragma protect key_block
R/e+Ejlqih+TSvlnIKg+dwq51h4kWd54YlCFFQy9zsheFzRESBkYAJVBQ7ILZxlIabXB9j1aVu6K
8Z9+zFqLmyMQsSIYA+K5QWIYU2Bb4Y+4ItYi3jvYDfr5JSmpj9QxtO4XgJ2RtY9KcYuWgf5gOHOo
CGJBYbRGF6KlMQNiZY0=


`pragma protect key_keyowner = "Xilinx", key_keyname= "xilinx_2014_03", key_method = "rsa"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 256)
`pragma protect key_block
FGR8zuciZ/8sVVU6xCRWgmdIMjc8uYI3UHET2BNcz8IsAUWDmcL0tHzNeDqJZtYR/mBKgtwk0FS0
brG7VZIqCDc60xU944GI813RKjn7gNR95WmCXI3nLE6zFyuG7nEwz+kAG0QnJAUKcptSnEuOtyAp
G00TZRjEgSp1ngjItSeOkXIl9iSRoxIf+ulU26wM4Qi1rpPrWbvRFwbKQXF2hKnapTa5m+QuyFQl
8oXI091D6DZJd3LchJrs+hfSyVU4LRCEhxLK35ziohIVbp02lMS2TU4VaCvVQ5W+PV//KDSpOXb5
rBSZZfGWP10mmogiFuBlCAiom0an10D3fyeyPg==


`pragma protect key_keyowner = "Synopsys", key_keyname= "SNPS-VCS-RSA-1", key_method = "rsa"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 128)
`pragma protect key_block
ZlqiLdBEo9HlWl8m539vAKUx5Fn/ByKjL7kE2TM/hrLGdwE3ZteynKlE3PVhPzI/rAjvwS7dUWJx
A1N5W7f+UYJsQ1elVQIeuHDqtbs7RZnlbev9ajKV9Zt3Z/WSjOprvHNPsZgKUtaI8RvScZB/fcq1
oXqq1F7MyeI4y80ngnI=


`pragma protect key_keyowner = "Aldec", key_keyname= "ALDEC08_001", key_method = "rsa"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 256)
`pragma protect key_block
W9ppzRUYPhAWiZbvV6lVSv7DCAhtgisXW0N4BwCumnHvuoB5HOtawlTREf8gdVeyetpMVVyautFU
zrKAQZN0HUwBMy4hmHFt9BxCWeiaePF4YxGslc2uxKsVjTCjrSPjd1ftP+z2FG37n3xJqaJCrDQC
5Fyz1CwqyuLnsCcUfiXGobQLQEAwWPpJ5OMiWCh0pRv5U7ZildaDd/W1yQAfdQ4qgDUPes7HV/yr
bOse6nbEPbWW/7zlGjNWrNnVDHAgljR3ggdQlQMXqjkaYS66ItrqNf5UZjFaEdWHlmxH3j3f9J2Z
6DYkLL8cKeUmFtTLEhGydAnLHmEpCwTNXRGFnA==


`pragma protect key_keyowner = "Mentor Graphics Corporation", key_keyname= "MGC-PREC-RSA", key_method = "rsa"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 256)
`pragma protect key_block
aS5142h0y86m7IlyFB/bl3qRzYUM55qaBe3Kpts920aoRAzU20KV9J993l9qL401jIZ5qQiFKv1d
LDwjE/LWdmbzZ+mPGyBRr3D5c8VttsjcD8UsWllecI6+gCf/byfCUxls9ixffEEwyKZsiH1jxMzj
ITW3KsB7Q8T0rXUwWThudXpB1irVcU91lt0eJtdTqBI28bhUMOgnWBpYYhczZeLuhPf9fz5OAHYu
Uz3/rbHNP10p4uVErJp1TmGDi+/mws4OtQSIPPtcbXUKzMN6MLaU05bxQSUqDZae7RW0MqM6+Bf3
O247p6D5o4b/6ZScYgkYCOtdXHR9vQaux1iXXA==


`pragma protect key_keyowner = "Synplicity", key_keyname= "SYNP05_001", key_method = "rsa"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 256)
`pragma protect key_block
ngfEHZth4Baf/dDx6KKyq/wqpb02nXZ9hjG/d5KfCFvh3WyAAtZY+sN9aCsKL8Zs/8eteNqhkSwt
X7tm6bEEG/siNNqr1O6XKRSBwmEK7ryfq/itWkEZxlJEeCmcXGlLr8+b4AlmkmzbqSg5NDxSVFX9
ssOXFakrL8yrsw2eMOPQy/08abSWM8PGRu/PXlWkuGXVsRZHJVG2LOhz6WveA2Tr1gHB528piuJ/
6VocHwEPXQFPNbT0rnVE2RWNkYPRPZzLS0PYbVe+hK8QfFcbPIq+gtBwHPzm2vH+EUnvCWgp7HJy
m+YJk8kK5go9JJU2vx7bPdm/2OYlz6p1Ubyv4g==


`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 6112)
`pragma protect data_block
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
6AQwkidsgqLY3HLksA==
`pragma protect end_protected
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2014"
`pragma protect key_keyowner = "Cadence Design Systems.", key_keyname= "cds_rsa_key", key_method = "rsa"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 64)
`pragma protect key_block
EqeSQPTUNoqpnK4nVrjuhvpLxxZNDJh+LNRK2Fq61au3XOscZMNjSdFnJGIReM9px3jwUK8mWPLM
l2UaT6RoRA==


`pragma protect key_keyowner = "Mentor Graphics Corporation", key_keyname= "MGC-VERIF-SIM-RSA-1", key_method = "rsa"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 128)
`pragma protect key_block
R/e+Ejlqih+TSvlnIKg+dwq51h4kWd54YlCFFQy9zsheFzRESBkYAJVBQ7ILZxlIabXB9j1aVu6K
8Z9+zFqLmyMQsSIYA+K5QWIYU2Bb4Y+4ItYi3jvYDfr5JSmpj9QxtO4XgJ2RtY9KcYuWgf5gOHOo
CGJBYbRGF6KlMQNiZY0=


`pragma protect key_keyowner = "Xilinx", key_keyname= "xilinx_2014_03", key_method = "rsa"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 256)
`pragma protect key_block
FGR8zuciZ/8sVVU6xCRWgmdIMjc8uYI3UHET2BNcz8IsAUWDmcL0tHzNeDqJZtYR/mBKgtwk0FS0
brG7VZIqCDc60xU944GI813RKjn7gNR95WmCXI3nLE6zFyuG7nEwz+kAG0QnJAUKcptSnEuOtyAp
G00TZRjEgSp1ngjItSeOkXIl9iSRoxIf+ulU26wM4Qi1rpPrWbvRFwbKQXF2hKnapTa5m+QuyFQl
8oXI091D6DZJd3LchJrs+hfSyVU4LRCEhxLK35ziohIVbp02lMS2TU4VaCvVQ5W+PV//KDSpOXb5
rBSZZfGWP10mmogiFuBlCAiom0an10D3fyeyPg==


`pragma protect key_keyowner = "Synopsys", key_keyname= "SNPS-VCS-RSA-1", key_method = "rsa"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 128)
`pragma protect key_block
ZlqiLdBEo9HlWl8m539vAKUx5Fn/ByKjL7kE2TM/hrLGdwE3ZteynKlE3PVhPzI/rAjvwS7dUWJx
A1N5W7f+UYJsQ1elVQIeuHDqtbs7RZnlbev9ajKV9Zt3Z/WSjOprvHNPsZgKUtaI8RvScZB/fcq1
oXqq1F7MyeI4y80ngnI=


`pragma protect key_keyowner = "Aldec", key_keyname= "ALDEC08_001", key_method = "rsa"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 256)
`pragma protect key_block
W9ppzRUYPhAWiZbvV6lVSv7DCAhtgisXW0N4BwCumnHvuoB5HOtawlTREf8gdVeyetpMVVyautFU
zrKAQZN0HUwBMy4hmHFt9BxCWeiaePF4YxGslc2uxKsVjTCjrSPjd1ftP+z2FG37n3xJqaJCrDQC
5Fyz1CwqyuLnsCcUfiXGobQLQEAwWPpJ5OMiWCh0pRv5U7ZildaDd/W1yQAfdQ4qgDUPes7HV/yr
bOse6nbEPbWW/7zlGjNWrNnVDHAgljR3ggdQlQMXqjkaYS66ItrqNf5UZjFaEdWHlmxH3j3f9J2Z
6DYkLL8cKeUmFtTLEhGydAnLHmEpCwTNXRGFnA==


`pragma protect key_keyowner = "Mentor Graphics Corporation", key_keyname= "MGC-PREC-RSA", key_method = "rsa"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 256)
`pragma protect key_block
aS5142h0y86m7IlyFB/bl3qRzYUM55qaBe3Kpts920aoRAzU20KV9J993l9qL401jIZ5qQiFKv1d
LDwjE/LWdmbzZ+mPGyBRr3D5c8VttsjcD8UsWllecI6+gCf/byfCUxls9ixffEEwyKZsiH1jxMzj
ITW3KsB7Q8T0rXUwWThudXpB1irVcU91lt0eJtdTqBI28bhUMOgnWBpYYhczZeLuhPf9fz5OAHYu
Uz3/rbHNP10p4uVErJp1TmGDi+/mws4OtQSIPPtcbXUKzMN6MLaU05bxQSUqDZae7RW0MqM6+Bf3
O247p6D5o4b/6ZScYgkYCOtdXHR9vQaux1iXXA==


`pragma protect key_keyowner = "Synplicity", key_keyname= "SYNP05_001", key_method = "rsa"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 256)
`pragma protect key_block
ngfEHZth4Baf/dDx6KKyq/wqpb02nXZ9hjG/d5KfCFvh3WyAAtZY+sN9aCsKL8Zs/8eteNqhkSwt
X7tm6bEEG/siNNqr1O6XKRSBwmEK7ryfq/itWkEZxlJEeCmcXGlLr8+b4AlmkmzbqSg5NDxSVFX9
ssOXFakrL8yrsw2eMOPQy/08abSWM8PGRu/PXlWkuGXVsRZHJVG2LOhz6WveA2Tr1gHB528piuJ/
6VocHwEPXQFPNbT0rnVE2RWNkYPRPZzLS0PYbVe+hK8QfFcbPIq+gtBwHPzm2vH+EUnvCWgp7HJy
m+YJk8kK5go9JJU2vx7bPdm/2OYlz6p1Ubyv4g==


`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 2032)
`pragma protect data_block
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
`pragma protect end_protected
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2014"
`pragma protect key_keyowner = "Cadence Design Systems.", key_keyname= "cds_rsa_key", key_method = "rsa"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 64)
`pragma protect key_block
EqeSQPTUNoqpnK4nVrjuhvpLxxZNDJh+LNRK2Fq61au3XOscZMNjSdFnJGIReM9px3jwUK8mWPLM
l2UaT6RoRA==


`pragma protect key_keyowner = "Mentor Graphics Corporation", key_keyname= "MGC-VERIF-SIM-RSA-1", key_method = "rsa"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 128)
`pragma protect key_block
R/e+Ejlqih+TSvlnIKg+dwq51h4kWd54YlCFFQy9zsheFzRESBkYAJVBQ7ILZxlIabXB9j1aVu6K
8Z9+zFqLmyMQsSIYA+K5QWIYU2Bb4Y+4ItYi3jvYDfr5JSmpj9QxtO4XgJ2RtY9KcYuWgf5gOHOo
CGJBYbRGF6KlMQNiZY0=


`pragma protect key_keyowner = "Xilinx", key_keyname= "xilinx_2014_03", key_method = "rsa"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 256)
`pragma protect key_block
FGR8zuciZ/8sVVU6xCRWgmdIMjc8uYI3UHET2BNcz8IsAUWDmcL0tHzNeDqJZtYR/mBKgtwk0FS0
brG7VZIqCDc60xU944GI813RKjn7gNR95WmCXI3nLE6zFyuG7nEwz+kAG0QnJAUKcptSnEuOtyAp
G00TZRjEgSp1ngjItSeOkXIl9iSRoxIf+ulU26wM4Qi1rpPrWbvRFwbKQXF2hKnapTa5m+QuyFQl
8oXI091D6DZJd3LchJrs+hfSyVU4LRCEhxLK35ziohIVbp02lMS2TU4VaCvVQ5W+PV//KDSpOXb5
rBSZZfGWP10mmogiFuBlCAiom0an10D3fyeyPg==


`pragma protect key_keyowner = "Synopsys", key_keyname= "SNPS-VCS-RSA-1", key_method = "rsa"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 128)
`pragma protect key_block
ZlqiLdBEo9HlWl8m539vAKUx5Fn/ByKjL7kE2TM/hrLGdwE3ZteynKlE3PVhPzI/rAjvwS7dUWJx
A1N5W7f+UYJsQ1elVQIeuHDqtbs7RZnlbev9ajKV9Zt3Z/WSjOprvHNPsZgKUtaI8RvScZB/fcq1
oXqq1F7MyeI4y80ngnI=


`pragma protect key_keyowner = "Aldec", key_keyname= "ALDEC08_001", key_method = "rsa"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 256)
`pragma protect key_block
W9ppzRUYPhAWiZbvV6lVSv7DCAhtgisXW0N4BwCumnHvuoB5HOtawlTREf8gdVeyetpMVVyautFU
zrKAQZN0HUwBMy4hmHFt9BxCWeiaePF4YxGslc2uxKsVjTCjrSPjd1ftP+z2FG37n3xJqaJCrDQC
5Fyz1CwqyuLnsCcUfiXGobQLQEAwWPpJ5OMiWCh0pRv5U7ZildaDd/W1yQAfdQ4qgDUPes7HV/yr
bOse6nbEPbWW/7zlGjNWrNnVDHAgljR3ggdQlQMXqjkaYS66ItrqNf5UZjFaEdWHlmxH3j3f9J2Z
6DYkLL8cKeUmFtTLEhGydAnLHmEpCwTNXRGFnA==


`pragma protect key_keyowner = "Mentor Graphics Corporation", key_keyname= "MGC-PREC-RSA", key_method = "rsa"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 256)
`pragma protect key_block
aS5142h0y86m7IlyFB/bl3qRzYUM55qaBe3Kpts920aoRAzU20KV9J993l9qL401jIZ5qQiFKv1d
LDwjE/LWdmbzZ+mPGyBRr3D5c8VttsjcD8UsWllecI6+gCf/byfCUxls9ixffEEwyKZsiH1jxMzj
ITW3KsB7Q8T0rXUwWThudXpB1irVcU91lt0eJtdTqBI28bhUMOgnWBpYYhczZeLuhPf9fz5OAHYu
Uz3/rbHNP10p4uVErJp1TmGDi+/mws4OtQSIPPtcbXUKzMN6MLaU05bxQSUqDZae7RW0MqM6+Bf3
O247p6D5o4b/6ZScYgkYCOtdXHR9vQaux1iXXA==


`pragma protect key_keyowner = "Synplicity", key_keyname= "SYNP05_001", key_method = "rsa"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 256)
`pragma protect key_block
ngfEHZth4Baf/dDx6KKyq/wqpb02nXZ9hjG/d5KfCFvh3WyAAtZY+sN9aCsKL8Zs/8eteNqhkSwt
X7tm6bEEG/siNNqr1O6XKRSBwmEK7ryfq/itWkEZxlJEeCmcXGlLr8+b4AlmkmzbqSg5NDxSVFX9
ssOXFakrL8yrsw2eMOPQy/08abSWM8PGRu/PXlWkuGXVsRZHJVG2LOhz6WveA2Tr1gHB528piuJ/
6VocHwEPXQFPNbT0rnVE2RWNkYPRPZzLS0PYbVe+hK8QfFcbPIq+gtBwHPzm2vH+EUnvCWgp7HJy
m+YJk8kK5go9JJU2vx7bPdm/2OYlz6p1Ubyv4g==


`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 1552)
`pragma protect data_block
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
nJ7Q8nr7uZY0GAP0Fg==
`pragma protect end_protected
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (weak1, weak0) GSR = GSR_int;
    assign (weak1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule
`endif
