// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2024.1 (win64) Build 5076996 Wed May 22 18:37:14 MDT 2024
// Date        : Mon Aug  3 16:21:03 2026
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
FA==
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
