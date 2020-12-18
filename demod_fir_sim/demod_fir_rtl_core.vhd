-- ------------------------------------------------------------------------- 
-- High Level Design Compiler for Intel(R) FPGAs Version 18.1 (Release Build #625)
-- Quartus Prime development tool and MATLAB/Simulink Interface
-- 
-- Legal Notice: Copyright 2018 Intel Corporation.  All rights reserved.
-- Your use of  Intel Corporation's design tools,  logic functions and other
-- software and  tools, and its AMPP partner logic functions, and any output
-- files any  of the foregoing (including  device programming  or simulation
-- files), and  any associated  documentation  or information  are expressly
-- subject  to the terms and  conditions of the  Intel FPGA Software License
-- Agreement, Intel MegaCore Function License Agreement, or other applicable
-- license agreement,  including,  without limitation,  that your use is for
-- the  sole  purpose of  programming  logic devices  manufactured by  Intel
-- and  sold by Intel  or its authorized  distributors. Please refer  to the
-- applicable agreement for further details.
-- ---------------------------------------------------------------------------

-- VHDL created from demod_fir_rtl_core
-- VHDL created on Fri Dec 18 19:27:40 2020


library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;
use IEEE.MATH_REAL.all;
use std.TextIO.all;
use work.dspba_library_package.all;

LIBRARY altera_mf;
USE altera_mf.altera_mf_components.all;
LIBRARY lpm;
USE lpm.lpm_components.all;

entity demod_fir_rtl_core is
    port (
        xIn_v : in std_logic_vector(0 downto 0);  -- sfix1
        xIn_c : in std_logic_vector(7 downto 0);  -- sfix8
        xIn_0 : in std_logic_vector(7 downto 0);  -- sfix8
        xOut_v : out std_logic_vector(0 downto 0);  -- ufix1
        xOut_c : out std_logic_vector(7 downto 0);  -- ufix8
        xOut_0 : out std_logic_vector(19 downto 0);  -- sfix20
        clk : in std_logic;
        areset : in std_logic
    );
end demod_fir_rtl_core;

architecture normal of demod_fir_rtl_core is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    signal GND_q : STD_LOGIC_VECTOR (0 downto 0);
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal d_u0_m0_wo0_memread_q_11_q : STD_LOGIC_VECTOR (0 downto 0);
    signal d_u0_m0_wo0_memread_q_12_q : STD_LOGIC_VECTOR (0 downto 0);
    signal d_u0_m0_wo0_compute_q_11_q : STD_LOGIC_VECTOR (0 downto 0);
    signal d_u0_m0_wo0_compute_q_12_q : STD_LOGIC_VECTOR (0 downto 0);
    signal d_u0_m0_wo0_compute_q_15_q : STD_LOGIC_VECTOR (0 downto 0);
    signal d_u0_m0_wo0_wi0_r0_phasedelay0_q_14_q : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr1_q : STD_LOGIC_VECTOR (7 downto 0);
    signal d_u0_m0_wo0_wi0_r0_delayr1_q_11_q : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr2_q : STD_LOGIC_VECTOR (7 downto 0);
    signal d_u0_m0_wo0_wi0_r0_delayr2_q_11_q : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr3_q : STD_LOGIC_VECTOR (7 downto 0);
    signal d_u0_m0_wo0_wi0_r0_delayr3_q_11_q : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr4_q : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr5_q : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr6_q : STD_LOGIC_VECTOR (7 downto 0);
    signal d_u0_m0_wo0_wi0_r0_delayr6_q_11_q : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr7_q : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr8_q : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr9_q : STD_LOGIC_VECTOR (7 downto 0);
    signal d_u0_m0_wo0_wi0_r0_delayr9_q_11_q : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr10_q : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr11_q : STD_LOGIC_VECTOR (7 downto 0);
    signal d_u0_m0_wo0_wi0_r0_delayr11_q_12_q : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr12_q : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_mtree_add0_0_a : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo0_mtree_add0_0_b : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo0_mtree_add0_0_o : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo0_mtree_add0_0_q : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo0_mtree_add0_1_a : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_mtree_add0_1_b : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_mtree_add0_1_o : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_mtree_add0_1_q : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_mtree_add0_2_a : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo0_mtree_add0_2_b : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo0_mtree_add0_2_o : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo0_mtree_add0_2_q : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo0_mtree_add0_3_a : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo0_mtree_add0_3_b : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo0_mtree_add0_3_o : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo0_mtree_add0_3_q : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo0_mtree_add0_4_a : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo0_mtree_add0_4_b : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo0_mtree_add0_4_o : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo0_mtree_add0_4_q : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo0_mtree_add0_5_a : STD_LOGIC_VECTOR (14 downto 0);
    signal u0_m0_wo0_mtree_add0_5_b : STD_LOGIC_VECTOR (14 downto 0);
    signal u0_m0_wo0_mtree_add0_5_o : STD_LOGIC_VECTOR (14 downto 0);
    signal u0_m0_wo0_mtree_add0_5_q : STD_LOGIC_VECTOR (14 downto 0);
    signal u0_m0_wo0_mtree_add1_0_a : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo0_mtree_add1_0_b : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo0_mtree_add1_0_o : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo0_mtree_add1_0_q : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo0_mtree_add1_1_a : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m0_wo0_mtree_add1_1_b : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m0_wo0_mtree_add1_1_o : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m0_wo0_mtree_add1_1_q : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m0_wo0_mtree_add1_2_a : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m0_wo0_mtree_add1_2_b : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m0_wo0_mtree_add1_2_o : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m0_wo0_mtree_add1_2_q : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m0_wo0_mtree_add2_0_a : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo0_mtree_add2_0_b : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo0_mtree_add2_0_o : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo0_mtree_add2_0_q : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo0_mtree_add2_1_a : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo0_mtree_add2_1_b : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo0_mtree_add2_1_o : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo0_mtree_add2_1_q : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo0_mtree_add3_0_a : STD_LOGIC_VECTOR (19 downto 0);
    signal u0_m0_wo0_mtree_add3_0_b : STD_LOGIC_VECTOR (19 downto 0);
    signal u0_m0_wo0_mtree_add3_0_o : STD_LOGIC_VECTOR (19 downto 0);
    signal u0_m0_wo0_mtree_add3_0_q : STD_LOGIC_VECTOR (19 downto 0);
    signal u0_m0_wo0_oseq_gated_reg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_mtree_mult1_11_add_1_a : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo0_mtree_mult1_11_add_1_b : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo0_mtree_mult1_11_add_1_o : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo0_mtree_mult1_11_add_1_q : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo0_mtree_mult1_10_sub_1_a : STD_LOGIC_VECTOR (13 downto 0);
    signal u0_m0_wo0_mtree_mult1_10_sub_1_b : STD_LOGIC_VECTOR (13 downto 0);
    signal u0_m0_wo0_mtree_mult1_10_sub_1_o : STD_LOGIC_VECTOR (13 downto 0);
    signal u0_m0_wo0_mtree_mult1_10_sub_1_q : STD_LOGIC_VECTOR (13 downto 0);
    signal u0_m0_wo0_mtree_mult1_9_add_1_a : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_mtree_mult1_9_add_1_b : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_mtree_mult1_9_add_1_o : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_mtree_mult1_9_add_1_q : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_mtree_mult1_9_sub_3_a : STD_LOGIC_VECTOR (14 downto 0);
    signal u0_m0_wo0_mtree_mult1_9_sub_3_b : STD_LOGIC_VECTOR (14 downto 0);
    signal u0_m0_wo0_mtree_mult1_9_sub_3_o : STD_LOGIC_VECTOR (14 downto 0);
    signal u0_m0_wo0_mtree_mult1_9_sub_3_q : STD_LOGIC_VECTOR (14 downto 0);
    signal u0_m0_wo0_mtree_mult1_8_add_1_a : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_mtree_mult1_8_add_1_b : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_mtree_mult1_8_add_1_o : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_mtree_mult1_8_add_1_q : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_mtree_mult1_8_sub_3_a : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_mtree_mult1_8_sub_3_b : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_mtree_mult1_8_sub_3_o : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_mtree_mult1_8_sub_3_q : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_mtree_mult1_8_sub_5_a : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo0_mtree_mult1_8_sub_5_b : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo0_mtree_mult1_8_sub_5_o : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo0_mtree_mult1_8_sub_5_q : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo0_mtree_mult1_7_add_1_a : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_mtree_mult1_7_add_1_b : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_mtree_mult1_7_add_1_o : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_mtree_mult1_7_add_1_q : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_mtree_mult1_7_sub_3_a : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_mtree_mult1_7_sub_3_b : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_mtree_mult1_7_sub_3_o : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_mtree_mult1_7_sub_3_q : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_mtree_mult1_7_add_5_a : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo0_mtree_mult1_7_add_5_b : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo0_mtree_mult1_7_add_5_o : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo0_mtree_mult1_7_add_5_q : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo0_mtree_mult1_6_sub_1_a : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_mtree_mult1_6_sub_1_b : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_mtree_mult1_6_sub_1_o : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_mtree_mult1_6_sub_1_q : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_mtree_mult1_5_add_1_a : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_mtree_mult1_5_add_1_b : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_mtree_mult1_5_add_1_o : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_mtree_mult1_5_add_1_q : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_mtree_mult1_5_sub_3_a : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_mtree_mult1_5_sub_3_b : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_mtree_mult1_5_sub_3_o : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_mtree_mult1_5_sub_3_q : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_mtree_mult1_5_add_5_a : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo0_mtree_mult1_5_add_5_b : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo0_mtree_mult1_5_add_5_o : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo0_mtree_mult1_5_add_5_q : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo0_mtree_mult1_4_add_1_a : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_mtree_mult1_4_add_1_b : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_mtree_mult1_4_add_1_o : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_mtree_mult1_4_add_1_q : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_mtree_mult1_4_sub_3_a : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_mtree_mult1_4_sub_3_b : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_mtree_mult1_4_sub_3_o : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_mtree_mult1_4_sub_3_q : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_mtree_mult1_4_sub_5_a : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo0_mtree_mult1_4_sub_5_b : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo0_mtree_mult1_4_sub_5_o : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo0_mtree_mult1_4_sub_5_q : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo0_mtree_mult1_3_add_1_a : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_mtree_mult1_3_add_1_b : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_mtree_mult1_3_add_1_o : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_mtree_mult1_3_add_1_q : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_mtree_mult1_3_sub_3_a : STD_LOGIC_VECTOR (14 downto 0);
    signal u0_m0_wo0_mtree_mult1_3_sub_3_b : STD_LOGIC_VECTOR (14 downto 0);
    signal u0_m0_wo0_mtree_mult1_3_sub_3_o : STD_LOGIC_VECTOR (14 downto 0);
    signal u0_m0_wo0_mtree_mult1_3_sub_3_q : STD_LOGIC_VECTOR (14 downto 0);
    signal u0_m0_wo0_mtree_mult1_2_sub_1_a : STD_LOGIC_VECTOR (13 downto 0);
    signal u0_m0_wo0_mtree_mult1_2_sub_1_b : STD_LOGIC_VECTOR (13 downto 0);
    signal u0_m0_wo0_mtree_mult1_2_sub_1_o : STD_LOGIC_VECTOR (13 downto 0);
    signal u0_m0_wo0_mtree_mult1_2_sub_1_q : STD_LOGIC_VECTOR (13 downto 0);
    signal u0_m0_wo0_mtree_mult1_1_add_1_a : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo0_mtree_mult1_1_add_1_b : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo0_mtree_mult1_1_add_1_o : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo0_mtree_mult1_1_add_1_q : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo0_mtree_mult1_12_shift0_q : STD_LOGIC_VECTOR (8 downto 0);
    signal u0_m0_wo0_mtree_mult1_12_shift0_qint : STD_LOGIC_VECTOR (8 downto 0);
    signal u0_m0_wo0_mtree_mult1_11_shift0_q : STD_LOGIC_VECTOR (8 downto 0);
    signal u0_m0_wo0_mtree_mult1_11_shift0_qint : STD_LOGIC_VECTOR (8 downto 0);
    signal u0_m0_wo0_mtree_mult1_10_shift0_q : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo0_mtree_mult1_10_shift0_qint : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo0_mtree_mult1_9_shift0_q : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo0_mtree_mult1_9_shift0_qint : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo0_mtree_mult1_9_shift2_q : STD_LOGIC_VECTOR (13 downto 0);
    signal u0_m0_wo0_mtree_mult1_9_shift2_qint : STD_LOGIC_VECTOR (13 downto 0);
    signal u0_m0_wo0_mtree_mult1_8_shift0_q : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo0_mtree_mult1_8_shift0_qint : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo0_mtree_mult1_8_shift2_q : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo0_mtree_mult1_8_shift2_qint : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo0_mtree_mult1_7_shift0_q : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo0_mtree_mult1_7_shift0_qint : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo0_mtree_mult1_7_shift2_q : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_mtree_mult1_7_shift2_qint : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_mtree_mult1_6_shift0_q : STD_LOGIC_VECTOR (14 downto 0);
    signal u0_m0_wo0_mtree_mult1_6_shift0_qint : STD_LOGIC_VECTOR (14 downto 0);
    signal u0_m0_wo0_mtree_mult1_5_shift0_q : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo0_mtree_mult1_5_shift0_qint : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo0_mtree_mult1_5_shift2_q : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_mtree_mult1_5_shift2_qint : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_mtree_mult1_4_shift0_q : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo0_mtree_mult1_4_shift0_qint : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo0_mtree_mult1_4_shift2_q : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo0_mtree_mult1_4_shift2_qint : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo0_mtree_mult1_3_shift0_q : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo0_mtree_mult1_3_shift0_qint : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo0_mtree_mult1_3_shift2_q : STD_LOGIC_VECTOR (13 downto 0);
    signal u0_m0_wo0_mtree_mult1_3_shift2_qint : STD_LOGIC_VECTOR (13 downto 0);
    signal u0_m0_wo0_mtree_mult1_2_shift0_q : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo0_mtree_mult1_2_shift0_qint : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo0_mtree_mult1_1_shift0_q : STD_LOGIC_VECTOR (8 downto 0);
    signal u0_m0_wo0_mtree_mult1_1_shift0_qint : STD_LOGIC_VECTOR (8 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_shift0_q : STD_LOGIC_VECTOR (8 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_shift0_qint : STD_LOGIC_VECTOR (8 downto 0);
    signal u0_m0_wo0_mtree_mult1_11_shift2_q : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_mtree_mult1_11_shift2_qint : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_mtree_mult1_8_shift4_q : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_mtree_mult1_8_shift4_qint : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_mtree_mult1_7_shift4_q : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_mtree_mult1_7_shift4_qint : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_mtree_mult1_5_shift4_q : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_mtree_mult1_5_shift4_qint : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_mtree_mult1_4_shift4_q : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_mtree_mult1_4_shift4_qint : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_mtree_mult1_1_shift2_q : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_mtree_mult1_1_shift2_qint : STD_LOGIC_VECTOR (11 downto 0);

begin


    -- VCC(CONSTANT,1)@0
    VCC_q <= "1";

    -- d_u0_m0_wo0_wi0_r0_phasedelay0_q_14(DELAY,130)@10 + 4
    d_u0_m0_wo0_wi0_r0_phasedelay0_q_14 : dspba_delay
    GENERIC MAP ( width => 8, depth => 4, reset_kind => "ASYNC" )
    PORT MAP ( xin => xIn_0, xout => d_u0_m0_wo0_wi0_r0_phasedelay0_q_14_q, clk => clk, aclr => areset );

    -- u0_m0_wo0_mtree_mult1_12_shift0(BITSHIFT,79)@14
    u0_m0_wo0_mtree_mult1_12_shift0_qint <= d_u0_m0_wo0_wi0_r0_phasedelay0_q_14_q & "0";
    u0_m0_wo0_mtree_mult1_12_shift0_q <= u0_m0_wo0_mtree_mult1_12_shift0_qint(8 downto 0);

    -- u0_m0_wo0_mtree_mult1_11_shift0(BITSHIFT,80)@11
    u0_m0_wo0_mtree_mult1_11_shift0_qint <= d_u0_m0_wo0_wi0_r0_delayr1_q_11_q & "0";
    u0_m0_wo0_mtree_mult1_11_shift0_q <= u0_m0_wo0_mtree_mult1_11_shift0_qint(8 downto 0);

    -- u0_m0_wo0_wi0_r0_delayr1(DELAY,20)@10
    u0_m0_wo0_wi0_r0_delayr1 : dspba_delay
    GENERIC MAP ( width => 8, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => xIn_0, xout => u0_m0_wo0_wi0_r0_delayr1_q, ena => xIn_v(0), clk => clk, aclr => areset );

    -- d_u0_m0_wo0_wi0_r0_delayr1_q_11(DELAY,131)@10 + 1
    d_u0_m0_wo0_wi0_r0_delayr1_q_11 : dspba_delay
    GENERIC MAP ( width => 8, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr1_q, xout => d_u0_m0_wo0_wi0_r0_delayr1_q_11_q, clk => clk, aclr => areset );

    -- u0_m0_wo0_mtree_mult1_11_add_1(ADD,81)@11 + 1
    u0_m0_wo0_mtree_mult1_11_add_1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((9 downto 8 => d_u0_m0_wo0_wi0_r0_delayr1_q_11_q(7)) & d_u0_m0_wo0_wi0_r0_delayr1_q_11_q));
    u0_m0_wo0_mtree_mult1_11_add_1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((9 downto 9 => u0_m0_wo0_mtree_mult1_11_shift0_q(8)) & u0_m0_wo0_mtree_mult1_11_shift0_q));
    u0_m0_wo0_mtree_mult1_11_add_1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_11_add_1_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_11_add_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_11_add_1_a) + SIGNED(u0_m0_wo0_mtree_mult1_11_add_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_11_add_1_q <= u0_m0_wo0_mtree_mult1_11_add_1_o(9 downto 0);

    -- u0_m0_wo0_mtree_mult1_11_shift2(BITSHIFT,82)@12
    u0_m0_wo0_mtree_mult1_11_shift2_qint <= u0_m0_wo0_mtree_mult1_11_add_1_q & "00";
    u0_m0_wo0_mtree_mult1_11_shift2_q <= u0_m0_wo0_mtree_mult1_11_shift2_qint(11 downto 0);

    -- u0_m0_wo0_wi0_r0_delayr2(DELAY,21)@10
    u0_m0_wo0_wi0_r0_delayr2 : dspba_delay
    GENERIC MAP ( width => 8, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr1_q, xout => u0_m0_wo0_wi0_r0_delayr2_q, ena => xIn_v(0), clk => clk, aclr => areset );

    -- d_u0_m0_wo0_wi0_r0_delayr2_q_11(DELAY,132)@10 + 1
    d_u0_m0_wo0_wi0_r0_delayr2_q_11 : dspba_delay
    GENERIC MAP ( width => 8, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr2_q, xout => d_u0_m0_wo0_wi0_r0_delayr2_q_11_q, clk => clk, aclr => areset );

    -- u0_m0_wo0_mtree_mult1_10_shift0(BITSHIFT,83)@11
    u0_m0_wo0_mtree_mult1_10_shift0_qint <= d_u0_m0_wo0_wi0_r0_delayr2_q_11_q & "00000";
    u0_m0_wo0_mtree_mult1_10_shift0_q <= u0_m0_wo0_mtree_mult1_10_shift0_qint(12 downto 0);

    -- u0_m0_wo0_mtree_mult1_10_sub_1(SUB,84)@11 + 1
    u0_m0_wo0_mtree_mult1_10_sub_1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((13 downto 13 => u0_m0_wo0_mtree_mult1_10_shift0_q(12)) & u0_m0_wo0_mtree_mult1_10_shift0_q));
    u0_m0_wo0_mtree_mult1_10_sub_1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((13 downto 8 => d_u0_m0_wo0_wi0_r0_delayr2_q_11_q(7)) & d_u0_m0_wo0_wi0_r0_delayr2_q_11_q));
    u0_m0_wo0_mtree_mult1_10_sub_1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_10_sub_1_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_10_sub_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_10_sub_1_a) - SIGNED(u0_m0_wo0_mtree_mult1_10_sub_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_10_sub_1_q <= u0_m0_wo0_mtree_mult1_10_sub_1_o(13 downto 0);

    -- u0_m0_wo0_mtree_add0_5(ADD,66)@12 + 1
    u0_m0_wo0_mtree_add0_5_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 14 => u0_m0_wo0_mtree_mult1_10_sub_1_q(13)) & u0_m0_wo0_mtree_mult1_10_sub_1_q));
    u0_m0_wo0_mtree_add0_5_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 12 => u0_m0_wo0_mtree_mult1_11_shift2_q(11)) & u0_m0_wo0_mtree_mult1_11_shift2_q));
    u0_m0_wo0_mtree_add0_5_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add0_5_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add0_5_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add0_5_a) + SIGNED(u0_m0_wo0_mtree_add0_5_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add0_5_q <= u0_m0_wo0_mtree_add0_5_o(14 downto 0);

    -- u0_m0_wo0_mtree_mult1_9_shift0(BITSHIFT,85)@10
    u0_m0_wo0_mtree_mult1_9_shift0_qint <= u0_m0_wo0_wi0_r0_delayr3_q & "00";
    u0_m0_wo0_mtree_mult1_9_shift0_q <= u0_m0_wo0_mtree_mult1_9_shift0_qint(9 downto 0);

    -- u0_m0_wo0_wi0_r0_delayr3(DELAY,22)@10
    u0_m0_wo0_wi0_r0_delayr3 : dspba_delay
    GENERIC MAP ( width => 8, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr2_q, xout => u0_m0_wo0_wi0_r0_delayr3_q, ena => xIn_v(0), clk => clk, aclr => areset );

    -- u0_m0_wo0_mtree_mult1_9_add_1(ADD,86)@10 + 1
    u0_m0_wo0_mtree_mult1_9_add_1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((10 downto 8 => u0_m0_wo0_wi0_r0_delayr3_q(7)) & u0_m0_wo0_wi0_r0_delayr3_q));
    u0_m0_wo0_mtree_mult1_9_add_1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((10 downto 10 => u0_m0_wo0_mtree_mult1_9_shift0_q(9)) & u0_m0_wo0_mtree_mult1_9_shift0_q));
    u0_m0_wo0_mtree_mult1_9_add_1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_9_add_1_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_9_add_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_9_add_1_a) + SIGNED(u0_m0_wo0_mtree_mult1_9_add_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_9_add_1_q <= u0_m0_wo0_mtree_mult1_9_add_1_o(10 downto 0);

    -- d_u0_m0_wo0_wi0_r0_delayr3_q_11(DELAY,133)@10 + 1
    d_u0_m0_wo0_wi0_r0_delayr3_q_11 : dspba_delay
    GENERIC MAP ( width => 8, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr3_q, xout => d_u0_m0_wo0_wi0_r0_delayr3_q_11_q, clk => clk, aclr => areset );

    -- u0_m0_wo0_mtree_mult1_9_shift2(BITSHIFT,87)@11
    u0_m0_wo0_mtree_mult1_9_shift2_qint <= d_u0_m0_wo0_wi0_r0_delayr3_q_11_q & "000000";
    u0_m0_wo0_mtree_mult1_9_shift2_q <= u0_m0_wo0_mtree_mult1_9_shift2_qint(13 downto 0);

    -- u0_m0_wo0_mtree_mult1_9_sub_3(SUB,88)@11 + 1
    u0_m0_wo0_mtree_mult1_9_sub_3_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 14 => u0_m0_wo0_mtree_mult1_9_shift2_q(13)) & u0_m0_wo0_mtree_mult1_9_shift2_q));
    u0_m0_wo0_mtree_mult1_9_sub_3_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 11 => u0_m0_wo0_mtree_mult1_9_add_1_q(10)) & u0_m0_wo0_mtree_mult1_9_add_1_q));
    u0_m0_wo0_mtree_mult1_9_sub_3_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_9_sub_3_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_9_sub_3_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_9_sub_3_a) - SIGNED(u0_m0_wo0_mtree_mult1_9_sub_3_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_9_sub_3_q <= u0_m0_wo0_mtree_mult1_9_sub_3_o(14 downto 0);

    -- u0_m0_wo0_mtree_mult1_8_shift0(BITSHIFT,89)@10
    u0_m0_wo0_mtree_mult1_8_shift0_qint <= u0_m0_wo0_wi0_r0_delayr4_q & "00";
    u0_m0_wo0_mtree_mult1_8_shift0_q <= u0_m0_wo0_mtree_mult1_8_shift0_qint(9 downto 0);

    -- u0_m0_wo0_wi0_r0_delayr4(DELAY,23)@10
    u0_m0_wo0_wi0_r0_delayr4 : dspba_delay
    GENERIC MAP ( width => 8, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr3_q, xout => u0_m0_wo0_wi0_r0_delayr4_q, ena => xIn_v(0), clk => clk, aclr => areset );

    -- u0_m0_wo0_mtree_mult1_8_add_1(ADD,90)@10 + 1
    u0_m0_wo0_mtree_mult1_8_add_1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((10 downto 8 => u0_m0_wo0_wi0_r0_delayr4_q(7)) & u0_m0_wo0_wi0_r0_delayr4_q));
    u0_m0_wo0_mtree_mult1_8_add_1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((10 downto 10 => u0_m0_wo0_mtree_mult1_8_shift0_q(9)) & u0_m0_wo0_mtree_mult1_8_shift0_q));
    u0_m0_wo0_mtree_mult1_8_add_1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_8_add_1_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_8_add_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_8_add_1_a) + SIGNED(u0_m0_wo0_mtree_mult1_8_add_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_8_add_1_q <= u0_m0_wo0_mtree_mult1_8_add_1_o(10 downto 0);

    -- u0_m0_wo0_mtree_mult1_8_shift2(BITSHIFT,91)@10
    u0_m0_wo0_mtree_mult1_8_shift2_qint <= u0_m0_wo0_wi0_r0_delayr4_q & "00";
    u0_m0_wo0_mtree_mult1_8_shift2_q <= u0_m0_wo0_mtree_mult1_8_shift2_qint(9 downto 0);

    -- u0_m0_wo0_mtree_mult1_8_sub_3(SUB,92)@10 + 1
    u0_m0_wo0_mtree_mult1_8_sub_3_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((10 downto 10 => u0_m0_wo0_mtree_mult1_8_shift2_q(9)) & u0_m0_wo0_mtree_mult1_8_shift2_q));
    u0_m0_wo0_mtree_mult1_8_sub_3_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((10 downto 8 => u0_m0_wo0_wi0_r0_delayr4_q(7)) & u0_m0_wo0_wi0_r0_delayr4_q));
    u0_m0_wo0_mtree_mult1_8_sub_3_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_8_sub_3_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_8_sub_3_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_8_sub_3_a) - SIGNED(u0_m0_wo0_mtree_mult1_8_sub_3_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_8_sub_3_q <= u0_m0_wo0_mtree_mult1_8_sub_3_o(10 downto 0);

    -- u0_m0_wo0_mtree_mult1_8_shift4(BITSHIFT,93)@11
    u0_m0_wo0_mtree_mult1_8_shift4_qint <= u0_m0_wo0_mtree_mult1_8_sub_3_q & "00000";
    u0_m0_wo0_mtree_mult1_8_shift4_q <= u0_m0_wo0_mtree_mult1_8_shift4_qint(15 downto 0);

    -- u0_m0_wo0_mtree_mult1_8_sub_5(SUB,94)@11 + 1
    u0_m0_wo0_mtree_mult1_8_sub_5_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((16 downto 16 => u0_m0_wo0_mtree_mult1_8_shift4_q(15)) & u0_m0_wo0_mtree_mult1_8_shift4_q));
    u0_m0_wo0_mtree_mult1_8_sub_5_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((16 downto 11 => u0_m0_wo0_mtree_mult1_8_add_1_q(10)) & u0_m0_wo0_mtree_mult1_8_add_1_q));
    u0_m0_wo0_mtree_mult1_8_sub_5_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_8_sub_5_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_8_sub_5_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_8_sub_5_a) - SIGNED(u0_m0_wo0_mtree_mult1_8_sub_5_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_8_sub_5_q <= u0_m0_wo0_mtree_mult1_8_sub_5_o(16 downto 0);

    -- u0_m0_wo0_mtree_add0_4(ADD,65)@12 + 1
    u0_m0_wo0_mtree_add0_4_a <= STD_LOGIC_VECTOR(u0_m0_wo0_mtree_mult1_8_sub_5_q);
    u0_m0_wo0_mtree_add0_4_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((16 downto 15 => u0_m0_wo0_mtree_mult1_9_sub_3_q(14)) & u0_m0_wo0_mtree_mult1_9_sub_3_q));
    u0_m0_wo0_mtree_add0_4_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add0_4_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add0_4_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add0_4_a) + SIGNED(u0_m0_wo0_mtree_add0_4_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add0_4_q <= u0_m0_wo0_mtree_add0_4_o(16 downto 0);

    -- u0_m0_wo0_mtree_add1_2(ADD,69)@13 + 1
    u0_m0_wo0_mtree_add1_2_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((17 downto 17 => u0_m0_wo0_mtree_add0_4_q(16)) & u0_m0_wo0_mtree_add0_4_q));
    u0_m0_wo0_mtree_add1_2_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((17 downto 15 => u0_m0_wo0_mtree_add0_5_q(14)) & u0_m0_wo0_mtree_add0_5_q));
    u0_m0_wo0_mtree_add1_2_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add1_2_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add1_2_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add1_2_a) + SIGNED(u0_m0_wo0_mtree_add1_2_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add1_2_q <= u0_m0_wo0_mtree_add1_2_o(17 downto 0);

    -- u0_m0_wo0_mtree_add2_1(ADD,71)@14 + 1
    u0_m0_wo0_mtree_add2_1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((18 downto 18 => u0_m0_wo0_mtree_add1_2_q(17)) & u0_m0_wo0_mtree_add1_2_q));
    u0_m0_wo0_mtree_add2_1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((18 downto 9 => u0_m0_wo0_mtree_mult1_12_shift0_q(8)) & u0_m0_wo0_mtree_mult1_12_shift0_q));
    u0_m0_wo0_mtree_add2_1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add2_1_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add2_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add2_1_a) + SIGNED(u0_m0_wo0_mtree_add2_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add2_1_q <= u0_m0_wo0_mtree_add2_1_o(18 downto 0);

    -- u0_m0_wo0_wi0_r0_delayr5(DELAY,24)@10
    u0_m0_wo0_wi0_r0_delayr5 : dspba_delay
    GENERIC MAP ( width => 8, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr4_q, xout => u0_m0_wo0_wi0_r0_delayr5_q, ena => xIn_v(0), clk => clk, aclr => areset );

    -- u0_m0_wo0_mtree_mult1_7_shift2(BITSHIFT,97)@10
    u0_m0_wo0_mtree_mult1_7_shift2_qint <= u0_m0_wo0_wi0_r0_delayr5_q & "000";
    u0_m0_wo0_mtree_mult1_7_shift2_q <= u0_m0_wo0_mtree_mult1_7_shift2_qint(10 downto 0);

    -- u0_m0_wo0_mtree_mult1_7_sub_3(SUB,98)@10 + 1
    u0_m0_wo0_mtree_mult1_7_sub_3_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((11 downto 11 => u0_m0_wo0_mtree_mult1_7_shift2_q(10)) & u0_m0_wo0_mtree_mult1_7_shift2_q));
    u0_m0_wo0_mtree_mult1_7_sub_3_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((11 downto 8 => u0_m0_wo0_wi0_r0_delayr5_q(7)) & u0_m0_wo0_wi0_r0_delayr5_q));
    u0_m0_wo0_mtree_mult1_7_sub_3_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_7_sub_3_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_7_sub_3_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_7_sub_3_a) - SIGNED(u0_m0_wo0_mtree_mult1_7_sub_3_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_7_sub_3_q <= u0_m0_wo0_mtree_mult1_7_sub_3_o(11 downto 0);

    -- u0_m0_wo0_mtree_mult1_7_shift4(BITSHIFT,99)@11
    u0_m0_wo0_mtree_mult1_7_shift4_qint <= u0_m0_wo0_mtree_mult1_7_sub_3_q & "0000";
    u0_m0_wo0_mtree_mult1_7_shift4_q <= u0_m0_wo0_mtree_mult1_7_shift4_qint(15 downto 0);

    -- u0_m0_wo0_mtree_mult1_7_shift0(BITSHIFT,95)@10
    u0_m0_wo0_mtree_mult1_7_shift0_qint <= u0_m0_wo0_wi0_r0_delayr5_q & "00";
    u0_m0_wo0_mtree_mult1_7_shift0_q <= u0_m0_wo0_mtree_mult1_7_shift0_qint(9 downto 0);

    -- u0_m0_wo0_mtree_mult1_7_add_1(ADD,96)@10 + 1
    u0_m0_wo0_mtree_mult1_7_add_1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((10 downto 8 => u0_m0_wo0_wi0_r0_delayr5_q(7)) & u0_m0_wo0_wi0_r0_delayr5_q));
    u0_m0_wo0_mtree_mult1_7_add_1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((10 downto 10 => u0_m0_wo0_mtree_mult1_7_shift0_q(9)) & u0_m0_wo0_mtree_mult1_7_shift0_q));
    u0_m0_wo0_mtree_mult1_7_add_1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_7_add_1_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_7_add_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_7_add_1_a) + SIGNED(u0_m0_wo0_mtree_mult1_7_add_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_7_add_1_q <= u0_m0_wo0_mtree_mult1_7_add_1_o(10 downto 0);

    -- u0_m0_wo0_mtree_mult1_7_add_5(ADD,100)@11 + 1
    u0_m0_wo0_mtree_mult1_7_add_5_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((16 downto 11 => u0_m0_wo0_mtree_mult1_7_add_1_q(10)) & u0_m0_wo0_mtree_mult1_7_add_1_q));
    u0_m0_wo0_mtree_mult1_7_add_5_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((16 downto 16 => u0_m0_wo0_mtree_mult1_7_shift4_q(15)) & u0_m0_wo0_mtree_mult1_7_shift4_q));
    u0_m0_wo0_mtree_mult1_7_add_5_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_7_add_5_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_7_add_5_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_7_add_5_a) + SIGNED(u0_m0_wo0_mtree_mult1_7_add_5_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_7_add_5_q <= u0_m0_wo0_mtree_mult1_7_add_5_o(16 downto 0);

    -- u0_m0_wo0_wi0_r0_delayr6(DELAY,25)@10
    u0_m0_wo0_wi0_r0_delayr6 : dspba_delay
    GENERIC MAP ( width => 8, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr5_q, xout => u0_m0_wo0_wi0_r0_delayr6_q, ena => xIn_v(0), clk => clk, aclr => areset );

    -- d_u0_m0_wo0_wi0_r0_delayr6_q_11(DELAY,134)@10 + 1
    d_u0_m0_wo0_wi0_r0_delayr6_q_11 : dspba_delay
    GENERIC MAP ( width => 8, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr6_q, xout => d_u0_m0_wo0_wi0_r0_delayr6_q_11_q, clk => clk, aclr => areset );

    -- u0_m0_wo0_mtree_mult1_6_shift0(BITSHIFT,101)@11
    u0_m0_wo0_mtree_mult1_6_shift0_qint <= d_u0_m0_wo0_wi0_r0_delayr6_q_11_q & "0000000";
    u0_m0_wo0_mtree_mult1_6_shift0_q <= u0_m0_wo0_mtree_mult1_6_shift0_qint(14 downto 0);

    -- u0_m0_wo0_mtree_mult1_6_sub_1(SUB,102)@11 + 1
    u0_m0_wo0_mtree_mult1_6_sub_1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((15 downto 15 => u0_m0_wo0_mtree_mult1_6_shift0_q(14)) & u0_m0_wo0_mtree_mult1_6_shift0_q));
    u0_m0_wo0_mtree_mult1_6_sub_1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((15 downto 8 => d_u0_m0_wo0_wi0_r0_delayr6_q_11_q(7)) & d_u0_m0_wo0_wi0_r0_delayr6_q_11_q));
    u0_m0_wo0_mtree_mult1_6_sub_1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_6_sub_1_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_6_sub_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_6_sub_1_a) - SIGNED(u0_m0_wo0_mtree_mult1_6_sub_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_6_sub_1_q <= u0_m0_wo0_mtree_mult1_6_sub_1_o(15 downto 0);

    -- u0_m0_wo0_mtree_add0_3(ADD,64)@12 + 1
    u0_m0_wo0_mtree_add0_3_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((16 downto 16 => u0_m0_wo0_mtree_mult1_6_sub_1_q(15)) & u0_m0_wo0_mtree_mult1_6_sub_1_q));
    u0_m0_wo0_mtree_add0_3_b <= STD_LOGIC_VECTOR(u0_m0_wo0_mtree_mult1_7_add_5_q);
    u0_m0_wo0_mtree_add0_3_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add0_3_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add0_3_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add0_3_a) + SIGNED(u0_m0_wo0_mtree_add0_3_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add0_3_q <= u0_m0_wo0_mtree_add0_3_o(16 downto 0);

    -- u0_m0_wo0_wi0_r0_delayr7(DELAY,26)@10
    u0_m0_wo0_wi0_r0_delayr7 : dspba_delay
    GENERIC MAP ( width => 8, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr6_q, xout => u0_m0_wo0_wi0_r0_delayr7_q, ena => xIn_v(0), clk => clk, aclr => areset );

    -- u0_m0_wo0_mtree_mult1_5_shift2(BITSHIFT,105)@10
    u0_m0_wo0_mtree_mult1_5_shift2_qint <= u0_m0_wo0_wi0_r0_delayr7_q & "000";
    u0_m0_wo0_mtree_mult1_5_shift2_q <= u0_m0_wo0_mtree_mult1_5_shift2_qint(10 downto 0);

    -- u0_m0_wo0_mtree_mult1_5_sub_3(SUB,106)@10 + 1
    u0_m0_wo0_mtree_mult1_5_sub_3_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((11 downto 11 => u0_m0_wo0_mtree_mult1_5_shift2_q(10)) & u0_m0_wo0_mtree_mult1_5_shift2_q));
    u0_m0_wo0_mtree_mult1_5_sub_3_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((11 downto 8 => u0_m0_wo0_wi0_r0_delayr7_q(7)) & u0_m0_wo0_wi0_r0_delayr7_q));
    u0_m0_wo0_mtree_mult1_5_sub_3_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_5_sub_3_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_5_sub_3_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_5_sub_3_a) - SIGNED(u0_m0_wo0_mtree_mult1_5_sub_3_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_5_sub_3_q <= u0_m0_wo0_mtree_mult1_5_sub_3_o(11 downto 0);

    -- u0_m0_wo0_mtree_mult1_5_shift4(BITSHIFT,107)@11
    u0_m0_wo0_mtree_mult1_5_shift4_qint <= u0_m0_wo0_mtree_mult1_5_sub_3_q & "0000";
    u0_m0_wo0_mtree_mult1_5_shift4_q <= u0_m0_wo0_mtree_mult1_5_shift4_qint(15 downto 0);

    -- u0_m0_wo0_mtree_mult1_5_shift0(BITSHIFT,103)@10
    u0_m0_wo0_mtree_mult1_5_shift0_qint <= u0_m0_wo0_wi0_r0_delayr7_q & "00";
    u0_m0_wo0_mtree_mult1_5_shift0_q <= u0_m0_wo0_mtree_mult1_5_shift0_qint(9 downto 0);

    -- u0_m0_wo0_mtree_mult1_5_add_1(ADD,104)@10 + 1
    u0_m0_wo0_mtree_mult1_5_add_1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((10 downto 8 => u0_m0_wo0_wi0_r0_delayr7_q(7)) & u0_m0_wo0_wi0_r0_delayr7_q));
    u0_m0_wo0_mtree_mult1_5_add_1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((10 downto 10 => u0_m0_wo0_mtree_mult1_5_shift0_q(9)) & u0_m0_wo0_mtree_mult1_5_shift0_q));
    u0_m0_wo0_mtree_mult1_5_add_1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_5_add_1_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_5_add_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_5_add_1_a) + SIGNED(u0_m0_wo0_mtree_mult1_5_add_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_5_add_1_q <= u0_m0_wo0_mtree_mult1_5_add_1_o(10 downto 0);

    -- u0_m0_wo0_mtree_mult1_5_add_5(ADD,108)@11 + 1
    u0_m0_wo0_mtree_mult1_5_add_5_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((16 downto 11 => u0_m0_wo0_mtree_mult1_5_add_1_q(10)) & u0_m0_wo0_mtree_mult1_5_add_1_q));
    u0_m0_wo0_mtree_mult1_5_add_5_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((16 downto 16 => u0_m0_wo0_mtree_mult1_5_shift4_q(15)) & u0_m0_wo0_mtree_mult1_5_shift4_q));
    u0_m0_wo0_mtree_mult1_5_add_5_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_5_add_5_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_5_add_5_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_5_add_5_a) + SIGNED(u0_m0_wo0_mtree_mult1_5_add_5_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_5_add_5_q <= u0_m0_wo0_mtree_mult1_5_add_5_o(16 downto 0);

    -- u0_m0_wo0_mtree_mult1_4_shift0(BITSHIFT,109)@10
    u0_m0_wo0_mtree_mult1_4_shift0_qint <= u0_m0_wo0_wi0_r0_delayr8_q & "00";
    u0_m0_wo0_mtree_mult1_4_shift0_q <= u0_m0_wo0_mtree_mult1_4_shift0_qint(9 downto 0);

    -- u0_m0_wo0_wi0_r0_delayr8(DELAY,27)@10
    u0_m0_wo0_wi0_r0_delayr8 : dspba_delay
    GENERIC MAP ( width => 8, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr7_q, xout => u0_m0_wo0_wi0_r0_delayr8_q, ena => xIn_v(0), clk => clk, aclr => areset );

    -- u0_m0_wo0_mtree_mult1_4_add_1(ADD,110)@10 + 1
    u0_m0_wo0_mtree_mult1_4_add_1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((10 downto 8 => u0_m0_wo0_wi0_r0_delayr8_q(7)) & u0_m0_wo0_wi0_r0_delayr8_q));
    u0_m0_wo0_mtree_mult1_4_add_1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((10 downto 10 => u0_m0_wo0_mtree_mult1_4_shift0_q(9)) & u0_m0_wo0_mtree_mult1_4_shift0_q));
    u0_m0_wo0_mtree_mult1_4_add_1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_4_add_1_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_4_add_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_4_add_1_a) + SIGNED(u0_m0_wo0_mtree_mult1_4_add_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_4_add_1_q <= u0_m0_wo0_mtree_mult1_4_add_1_o(10 downto 0);

    -- u0_m0_wo0_mtree_mult1_4_shift2(BITSHIFT,111)@10
    u0_m0_wo0_mtree_mult1_4_shift2_qint <= u0_m0_wo0_wi0_r0_delayr8_q & "00";
    u0_m0_wo0_mtree_mult1_4_shift2_q <= u0_m0_wo0_mtree_mult1_4_shift2_qint(9 downto 0);

    -- u0_m0_wo0_mtree_mult1_4_sub_3(SUB,112)@10 + 1
    u0_m0_wo0_mtree_mult1_4_sub_3_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((10 downto 10 => u0_m0_wo0_mtree_mult1_4_shift2_q(9)) & u0_m0_wo0_mtree_mult1_4_shift2_q));
    u0_m0_wo0_mtree_mult1_4_sub_3_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((10 downto 8 => u0_m0_wo0_wi0_r0_delayr8_q(7)) & u0_m0_wo0_wi0_r0_delayr8_q));
    u0_m0_wo0_mtree_mult1_4_sub_3_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_4_sub_3_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_4_sub_3_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_4_sub_3_a) - SIGNED(u0_m0_wo0_mtree_mult1_4_sub_3_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_4_sub_3_q <= u0_m0_wo0_mtree_mult1_4_sub_3_o(10 downto 0);

    -- u0_m0_wo0_mtree_mult1_4_shift4(BITSHIFT,113)@11
    u0_m0_wo0_mtree_mult1_4_shift4_qint <= u0_m0_wo0_mtree_mult1_4_sub_3_q & "00000";
    u0_m0_wo0_mtree_mult1_4_shift4_q <= u0_m0_wo0_mtree_mult1_4_shift4_qint(15 downto 0);

    -- u0_m0_wo0_mtree_mult1_4_sub_5(SUB,114)@11 + 1
    u0_m0_wo0_mtree_mult1_4_sub_5_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((16 downto 16 => u0_m0_wo0_mtree_mult1_4_shift4_q(15)) & u0_m0_wo0_mtree_mult1_4_shift4_q));
    u0_m0_wo0_mtree_mult1_4_sub_5_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((16 downto 11 => u0_m0_wo0_mtree_mult1_4_add_1_q(10)) & u0_m0_wo0_mtree_mult1_4_add_1_q));
    u0_m0_wo0_mtree_mult1_4_sub_5_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_4_sub_5_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_4_sub_5_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_4_sub_5_a) - SIGNED(u0_m0_wo0_mtree_mult1_4_sub_5_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_4_sub_5_q <= u0_m0_wo0_mtree_mult1_4_sub_5_o(16 downto 0);

    -- u0_m0_wo0_mtree_add0_2(ADD,63)@12 + 1
    u0_m0_wo0_mtree_add0_2_a <= STD_LOGIC_VECTOR(u0_m0_wo0_mtree_mult1_4_sub_5_q);
    u0_m0_wo0_mtree_add0_2_b <= STD_LOGIC_VECTOR(u0_m0_wo0_mtree_mult1_5_add_5_q);
    u0_m0_wo0_mtree_add0_2_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add0_2_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add0_2_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add0_2_a) + SIGNED(u0_m0_wo0_mtree_add0_2_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add0_2_q <= u0_m0_wo0_mtree_add0_2_o(16 downto 0);

    -- u0_m0_wo0_mtree_add1_1(ADD,68)@13 + 1
    u0_m0_wo0_mtree_add1_1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((17 downto 17 => u0_m0_wo0_mtree_add0_2_q(16)) & u0_m0_wo0_mtree_add0_2_q));
    u0_m0_wo0_mtree_add1_1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((17 downto 17 => u0_m0_wo0_mtree_add0_3_q(16)) & u0_m0_wo0_mtree_add0_3_q));
    u0_m0_wo0_mtree_add1_1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add1_1_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add1_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add1_1_a) + SIGNED(u0_m0_wo0_mtree_add1_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add1_1_q <= u0_m0_wo0_mtree_add1_1_o(17 downto 0);

    -- u0_m0_wo0_mtree_mult1_3_shift0(BITSHIFT,115)@10
    u0_m0_wo0_mtree_mult1_3_shift0_qint <= u0_m0_wo0_wi0_r0_delayr9_q & "00";
    u0_m0_wo0_mtree_mult1_3_shift0_q <= u0_m0_wo0_mtree_mult1_3_shift0_qint(9 downto 0);

    -- u0_m0_wo0_wi0_r0_delayr9(DELAY,28)@10
    u0_m0_wo0_wi0_r0_delayr9 : dspba_delay
    GENERIC MAP ( width => 8, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr8_q, xout => u0_m0_wo0_wi0_r0_delayr9_q, ena => xIn_v(0), clk => clk, aclr => areset );

    -- u0_m0_wo0_mtree_mult1_3_add_1(ADD,116)@10 + 1
    u0_m0_wo0_mtree_mult1_3_add_1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((10 downto 8 => u0_m0_wo0_wi0_r0_delayr9_q(7)) & u0_m0_wo0_wi0_r0_delayr9_q));
    u0_m0_wo0_mtree_mult1_3_add_1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((10 downto 10 => u0_m0_wo0_mtree_mult1_3_shift0_q(9)) & u0_m0_wo0_mtree_mult1_3_shift0_q));
    u0_m0_wo0_mtree_mult1_3_add_1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_3_add_1_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_3_add_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_3_add_1_a) + SIGNED(u0_m0_wo0_mtree_mult1_3_add_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_3_add_1_q <= u0_m0_wo0_mtree_mult1_3_add_1_o(10 downto 0);

    -- d_u0_m0_wo0_wi0_r0_delayr9_q_11(DELAY,135)@10 + 1
    d_u0_m0_wo0_wi0_r0_delayr9_q_11 : dspba_delay
    GENERIC MAP ( width => 8, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr9_q, xout => d_u0_m0_wo0_wi0_r0_delayr9_q_11_q, clk => clk, aclr => areset );

    -- u0_m0_wo0_mtree_mult1_3_shift2(BITSHIFT,117)@11
    u0_m0_wo0_mtree_mult1_3_shift2_qint <= d_u0_m0_wo0_wi0_r0_delayr9_q_11_q & "000000";
    u0_m0_wo0_mtree_mult1_3_shift2_q <= u0_m0_wo0_mtree_mult1_3_shift2_qint(13 downto 0);

    -- u0_m0_wo0_mtree_mult1_3_sub_3(SUB,118)@11 + 1
    u0_m0_wo0_mtree_mult1_3_sub_3_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 14 => u0_m0_wo0_mtree_mult1_3_shift2_q(13)) & u0_m0_wo0_mtree_mult1_3_shift2_q));
    u0_m0_wo0_mtree_mult1_3_sub_3_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 11 => u0_m0_wo0_mtree_mult1_3_add_1_q(10)) & u0_m0_wo0_mtree_mult1_3_add_1_q));
    u0_m0_wo0_mtree_mult1_3_sub_3_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_3_sub_3_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_3_sub_3_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_3_sub_3_a) - SIGNED(u0_m0_wo0_mtree_mult1_3_sub_3_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_3_sub_3_q <= u0_m0_wo0_mtree_mult1_3_sub_3_o(14 downto 0);

    -- d_u0_m0_wo0_memread_q_11(DELAY,125)@10 + 1
    d_u0_m0_wo0_memread_q_11 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => xIn_v, xout => d_u0_m0_wo0_memread_q_11_q, clk => clk, aclr => areset );

    -- d_u0_m0_wo0_compute_q_11(DELAY,127)@10 + 1
    d_u0_m0_wo0_compute_q_11 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => xIn_v, xout => d_u0_m0_wo0_compute_q_11_q, clk => clk, aclr => areset );

    -- u0_m0_wo0_wi0_r0_delayr10(DELAY,29)@11
    u0_m0_wo0_wi0_r0_delayr10 : dspba_delay
    GENERIC MAP ( width => 8, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => d_u0_m0_wo0_wi0_r0_delayr9_q_11_q, xout => u0_m0_wo0_wi0_r0_delayr10_q, ena => d_u0_m0_wo0_compute_q_11_q(0), clk => clk, aclr => areset );

    -- u0_m0_wo0_mtree_mult1_2_shift0(BITSHIFT,119)@11
    u0_m0_wo0_mtree_mult1_2_shift0_qint <= u0_m0_wo0_wi0_r0_delayr10_q & "00000";
    u0_m0_wo0_mtree_mult1_2_shift0_q <= u0_m0_wo0_mtree_mult1_2_shift0_qint(12 downto 0);

    -- u0_m0_wo0_mtree_mult1_2_sub_1(SUB,120)@11 + 1
    u0_m0_wo0_mtree_mult1_2_sub_1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((13 downto 13 => u0_m0_wo0_mtree_mult1_2_shift0_q(12)) & u0_m0_wo0_mtree_mult1_2_shift0_q));
    u0_m0_wo0_mtree_mult1_2_sub_1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((13 downto 8 => u0_m0_wo0_wi0_r0_delayr10_q(7)) & u0_m0_wo0_wi0_r0_delayr10_q));
    u0_m0_wo0_mtree_mult1_2_sub_1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_2_sub_1_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_2_sub_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_2_sub_1_a) - SIGNED(u0_m0_wo0_mtree_mult1_2_sub_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_2_sub_1_q <= u0_m0_wo0_mtree_mult1_2_sub_1_o(13 downto 0);

    -- u0_m0_wo0_mtree_add0_1(ADD,62)@12 + 1
    u0_m0_wo0_mtree_add0_1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((15 downto 14 => u0_m0_wo0_mtree_mult1_2_sub_1_q(13)) & u0_m0_wo0_mtree_mult1_2_sub_1_q));
    u0_m0_wo0_mtree_add0_1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((15 downto 15 => u0_m0_wo0_mtree_mult1_3_sub_3_q(14)) & u0_m0_wo0_mtree_mult1_3_sub_3_q));
    u0_m0_wo0_mtree_add0_1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add0_1_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add0_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add0_1_a) + SIGNED(u0_m0_wo0_mtree_add0_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add0_1_q <= u0_m0_wo0_mtree_add0_1_o(15 downto 0);

    -- u0_m0_wo0_mtree_mult1_1_shift0(BITSHIFT,121)@11
    u0_m0_wo0_mtree_mult1_1_shift0_qint <= u0_m0_wo0_wi0_r0_delayr11_q & "0";
    u0_m0_wo0_mtree_mult1_1_shift0_q <= u0_m0_wo0_mtree_mult1_1_shift0_qint(8 downto 0);

    -- u0_m0_wo0_wi0_r0_delayr11(DELAY,30)@11
    u0_m0_wo0_wi0_r0_delayr11 : dspba_delay
    GENERIC MAP ( width => 8, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr10_q, xout => u0_m0_wo0_wi0_r0_delayr11_q, ena => d_u0_m0_wo0_compute_q_11_q(0), clk => clk, aclr => areset );

    -- u0_m0_wo0_mtree_mult1_1_add_1(ADD,122)@11 + 1
    u0_m0_wo0_mtree_mult1_1_add_1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((9 downto 8 => u0_m0_wo0_wi0_r0_delayr11_q(7)) & u0_m0_wo0_wi0_r0_delayr11_q));
    u0_m0_wo0_mtree_mult1_1_add_1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((9 downto 9 => u0_m0_wo0_mtree_mult1_1_shift0_q(8)) & u0_m0_wo0_mtree_mult1_1_shift0_q));
    u0_m0_wo0_mtree_mult1_1_add_1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_1_add_1_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_1_add_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_1_add_1_a) + SIGNED(u0_m0_wo0_mtree_mult1_1_add_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_1_add_1_q <= u0_m0_wo0_mtree_mult1_1_add_1_o(9 downto 0);

    -- u0_m0_wo0_mtree_mult1_1_shift2(BITSHIFT,123)@12
    u0_m0_wo0_mtree_mult1_1_shift2_qint <= u0_m0_wo0_mtree_mult1_1_add_1_q & "00";
    u0_m0_wo0_mtree_mult1_1_shift2_q <= u0_m0_wo0_mtree_mult1_1_shift2_qint(11 downto 0);

    -- d_u0_m0_wo0_memread_q_12(DELAY,126)@11 + 1
    d_u0_m0_wo0_memread_q_12 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => d_u0_m0_wo0_memread_q_11_q, xout => d_u0_m0_wo0_memread_q_12_q, clk => clk, aclr => areset );

    -- d_u0_m0_wo0_compute_q_12(DELAY,128)@11 + 1
    d_u0_m0_wo0_compute_q_12 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => d_u0_m0_wo0_compute_q_11_q, xout => d_u0_m0_wo0_compute_q_12_q, clk => clk, aclr => areset );

    -- d_u0_m0_wo0_wi0_r0_delayr11_q_12(DELAY,136)@11 + 1
    d_u0_m0_wo0_wi0_r0_delayr11_q_12 : dspba_delay
    GENERIC MAP ( width => 8, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr11_q, xout => d_u0_m0_wo0_wi0_r0_delayr11_q_12_q, clk => clk, aclr => areset );

    -- u0_m0_wo0_wi0_r0_delayr12(DELAY,31)@12
    u0_m0_wo0_wi0_r0_delayr12 : dspba_delay
    GENERIC MAP ( width => 8, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => d_u0_m0_wo0_wi0_r0_delayr11_q_12_q, xout => u0_m0_wo0_wi0_r0_delayr12_q, ena => d_u0_m0_wo0_compute_q_12_q(0), clk => clk, aclr => areset );

    -- u0_m0_wo0_mtree_mult1_0_shift0(BITSHIFT,124)@12
    u0_m0_wo0_mtree_mult1_0_shift0_qint <= u0_m0_wo0_wi0_r0_delayr12_q & "0";
    u0_m0_wo0_mtree_mult1_0_shift0_q <= u0_m0_wo0_mtree_mult1_0_shift0_qint(8 downto 0);

    -- u0_m0_wo0_mtree_add0_0(ADD,61)@12 + 1
    u0_m0_wo0_mtree_add0_0_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((12 downto 9 => u0_m0_wo0_mtree_mult1_0_shift0_q(8)) & u0_m0_wo0_mtree_mult1_0_shift0_q));
    u0_m0_wo0_mtree_add0_0_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((12 downto 12 => u0_m0_wo0_mtree_mult1_1_shift2_q(11)) & u0_m0_wo0_mtree_mult1_1_shift2_q));
    u0_m0_wo0_mtree_add0_0_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add0_0_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add0_0_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add0_0_a) + SIGNED(u0_m0_wo0_mtree_add0_0_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add0_0_q <= u0_m0_wo0_mtree_add0_0_o(12 downto 0);

    -- u0_m0_wo0_mtree_add1_0(ADD,67)@13 + 1
    u0_m0_wo0_mtree_add1_0_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((16 downto 13 => u0_m0_wo0_mtree_add0_0_q(12)) & u0_m0_wo0_mtree_add0_0_q));
    u0_m0_wo0_mtree_add1_0_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((16 downto 16 => u0_m0_wo0_mtree_add0_1_q(15)) & u0_m0_wo0_mtree_add0_1_q));
    u0_m0_wo0_mtree_add1_0_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add1_0_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add1_0_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add1_0_a) + SIGNED(u0_m0_wo0_mtree_add1_0_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add1_0_q <= u0_m0_wo0_mtree_add1_0_o(16 downto 0);

    -- u0_m0_wo0_mtree_add2_0(ADD,70)@14 + 1
    u0_m0_wo0_mtree_add2_0_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((18 downto 17 => u0_m0_wo0_mtree_add1_0_q(16)) & u0_m0_wo0_mtree_add1_0_q));
    u0_m0_wo0_mtree_add2_0_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((18 downto 18 => u0_m0_wo0_mtree_add1_1_q(17)) & u0_m0_wo0_mtree_add1_1_q));
    u0_m0_wo0_mtree_add2_0_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add2_0_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add2_0_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add2_0_a) + SIGNED(u0_m0_wo0_mtree_add2_0_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add2_0_q <= u0_m0_wo0_mtree_add2_0_o(18 downto 0);

    -- u0_m0_wo0_mtree_add3_0(ADD,72)@15 + 1
    u0_m0_wo0_mtree_add3_0_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((19 downto 19 => u0_m0_wo0_mtree_add2_0_q(18)) & u0_m0_wo0_mtree_add2_0_q));
    u0_m0_wo0_mtree_add3_0_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((19 downto 19 => u0_m0_wo0_mtree_add2_1_q(18)) & u0_m0_wo0_mtree_add2_1_q));
    u0_m0_wo0_mtree_add3_0_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add3_0_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add3_0_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add3_0_a) + SIGNED(u0_m0_wo0_mtree_add3_0_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add3_0_q <= u0_m0_wo0_mtree_add3_0_o(19 downto 0);

    -- GND(CONSTANT,0)@0
    GND_q <= "0";

    -- d_u0_m0_wo0_compute_q_15(DELAY,129)@12 + 3
    d_u0_m0_wo0_compute_q_15 : dspba_delay
    GENERIC MAP ( width => 1, depth => 3, reset_kind => "ASYNC" )
    PORT MAP ( xin => d_u0_m0_wo0_compute_q_12_q, xout => d_u0_m0_wo0_compute_q_15_q, clk => clk, aclr => areset );

    -- u0_m0_wo0_oseq_gated_reg(REG,73)@15 + 1
    u0_m0_wo0_oseq_gated_reg_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_oseq_gated_reg_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_oseq_gated_reg_q <= STD_LOGIC_VECTOR(d_u0_m0_wo0_compute_q_15_q);
        END IF;
    END PROCESS;

    -- xOut(PORTOUT,78)@16 + 1
    xOut_v <= u0_m0_wo0_oseq_gated_reg_q;
    xOut_c <= STD_LOGIC_VECTOR("0000000" & GND_q);
    xOut_0 <= u0_m0_wo0_mtree_add3_0_q;

END normal;
