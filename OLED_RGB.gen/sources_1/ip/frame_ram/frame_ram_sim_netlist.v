// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2024.1 (win64) Build 5076996 Wed May 22 18:37:14 MDT 2024
// Date        : Thu Jul 23 16:19:04 2026
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
bA==
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
