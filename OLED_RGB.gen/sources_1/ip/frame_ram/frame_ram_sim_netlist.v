// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2024.1 (win64) Build 5076996 Wed May 22 18:37:14 MDT 2024
// Date        : Sun Aug  2 17:45:42 2026
// Host        : mc6030-01 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim {w:/Desktop/FPGA
//               Projects/OLED_RGB/OLED_RGB/OLED_RGB.gen/sources_1/ip/frame_ram/frame_ram_sim_netlist.v}
// Design      : frame_ram
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "frame_ram,blk_mem_gen_v8_4_8,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_8,Vivado 2024.1" *) 
(* NotValidForBitStream *)
module frame_ram
   (clka,
    ena,
    wea,
    addra,
    dina,
    douta,
    clkb,
    enb,
    web,
    addrb,
    dinb,
    doutb);
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTA, MEM_ADDRESS_MODE BYTE_ADDRESS, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clka;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA EN" *) input ena;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA WE" *) input [0:0]wea;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [12:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DIN" *) input [0:0]dina;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DOUT" *) output [0:0]douta;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTB, MEM_ADDRESS_MODE BYTE_ADDRESS, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clkb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB EN" *) input enb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB WE" *) input [0:0]web;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB ADDR" *) input [12:0]addrb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB DIN" *) input [0:0]dinb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB DOUT" *) output [0:0]doutb;

  wire [12:0]addra;
  wire [12:0]addrb;
  wire clka;
  wire clkb;
  wire [0:0]dina;
  wire [0:0]dinb;
  wire [0:0]douta;
  wire [0:0]doutb;
  wire ena;
  wire enb;
  wire [0:0]wea;
  wire [0:0]web;
  wire NLW_U0_dbiterr_UNCONNECTED;
  wire NLW_U0_rsta_busy_UNCONNECTED;
  wire NLW_U0_rstb_busy_UNCONNECTED;
  wire NLW_U0_s_axi_arready_UNCONNECTED;
  wire NLW_U0_s_axi_awready_UNCONNECTED;
  wire NLW_U0_s_axi_bvalid_UNCONNECTED;
  wire NLW_U0_s_axi_dbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_rlast_UNCONNECTED;
  wire NLW_U0_s_axi_rvalid_UNCONNECTED;
  wire NLW_U0_s_axi_sbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_wready_UNCONNECTED;
  wire NLW_U0_sbiterr_UNCONNECTED;
  wire [12:0]NLW_U0_rdaddrecc_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [12:0]NLW_U0_s_axi_rdaddrecc_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;

  (* C_ADDRA_WIDTH = "13" *) 
  (* C_ADDRB_WIDTH = "13" *) 
  (* C_ALGORITHM = "1" *) 
  (* C_AXI_ID_WIDTH = "4" *) 
  (* C_AXI_SLAVE_TYPE = "0" *) 
  (* C_AXI_TYPE = "1" *) 
  (* C_BYTE_SIZE = "9" *) 
  (* C_COMMON_CLK = "0" *) 
  (* C_COUNT_18K_BRAM = "1" *) 
  (* C_COUNT_36K_BRAM = "0" *) 
  (* C_CTRL_ECC_ALGO = "NONE" *) 
  (* C_DEFAULT_DATA = "0" *) 
  (* C_DISABLE_WARN_BHV_COLL = "0" *) 
  (* C_DISABLE_WARN_BHV_RANGE = "0" *) 
  (* C_ELABORATION_DIR = "./" *) 
  (* C_ENABLE_32BIT_ADDRESS = "0" *) 
  (* C_EN_DEEPSLEEP_PIN = "0" *) 
  (* C_EN_ECC_PIPE = "0" *) 
  (* C_EN_RDADDRA_CHG = "0" *) 
  (* C_EN_RDADDRB_CHG = "0" *) 
  (* C_EN_SAFETY_CKT = "0" *) 
  (* C_EN_SHUTDOWN_PIN = "0" *) 
  (* C_EN_SLEEP_PIN = "0" *) 
  (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     2.388 mW" *) 
  (* C_FAMILY = "artix7" *) 
  (* C_HAS_AXI_ID = "0" *) 
  (* C_HAS_ENA = "1" *) 
  (* C_HAS_ENB = "1" *) 
  (* C_HAS_INJECTERR = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_A = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_B = "0" *) 
  (* C_HAS_MUX_OUTPUT_REGS_A = "0" *) 
  (* C_HAS_MUX_OUTPUT_REGS_B = "0" *) 
  (* C_HAS_REGCEA = "0" *) 
  (* C_HAS_REGCEB = "0" *) 
  (* C_HAS_RSTA = "0" *) 
  (* C_HAS_RSTB = "0" *) 
  (* C_HAS_SOFTECC_INPUT_REGS_A = "0" *) 
  (* C_HAS_SOFTECC_OUTPUT_REGS_B = "0" *) 
  (* C_INITA_VAL = "0" *) 
  (* C_INITB_VAL = "0" *) 
  (* C_INIT_FILE = "frame_ram.mem" *) 
  (* C_INIT_FILE_NAME = "frame_ram.mif" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_LOAD_INIT_FILE = "1" *) 
  (* C_MEM_TYPE = "2" *) 
  (* C_MUX_PIPELINE_STAGES = "0" *) 
  (* C_PRIM_TYPE = "1" *) 
  (* C_READ_DEPTH_A = "6144" *) 
  (* C_READ_DEPTH_B = "6144" *) 
  (* C_READ_LATENCY_A = "1" *) 
  (* C_READ_LATENCY_B = "1" *) 
  (* C_READ_WIDTH_A = "1" *) 
  (* C_READ_WIDTH_B = "1" *) 
  (* C_RSTRAM_A = "0" *) 
  (* C_RSTRAM_B = "0" *) 
  (* C_RST_PRIORITY_A = "CE" *) 
  (* C_RST_PRIORITY_B = "CE" *) 
  (* C_SIM_COLLISION_CHECK = "ALL" *) 
  (* C_USE_BRAM_BLOCK = "0" *) 
  (* C_USE_BYTE_WEA = "0" *) 
  (* C_USE_BYTE_WEB = "0" *) 
  (* C_USE_DEFAULT_DATA = "0" *) 
  (* C_USE_ECC = "0" *) 
  (* C_USE_SOFTECC = "0" *) 
  (* C_USE_URAM = "0" *) 
  (* C_WEA_WIDTH = "1" *) 
  (* C_WEB_WIDTH = "1" *) 
  (* C_WRITE_DEPTH_A = "6144" *) 
  (* C_WRITE_DEPTH_B = "6144" *) 
  (* C_WRITE_MODE_A = "WRITE_FIRST" *) 
  (* C_WRITE_MODE_B = "WRITE_FIRST" *) 
  (* C_WRITE_WIDTH_A = "1" *) 
  (* C_WRITE_WIDTH_B = "1" *) 
  (* C_XDEVICEFAMILY = "artix7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* is_du_within_envelope = "true" *) 
  frame_ram_blk_mem_gen_v8_4_8 U0
       (.addra(addra),
        .addrb(addrb),
        .clka(clka),
        .clkb(clkb),
        .dbiterr(NLW_U0_dbiterr_UNCONNECTED),
        .deepsleep(1'b0),
        .dina(dina),
        .dinb(dinb),
        .douta(douta),
        .doutb(doutb),
        .eccpipece(1'b0),
        .ena(ena),
        .enb(enb),
        .injectdbiterr(1'b0),
        .injectsbiterr(1'b0),
        .rdaddrecc(NLW_U0_rdaddrecc_UNCONNECTED[12:0]),
        .regcea(1'b1),
        .regceb(1'b1),
        .rsta(1'b0),
        .rsta_busy(NLW_U0_rsta_busy_UNCONNECTED),
        .rstb(1'b0),
        .rstb_busy(NLW_U0_rstb_busy_UNCONNECTED),
        .s_aclk(1'b0),
        .s_aresetn(1'b0),
        .s_axi_araddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arburst({1'b0,1'b0}),
        .s_axi_arid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arready(NLW_U0_s_axi_arready_UNCONNECTED),
        .s_axi_arsize({1'b0,1'b0,1'b0}),
        .s_axi_arvalid(1'b0),
        .s_axi_awaddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awburst({1'b0,1'b0}),
        .s_axi_awid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awready(NLW_U0_s_axi_awready_UNCONNECTED),
        .s_axi_awsize({1'b0,1'b0,1'b0}),
        .s_axi_awvalid(1'b0),
        .s_axi_bid(NLW_U0_s_axi_bid_UNCONNECTED[3:0]),
        .s_axi_bready(1'b0),
        .s_axi_bresp(NLW_U0_s_axi_bresp_UNCONNECTED[1:0]),
        .s_axi_bvalid(NLW_U0_s_axi_bvalid_UNCONNECTED),
        .s_axi_dbiterr(NLW_U0_s_axi_dbiterr_UNCONNECTED),
        .s_axi_injectdbiterr(1'b0),
        .s_axi_injectsbiterr(1'b0),
        .s_axi_rdaddrecc(NLW_U0_s_axi_rdaddrecc_UNCONNECTED[12:0]),
        .s_axi_rdata(NLW_U0_s_axi_rdata_UNCONNECTED[0]),
        .s_axi_rid(NLW_U0_s_axi_rid_UNCONNECTED[3:0]),
        .s_axi_rlast(NLW_U0_s_axi_rlast_UNCONNECTED),
        .s_axi_rready(1'b0),
        .s_axi_rresp(NLW_U0_s_axi_rresp_UNCONNECTED[1:0]),
        .s_axi_rvalid(NLW_U0_s_axi_rvalid_UNCONNECTED),
        .s_axi_sbiterr(NLW_U0_s_axi_sbiterr_UNCONNECTED),
        .s_axi_wdata(1'b0),
        .s_axi_wlast(1'b0),
        .s_axi_wready(NLW_U0_s_axi_wready_UNCONNECTED),
        .s_axi_wstrb(1'b0),
        .s_axi_wvalid(1'b0),
        .sbiterr(NLW_U0_sbiterr_UNCONNECTED),
        .shutdown(1'b0),
        .sleep(1'b0),
        .wea(wea),
        .web(web));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2024.1"
`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
RSqbsRZSIb+QlYJMfFv1T7uHQ7PiCEXQkl687MHGm2LgPB15GIYcPmqKUSXgtkLsIFes91PTAyyB
9H9cyY4ZUxedcRg/9ZOB5pm3zPqAbcvGPmg1ivMhr/MlS19t5lYKM2tQo+0Yd+arJXlVZu2BMnvn
+I3G9t9tJuWUIWKjI+I=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
VRSQ05ZaB6bIhFIQ823mTvlJaG9+5iW5C3+KxGjq0sq9ziCshKOLpOGPDMmOWDqA4uBaxC5IKISr
w8+A8mqbYjXo5m1g8sGjNaETS0HKJsK+l5Y++tN4IEUs+DwxgrPR/+LWtChuOzVkfC7BG3LVUEMj
zM3GAyGcXGJ3sdBItZAfsevyiy7kr4Fw+nk2hWytGteu1NZk3VzPE7KQHLkOlHBPXf6P0j8LpKcr
2oNDgQ/WaEmg6OOvFeJuaWDaee8Sn6wKP/caMyoGdSeczsPtRrJeoSRlbNHlxhCv7zg+Cn2AgwrR
PTqGsMrkhv9U0sq+waS0CmwChsk4WB7RspGYUg==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
tNziOjCznlvIl4dadmB9r23Duf+HQHWOuHmupEU3PJxrazHVtZdNKspG9sRXhF9mjbpnSiKYCdFK
Jr9W/dxUid36faFIPKQazVTuOiE0hkzVQAGpYxXjT/ITB/9EFBvgvP5L3EAhHv32x6MA1vkFSI7x
HrZ09YNFEF6T7DPTZE4=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
QCYfxgkUHlX1cre1q9aS3sVDIOX36YBK4ZwJXAVUwA6f1OQ77XibjpWJHt5FK9F0PcYp/j21pqzO
BRdkDcFLVAjxER4J5t5iMVhoeMk+3fpiKfYrm4WFl1ygsJsfFJP0jqO1OkjC8iFBtm3n6b7CTl1o
cjBbcBp8UgW6E8rf5inXA0dRqybnyxKJSnMFYLinvpVU6QEc4OKO7mi/i/s9p/efiP+CdQf0yDRU
Fw7o7x0D7tjBv943g5L+4wGZ2JYU+ISqn4Ajxy/bWTTJDe6T/15evhngS61MC8Xjamzc4YLZBP8o
ShfSLoeZeO+Hk5n3xzJRghM0DQ6Sj7NqXFY68w==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Uy8FDDy3dZQGAnMQV0HBesEs+/oZdaq35Kj1PGhy9J/+EBZm0nhhQgYtku8tWABW2jKAC1GtNTvo
uReQyr1hteMxTbD5OIuqv86eb1hXZVENlZ7ichG8auUjkeHAkaSYNbHOuDLIhSqHEL67XbcZ9zPG
1JOY3+VONSww0KYPcQbGSo/2DaC5C0Y+mZODRfJ4+b0WXjce6UaJetilBc3VtqqmodIM2d3HDawF
R0xVJfHj86rXmUkY+SNUw60zsV6raCY6G3k/rXpei1d6zn8tCThkKG5fwiWY8zA7kRdTFIlVKP9h
fb6kfzRBRT/BgVQ8d4RgEcEVV8m3u/Mf4KIlTw==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2023_11", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Pk1GeRlkUK9lt6DVXYVdtOABlzDEWQDcBsP/p+Wo5HaglDLG5b8gk08xTP3IcJ1RKcfuARPMGO2s
/VqFbnVADV90T1rhjIuWMcBnzYQK/ALUvwv11Uju9Gn0fvPIz52l3QBnpjHI1nlsFB7WeqkzVfHZ
tg9gO9bPHjHLjVd9BzH6McrEWY5RkZ0UBy0Fmh/SownJX1b0YGE7LdwKydEMEpyvb28bwTOwfEv/
4RtsfYtEvTjo6e1ZBm66D9IQmKUu32wzTfn5bFZHdyjZg6+HcTzvHMtQX2+AggXfP6FsO2/83qkb
0bfj226fnLhr32dJxtsaJS5OR63GYtzDJ05ITA==

`pragma protect key_keyowner="Metrics Technologies Inc.", key_keyname="DSim", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
LCfWqKmUoUSVOTKNAl5p8n1hfz7SMU2kDOUMBjsDncgSFqiu2zUy1I6GSDrVnF/2umJG5/mWcpvi
rQaFJOlrJ8DNctSuavdlopRAwTMsVi6dAlNGrAawSiDIxtI3tN3MDVdMiH5H+pJMqMt59yXneyCf
2RRSRz2sUQK/aj0lXlqKjVJzVbk8HaBQ8akBJF4iWSMK4foIzJ6iO1EupYovuW6uEiO7jQRWezlW
pbbDenOHHWbfinuX5cbkjpTKHGsEKct65q+ZXJp60m3sconSK3Y2eLQxusuJ1FHDJ4GGKO8mEzCv
3cfGdXX3pVL81OfGO/JD1aMs9H98CO5ssbHqlw==

`pragma protect key_keyowner="Atrenta", key_keyname="ATR-SG-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=384)
`pragma protect key_block
A4S1e3DHcTeWzaDVuWDRb3Yf1BjiEsR1RtAeL0BJ7J/oPWMNj96MeGsUiHtZoiYqteTZxqax2cyZ
PV0cMLoBK4Ya8CyM+BTnkFA2ablsGt5Es4TgG/nFS9VEhmeKxu8boAsqW5697aiqOATJf/LucQh5
GOnPXHAuPrDj0A/fu8N2QduqGyysWUSc1KsoJ0/0noJYvLJ2yOhFi4uIUYQfG5LOuOrca5P43pqA
iwUKW/RrFXal2acJdFeXIKffZpKanSV97urdzKyBvf9EPV/M8g9uPFJJ1z6aS+FbknhVPs0pt6eD
+J/qib4gVp/HGnRo4YlxauUMv6Yv9wxiaObY6ttDfYf5p3uzWZMlf3i7YOzZwcd4aS/6+vkD28LG
L9piBIpLx2dvQy74RdvCVdvaP1LC6RMju9RfuXJhuX4ZAmDxRi0zQyRda838ikzwYeOCSKLIvRPb
nuJ8Zx2ot8EFqSeGaaRFaEMU6Zf5SptCUuVMHvSkinBewcwrLB5uiJTJ

`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="CDS_RSA_KEY_VER_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
gj+uMxV+tK4Di7pgSOE82FOBeWmUB1A7OKFOSMUW3qrmQ4/YhryfHMlWPxfAq8avQL7tnBTnRFEg
czbErdIcNzYjrM7Qq00QC/mTqmeQX4/apbqGvN+rwK4RR5oj22wfTib/UQNEQX6fbpi6PtmAeUR9
eShsfq+YWcf7z2Zw4Q+o4+E6m4/3CzU68vglNpzNsJ8S9/8XpdIrvAA/WRAX6OEOC4wlNIKDZsq/
+zMbFgSzN1rP844I/CDmxYM0NIzBWWhYBkPfJyQyigmUoXb84lDip0/Dmnq4EHvu7D/tZNnDl5st
JpftRfEpT6S8e/5MBeKUuhbfg6etHo/oFZvPKQ==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
aWTy3xv6SqKsldtLS2gY4KrTS8U+KtFNRHS314f6EYZy1MHE9t7oICJ8eNB8up8A+odoE23N3fJb
1alhaadeRWU2GjlIiK1LjZ5PQw+jb1u1GWtRiY+TcTlD75XUlqwykVBrCDfm565DmgZjZle9T3/t
WEfLo+m/8GfBe8trVnoftsk/XI00BMFXRzw8doPGDhNECS1NUrLebryb9iO5Hf4A/40dtslTARsR
nicN0KoIIyiQ+QzliqyXU/8VjS45inON8R0Kv9Qx46EXUp7bds5uQ7QycRhpLG0IPnMIweudU67w
eQmpHJzvZKBCZks/R0OafZx44H6Jib2+QazBCw==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
UGdPiChIPj1lSozqzCQx17Bi+8FWSuMUMzXUkDLH5zcP1t8tZLzh4CU4WAR8lmJxn8gH763fLp5c
RYU6zA0yxHzl2ksc5YRU1XEfQQT9ha8fQnz+18wVKcsa5UIOfMbGDwnS9yfX59ntG8CB0uF8bJKE
y1CS6U/1Stfs1w2mF94iDxI2n2GJlb1UPtWpmxMBI88hY0GktTPXP2Y7JKl8zRl/Lq0wIF8pHwXk
B4nOgKm6hfzPj0xZ6E/TuER/JE3fy8RSm24IlL/CUgpReEslEOYjQ4EKKZRG9/fxg26utQWW9p+G
fWVU53qrFGzBhKQ96Paj1ROkv6hDHyUb6n7uSw==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 20464)
`pragma protect data_block
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
Hg==
`pragma protect end_protected
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
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
    reg GRESTORE_int;

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

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

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

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
