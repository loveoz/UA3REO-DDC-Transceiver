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

-- VHDL created from rx_ciccomp_0002_rtl_core
-- VHDL created on Sun Mar 20 13:51:32 2022


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

entity rx_ciccomp_0002_rtl_core is
    port (
        xIn_v : in std_logic_vector(0 downto 0);  -- sfix1
        xIn_c : in std_logic_vector(7 downto 0);  -- sfix8
        xIn_0 : in std_logic_vector(31 downto 0);  -- sfix32
        enable_i : in std_logic_vector(0 downto 0);  -- sfix1
        xOut_v : out std_logic_vector(0 downto 0);  -- ufix1
        xOut_c : out std_logic_vector(7 downto 0);  -- ufix8
        xOut_0 : out std_logic_vector(61 downto 0);  -- sfix62
        clk : in std_logic;
        areset : in std_logic
    );
end rx_ciccomp_0002_rtl_core;

architecture normal of rx_ciccomp_0002_rtl_core is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    signal GND_q : STD_LOGIC_VECTOR (0 downto 0);
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal d_in0_m0_wi0_wo0_assign_id1_q_11_q : STD_LOGIC_VECTOR (0 downto 0);
    signal d_in0_m0_wi0_wo0_assign_id1_q_16_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_inputframe_seq_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_inputframe_seq_eq : std_logic;
    signal u0_m0_wo0_run_count : STD_LOGIC_VECTOR (2 downto 0);
    signal u0_m0_wo0_run_preEnaQ : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_run_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_run_out : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_run_enableQ : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_run_ctrl : STD_LOGIC_VECTOR (2 downto 0);
    signal u0_m0_wo0_memread_q : STD_LOGIC_VECTOR (0 downto 0);
    signal d_u0_m0_wo0_memread_q_14_q : STD_LOGIC_VECTOR (0 downto 0);
    signal d_u0_m0_wo0_memread_q_15_q : STD_LOGIC_VECTOR (0 downto 0);
    signal d_u0_m0_wo0_memread_q_21_q : STD_LOGIC_VECTOR (0 downto 0);
    signal d_u0_m0_wo0_memread_q_22_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_compute_q : STD_LOGIC_VECTOR (0 downto 0);
    signal d_u0_m0_wo0_compute_q_15_q : STD_LOGIC_VECTOR (0 downto 0);
    signal d_u0_m0_wo0_compute_q_20_q : STD_LOGIC_VECTOR (0 downto 0);
    signal d_u0_m0_wo0_compute_q_21_q : STD_LOGIC_VECTOR (0 downto 0);
    signal d_u0_m0_wo0_compute_q_22_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_wi0_r0_ra1_count0_inner_q : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo0_wi0_r0_ra1_count0_inner_i : SIGNED (9 downto 0);
    attribute preserve : boolean;
    attribute preserve of u0_m0_wo0_wi0_r0_ra1_count0_inner_i : signal is true;
    signal u0_m0_wo0_wi0_r0_ra1_count0_q : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo0_wi0_r0_ra1_count0_i : UNSIGNED (8 downto 0);
    attribute preserve of u0_m0_wo0_wi0_r0_ra1_count0_i : signal is true;
    signal u0_m0_wo0_wi0_r0_ra1_count1_q : STD_LOGIC_VECTOR (2 downto 0);
    signal u0_m0_wo0_wi0_r0_ra1_count1_i : UNSIGNED (1 downto 0);
    attribute preserve of u0_m0_wo0_wi0_r0_ra1_count1_i : signal is true;
    signal u0_m0_wo0_wi0_r0_ra1_count2_lutreg_q : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo0_wi0_r0_ra1_count2_inner_q : STD_LOGIC_VECTOR (2 downto 0);
    signal u0_m0_wo0_wi0_r0_ra1_count2_inner_i : SIGNED (2 downto 0);
    attribute preserve of u0_m0_wo0_wi0_r0_ra1_count2_inner_i : signal is true;
    signal u0_m0_wo0_wi0_r0_ra1_count2_q : STD_LOGIC_VECTOR (6 downto 0);
    signal u0_m0_wo0_wi0_r0_ra1_count2_i : UNSIGNED (6 downto 0);
    attribute preserve of u0_m0_wo0_wi0_r0_ra1_count2_i : signal is true;
    signal u0_m0_wo0_wi0_r0_ra1_count2_eq : std_logic;
    attribute preserve of u0_m0_wo0_wi0_r0_ra1_count2_eq : signal is true;
    signal u0_m0_wo0_wi0_r0_ra1_add_1_0_a : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_wi0_r0_ra1_add_1_0_b : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_wi0_r0_ra1_add_1_0_o : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_wi0_r0_ra1_add_1_0_q : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_wi0_r0_we1_seq_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_wi0_r0_we1_seq_eq : std_logic;
    signal u0_m0_wo0_wi0_r0_wa0_q : STD_LOGIC_VECTOR (8 downto 0);
    signal u0_m0_wo0_wi0_r0_wa0_i : UNSIGNED (8 downto 0);
    attribute preserve of u0_m0_wo0_wi0_r0_wa0_i : signal is true;
    signal u0_m0_wo0_wi0_r0_wa1_q : STD_LOGIC_VECTOR (8 downto 0);
    signal u0_m0_wo0_wi0_r0_wa1_i : UNSIGNED (8 downto 0);
    attribute preserve of u0_m0_wo0_wi0_r0_wa1_i : signal is true;
    signal u0_m0_wo0_wi0_r0_memr0_reset0 : std_logic;
    signal u0_m0_wo0_wi0_r0_memr0_ia : STD_LOGIC_VECTOR (31 downto 0);
    signal u0_m0_wo0_wi0_r0_memr0_aa : STD_LOGIC_VECTOR (8 downto 0);
    signal u0_m0_wo0_wi0_r0_memr0_ab : STD_LOGIC_VECTOR (8 downto 0);
    signal u0_m0_wo0_wi0_r0_memr0_iq : STD_LOGIC_VECTOR (31 downto 0);
    signal u0_m0_wo0_wi0_r0_memr0_q : STD_LOGIC_VECTOR (31 downto 0);
    signal d_u0_m0_wo0_wi0_r0_memr0_q_17_q : STD_LOGIC_VECTOR (31 downto 0);
    signal u0_m0_wo0_wi0_r0_memr1_reset0 : std_logic;
    signal u0_m0_wo0_wi0_r0_memr1_ia : STD_LOGIC_VECTOR (31 downto 0);
    signal u0_m0_wo0_wi0_r0_memr1_aa : STD_LOGIC_VECTOR (8 downto 0);
    signal u0_m0_wo0_wi0_r0_memr1_ab : STD_LOGIC_VECTOR (8 downto 0);
    signal u0_m0_wo0_wi0_r0_memr1_iq : STD_LOGIC_VECTOR (31 downto 0);
    signal u0_m0_wo0_wi0_r0_memr1_q : STD_LOGIC_VECTOR (31 downto 0);
    signal d_u0_m0_wo0_wi0_r0_memr1_q_17_q : STD_LOGIC_VECTOR (31 downto 0);
    signal u0_m0_wo0_ca1_inner_q : STD_LOGIC_VECTOR (2 downto 0);
    signal u0_m0_wo0_ca1_inner_i : SIGNED (2 downto 0);
    attribute preserve of u0_m0_wo0_ca1_inner_i : signal is true;
    signal u0_m0_wo0_ca1_q : STD_LOGIC_VECTOR (6 downto 0);
    signal u0_m0_wo0_ca1_i : UNSIGNED (6 downto 0);
    attribute preserve of u0_m0_wo0_ca1_i : signal is true;
    signal u0_m0_wo0_ca1_eq : std_logic;
    attribute preserve of u0_m0_wo0_ca1_eq : signal is true;
    signal u0_m0_wo0_aseq_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_aseq_eq : std_logic;
    signal d_u0_m0_wo0_aseq_q_22_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_oseq_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_oseq_eq : std_logic;
    signal u0_m0_wo0_oseq_gated_reg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal d_out0_m0_wo0_assign_id3_q_23_q : STD_LOGIC_VECTOR (0 downto 0);
    signal outchan_q : STD_LOGIC_VECTOR (2 downto 0);
    signal outchan_i : UNSIGNED (1 downto 0);
    attribute preserve of outchan_i : signal is true;
    signal u0_m0_wo0_wi0_r0_ra1_count2_lut_lutmem_reset0 : std_logic;
    signal u0_m0_wo0_wi0_r0_ra1_count2_lut_lutmem_ia : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo0_wi0_r0_ra1_count2_lut_lutmem_aa : STD_LOGIC_VECTOR (6 downto 0);
    signal u0_m0_wo0_wi0_r0_ra1_count2_lut_lutmem_ab : STD_LOGIC_VECTOR (6 downto 0);
    signal u0_m0_wo0_wi0_r0_ra1_count2_lut_lutmem_ir : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo0_wi0_r0_ra1_count2_lut_lutmem_r : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo0_cm0_lutmem_reset0 : std_logic;
    signal u0_m0_wo0_cm0_lutmem_ia : STD_LOGIC_VECTOR (21 downto 0);
    signal u0_m0_wo0_cm0_lutmem_aa : STD_LOGIC_VECTOR (6 downto 0);
    signal u0_m0_wo0_cm0_lutmem_ab : STD_LOGIC_VECTOR (6 downto 0);
    signal u0_m0_wo0_cm0_lutmem_ir : STD_LOGIC_VECTOR (21 downto 0);
    signal u0_m0_wo0_cm0_lutmem_r : STD_LOGIC_VECTOR (21 downto 0);
    signal u0_m0_wo0_cm1_lutmem_reset0 : std_logic;
    signal u0_m0_wo0_cm1_lutmem_ia : STD_LOGIC_VECTOR (21 downto 0);
    signal u0_m0_wo0_cm1_lutmem_aa : STD_LOGIC_VECTOR (6 downto 0);
    signal u0_m0_wo0_cm1_lutmem_ab : STD_LOGIC_VECTOR (6 downto 0);
    signal u0_m0_wo0_cm1_lutmem_ir : STD_LOGIC_VECTOR (21 downto 0);
    signal u0_m0_wo0_cm1_lutmem_r : STD_LOGIC_VECTOR (21 downto 0);
    signal u0_m0_wo0_mtree_mult1_1_im0_a0 : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo0_mtree_mult1_1_im0_b0 : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo0_mtree_mult1_1_im0_s1 : STD_LOGIC_VECTOR (33 downto 0);
    signal u0_m0_wo0_mtree_mult1_1_im0_reset : std_logic;
    signal u0_m0_wo0_mtree_mult1_1_im0_q : STD_LOGIC_VECTOR (33 downto 0);
    signal u0_m0_wo0_mtree_mult1_1_im3_a0 : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m0_wo0_mtree_mult1_1_im3_b0 : STD_LOGIC_VECTOR (14 downto 0);
    signal u0_m0_wo0_mtree_mult1_1_im3_s1 : STD_LOGIC_VECTOR (32 downto 0);
    signal u0_m0_wo0_mtree_mult1_1_im3_reset : std_logic;
    signal u0_m0_wo0_mtree_mult1_1_im3_q : STD_LOGIC_VECTOR (32 downto 0);
    signal u0_m0_wo0_mtree_mult1_1_im7_a0 : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m0_wo0_mtree_mult1_1_im7_b0 : STD_LOGIC_VECTOR (4 downto 0);
    signal u0_m0_wo0_mtree_mult1_1_im7_s1 : STD_LOGIC_VECTOR (22 downto 0);
    signal u0_m0_wo0_mtree_mult1_1_im7_reset : std_logic;
    signal u0_m0_wo0_mtree_mult1_1_im7_q : STD_LOGIC_VECTOR (22 downto 0);
    signal d_u0_m0_wo0_mtree_mult1_1_bs8_b_17_q : STD_LOGIC_VECTOR (4 downto 0);
    signal u0_m0_wo0_mtree_mult1_1_im11_a0 : STD_LOGIC_VECTOR (14 downto 0);
    signal u0_m0_wo0_mtree_mult1_1_im11_b0 : STD_LOGIC_VECTOR (4 downto 0);
    signal u0_m0_wo0_mtree_mult1_1_im11_s1 : STD_LOGIC_VECTOR (19 downto 0);
    signal u0_m0_wo0_mtree_mult1_1_im11_reset : std_logic;
    signal u0_m0_wo0_mtree_mult1_1_im11_q : STD_LOGIC_VECTOR (19 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_im0_a0 : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_im0_b0 : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_im0_s1 : STD_LOGIC_VECTOR (33 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_im0_reset : std_logic;
    signal u0_m0_wo0_mtree_mult1_0_im0_q : STD_LOGIC_VECTOR (33 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_im3_a0 : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_im3_b0 : STD_LOGIC_VECTOR (14 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_im3_s1 : STD_LOGIC_VECTOR (32 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_im3_reset : std_logic;
    signal u0_m0_wo0_mtree_mult1_0_im3_q : STD_LOGIC_VECTOR (32 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_im7_a0 : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_im7_b0 : STD_LOGIC_VECTOR (4 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_im7_s1 : STD_LOGIC_VECTOR (22 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_im7_reset : std_logic;
    signal u0_m0_wo0_mtree_mult1_0_im7_q : STD_LOGIC_VECTOR (22 downto 0);
    signal d_u0_m0_wo0_mtree_mult1_0_bs8_b_17_q : STD_LOGIC_VECTOR (4 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_im11_a0 : STD_LOGIC_VECTOR (14 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_im11_b0 : STD_LOGIC_VECTOR (4 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_im11_s1 : STD_LOGIC_VECTOR (19 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_im11_reset : std_logic;
    signal u0_m0_wo0_mtree_mult1_0_im11_q : STD_LOGIC_VECTOR (19 downto 0);
    signal u0_m0_wo0_mtree_add0_0_p1_of_2_a : STD_LOGIC_VECTOR (49 downto 0);
    signal u0_m0_wo0_mtree_add0_0_p1_of_2_b : STD_LOGIC_VECTOR (49 downto 0);
    signal u0_m0_wo0_mtree_add0_0_p1_of_2_o : STD_LOGIC_VECTOR (49 downto 0);
    signal u0_m0_wo0_mtree_add0_0_p1_of_2_c : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_mtree_add0_0_p1_of_2_q : STD_LOGIC_VECTOR (48 downto 0);
    signal u0_m0_wo0_mtree_add0_0_p2_of_2_a : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_mtree_add0_0_p2_of_2_b : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_mtree_add0_0_p2_of_2_o : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_mtree_add0_0_p2_of_2_cin : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_mtree_add0_0_p2_of_2_q : STD_LOGIC_VECTOR (5 downto 0);
    signal u0_m0_wo0_accum_p1_of_2_a : STD_LOGIC_VECTOR (49 downto 0);
    signal u0_m0_wo0_accum_p1_of_2_b : STD_LOGIC_VECTOR (49 downto 0);
    signal u0_m0_wo0_accum_p1_of_2_i : STD_LOGIC_VECTOR (49 downto 0);
    signal u0_m0_wo0_accum_p1_of_2_o : STD_LOGIC_VECTOR (49 downto 0);
    signal u0_m0_wo0_accum_p1_of_2_c : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_accum_p1_of_2_q : STD_LOGIC_VECTOR (48 downto 0);
    signal d_u0_m0_wo0_accum_p1_of_2_q_23_q : STD_LOGIC_VECTOR (48 downto 0);
    signal u0_m0_wo0_accum_p2_of_2_a : STD_LOGIC_VECTOR (14 downto 0);
    signal u0_m0_wo0_accum_p2_of_2_b : STD_LOGIC_VECTOR (14 downto 0);
    signal u0_m0_wo0_accum_p2_of_2_i : STD_LOGIC_VECTOR (14 downto 0);
    signal u0_m0_wo0_accum_p2_of_2_o : STD_LOGIC_VECTOR (14 downto 0);
    signal u0_m0_wo0_accum_p2_of_2_cin : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_accum_p2_of_2_q : STD_LOGIC_VECTOR (12 downto 0);
    signal d_u0_m0_wo0_mtree_mult1_1_result_add_0_0_BitSelect_for_a_c_19_q : STD_LOGIC_VECTOR (5 downto 0);
    signal d_u0_m0_wo0_mtree_mult1_1_result_add_0_0_BitSelect_for_b_c_19_q : STD_LOGIC_VECTOR (5 downto 0);
    signal u0_m0_wo0_mtree_mult1_1_result_add_0_0_p1_of_2_a : STD_LOGIC_VECTOR (49 downto 0);
    signal u0_m0_wo0_mtree_mult1_1_result_add_0_0_p1_of_2_b : STD_LOGIC_VECTOR (49 downto 0);
    signal u0_m0_wo0_mtree_mult1_1_result_add_0_0_p1_of_2_o : STD_LOGIC_VECTOR (49 downto 0);
    signal u0_m0_wo0_mtree_mult1_1_result_add_0_0_p1_of_2_c : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_mtree_mult1_1_result_add_0_0_p1_of_2_q : STD_LOGIC_VECTOR (48 downto 0);
    signal u0_m0_wo0_mtree_mult1_1_result_add_0_0_p2_of_2_a : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_mtree_mult1_1_result_add_0_0_p2_of_2_b : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_mtree_mult1_1_result_add_0_0_p2_of_2_o : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_mtree_mult1_1_result_add_0_0_p2_of_2_cin : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_mtree_mult1_1_result_add_0_0_p2_of_2_q : STD_LOGIC_VECTOR (5 downto 0);
    signal d_u0_m0_wo0_mtree_mult1_1_result_add_1_0_BitSelect_for_b_c_20_q : STD_LOGIC_VECTOR (6 downto 0);
    signal u0_m0_wo0_mtree_mult1_1_result_add_1_0_p1_of_2_a : STD_LOGIC_VECTOR (49 downto 0);
    signal u0_m0_wo0_mtree_mult1_1_result_add_1_0_p1_of_2_b : STD_LOGIC_VECTOR (49 downto 0);
    signal u0_m0_wo0_mtree_mult1_1_result_add_1_0_p1_of_2_o : STD_LOGIC_VECTOR (49 downto 0);
    signal u0_m0_wo0_mtree_mult1_1_result_add_1_0_p1_of_2_c : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_mtree_mult1_1_result_add_1_0_p1_of_2_q : STD_LOGIC_VECTOR (48 downto 0);
    signal u0_m0_wo0_mtree_mult1_1_result_add_1_0_p2_of_2_a : STD_LOGIC_VECTOR (8 downto 0);
    signal u0_m0_wo0_mtree_mult1_1_result_add_1_0_p2_of_2_b : STD_LOGIC_VECTOR (8 downto 0);
    signal u0_m0_wo0_mtree_mult1_1_result_add_1_0_p2_of_2_o : STD_LOGIC_VECTOR (8 downto 0);
    signal u0_m0_wo0_mtree_mult1_1_result_add_1_0_p2_of_2_cin : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_mtree_mult1_1_result_add_1_0_p2_of_2_q : STD_LOGIC_VECTOR (6 downto 0);
    signal d_u0_m0_wo0_mtree_mult1_0_result_add_0_0_BitSelect_for_a_c_19_q : STD_LOGIC_VECTOR (5 downto 0);
    signal d_u0_m0_wo0_mtree_mult1_0_result_add_0_0_BitSelect_for_b_c_19_q : STD_LOGIC_VECTOR (5 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_result_add_0_0_p1_of_2_a : STD_LOGIC_VECTOR (49 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_result_add_0_0_p1_of_2_b : STD_LOGIC_VECTOR (49 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_result_add_0_0_p1_of_2_o : STD_LOGIC_VECTOR (49 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_result_add_0_0_p1_of_2_c : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_result_add_0_0_p1_of_2_q : STD_LOGIC_VECTOR (48 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_result_add_0_0_p2_of_2_a : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_result_add_0_0_p2_of_2_b : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_result_add_0_0_p2_of_2_o : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_result_add_0_0_p2_of_2_cin : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_result_add_0_0_p2_of_2_q : STD_LOGIC_VECTOR (5 downto 0);
    signal d_u0_m0_wo0_mtree_mult1_0_result_add_1_0_BitSelect_for_b_c_20_q : STD_LOGIC_VECTOR (6 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_result_add_1_0_p1_of_2_a : STD_LOGIC_VECTOR (49 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_result_add_1_0_p1_of_2_b : STD_LOGIC_VECTOR (49 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_result_add_1_0_p1_of_2_o : STD_LOGIC_VECTOR (49 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_result_add_1_0_p1_of_2_c : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_result_add_1_0_p1_of_2_q : STD_LOGIC_VECTOR (48 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_result_add_1_0_p2_of_2_a : STD_LOGIC_VECTOR (8 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_result_add_1_0_p2_of_2_b : STD_LOGIC_VECTOR (8 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_result_add_1_0_p2_of_2_o : STD_LOGIC_VECTOR (8 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_result_add_1_0_p2_of_2_cin : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_result_add_1_0_p2_of_2_q : STD_LOGIC_VECTOR (6 downto 0);
    signal u0_m0_wo0_adelay_p0_q : STD_LOGIC_VECTOR (48 downto 0);
    signal u0_m0_wo0_adelay_p1_q : STD_LOGIC_VECTOR (12 downto 0);
    signal d_xIn_0_16_mem_reset0 : std_logic;
    signal d_xIn_0_16_mem_ia : STD_LOGIC_VECTOR (31 downto 0);
    signal d_xIn_0_16_mem_aa : STD_LOGIC_VECTOR (2 downto 0);
    signal d_xIn_0_16_mem_ab : STD_LOGIC_VECTOR (2 downto 0);
    signal d_xIn_0_16_mem_iq : STD_LOGIC_VECTOR (31 downto 0);
    signal d_xIn_0_16_mem_q : STD_LOGIC_VECTOR (31 downto 0);
    signal d_xIn_0_16_rdcnt_q : STD_LOGIC_VECTOR (2 downto 0);
    signal d_xIn_0_16_rdcnt_i : UNSIGNED (2 downto 0);
    attribute preserve of d_xIn_0_16_rdcnt_i : signal is true;
    signal d_xIn_0_16_rdcnt_eq : std_logic;
    attribute preserve of d_xIn_0_16_rdcnt_eq : signal is true;
    signal d_xIn_0_16_wraddr_q : STD_LOGIC_VECTOR (2 downto 0);
    signal d_xIn_0_16_mem_last_q : STD_LOGIC_VECTOR (2 downto 0);
    signal d_xIn_0_16_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal d_xIn_0_16_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    signal input_valid_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_inputframe_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_wi0_r0_ra1_count0_run_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_wi0_r0_ra1_count2_run_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_ca1_run_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_oseq_gated_q : STD_LOGIC_VECTOR (0 downto 0);
    signal d_xIn_0_16_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal d_xIn_0_16_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal d_xIn_0_16_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal d_xIn_0_16_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_wi0_r0_ra1_add_0_0_replace_or_BitSelect_for_a_in : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_wi0_r0_ra1_add_0_0_replace_or_BitSelect_for_a_b : STD_LOGIC_VECTOR (5 downto 0);
    signal u0_m0_wo0_wi0_r0_ra1_add_0_0_replace_or_BitSelect_for_b_in : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_wi0_r0_ra1_add_0_0_replace_or_BitSelect_for_b_b : STD_LOGIC_VECTOR (1 downto 0);
    signal u0_m0_wo0_wi0_r0_ra1_resize_in : STD_LOGIC_VECTOR (8 downto 0);
    signal u0_m0_wo0_wi0_r0_ra1_resize_b : STD_LOGIC_VECTOR (8 downto 0);
    signal u0_m0_wo0_mtree_mult1_1_bs2_in : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo0_mtree_mult1_1_bs2_b : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo0_mtree_mult1_1_bs6_b : STD_LOGIC_VECTOR (14 downto 0);
    signal u0_m0_wo0_mtree_mult1_1_bs9_in : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo0_mtree_mult1_1_bs9_b : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_bs2_in : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_bs2_b : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_bs6_b : STD_LOGIC_VECTOR (14 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_bs9_in : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_bs9_b : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo0_mtree_mult1_1_bs1_in : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo0_mtree_mult1_1_bs1_b : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo0_mtree_mult1_1_bs4_in : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo0_mtree_mult1_1_bs4_b : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo0_mtree_mult1_1_bs8_b : STD_LOGIC_VECTOR (4 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_bs1_in : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_bs1_b : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_bs4_in : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_bs4_b : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_bs8_b : STD_LOGIC_VECTOR (4 downto 0);
    signal u0_m0_wo0_mtree_mult1_1_join_14_q : STD_LOGIC_VECTOR (53 downto 0);
    signal u0_m0_wo0_mtree_mult1_1_align_15_q : STD_LOGIC_VECTOR (49 downto 0);
    signal u0_m0_wo0_mtree_mult1_1_align_15_qint : STD_LOGIC_VECTOR (49 downto 0);
    signal u0_m0_wo0_mtree_mult1_1_align_17_q : STD_LOGIC_VECTOR (39 downto 0);
    signal u0_m0_wo0_mtree_mult1_1_align_17_qint : STD_LOGIC_VECTOR (39 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_join_14_q : STD_LOGIC_VECTOR (53 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_align_15_q : STD_LOGIC_VECTOR (49 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_align_15_qint : STD_LOGIC_VECTOR (49 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_align_17_q : STD_LOGIC_VECTOR (39 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_align_17_qint : STD_LOGIC_VECTOR (39 downto 0);
    signal u0_m0_wo0_accum_BitSelect_for_a_tessel1_1_b : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_accum_BitSelect_for_a_BitJoin_for_c_q : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo0_accum_BitJoin_for_q_q : STD_LOGIC_VECTOR (61 downto 0);
    signal u0_m0_wo0_mtree_mult1_1_result_add_1_0_BitSelect_for_a_tessel1_1_b : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_mtree_mult1_1_result_add_1_0_BitSelect_for_a_BitJoin_for_c_q : STD_LOGIC_VECTOR (6 downto 0);
    signal u0_m0_wo0_mtree_add0_0_BitSelect_for_b_tessel1_0_b : STD_LOGIC_VECTOR (4 downto 0);
    signal u0_m0_wo0_mtree_add0_0_BitSelect_for_b_tessel1_1_b : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_result_add_1_0_BitSelect_for_a_tessel1_1_b : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_result_add_1_0_BitSelect_for_a_BitJoin_for_c_q : STD_LOGIC_VECTOR (6 downto 0);
    signal u0_m0_wo0_mtree_add0_0_BitSelect_for_a_tessel1_0_b : STD_LOGIC_VECTOR (4 downto 0);
    signal u0_m0_wo0_mtree_add0_0_BitSelect_for_a_tessel1_1_b : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_wi0_r0_ra1_add_0_0_replace_or_join_q : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_mtree_mult1_1_bjB10_q : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_bjB10_q : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m0_wo0_mtree_mult1_1_bjA5_q : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_bjA5_q : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m0_wo0_mtree_mult1_1_result_add_0_0_SignBit_for_a_b : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_mtree_mult1_1_result_add_0_0_BitExpansion_for_a_q : STD_LOGIC_VECTOR (54 downto 0);
    signal u0_m0_wo0_mtree_mult1_1_result_add_0_0_SignBit_for_b_b : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_mtree_mult1_1_result_add_1_0_SignBit_for_b_b : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_result_add_0_0_SignBit_for_a_b : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_result_add_0_0_BitExpansion_for_a_q : STD_LOGIC_VECTOR (54 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_result_add_0_0_SignBit_for_b_b : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_result_add_1_0_SignBit_for_b_b : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_mtree_add0_0_BitSelect_for_b_BitJoin_for_c_q : STD_LOGIC_VECTOR (5 downto 0);
    signal u0_m0_wo0_mtree_add0_0_BitSelect_for_a_BitJoin_for_c_q : STD_LOGIC_VECTOR (5 downto 0);
    signal u0_m0_wo0_mtree_mult1_1_result_add_0_0_BitSelect_for_a_b : STD_LOGIC_VECTOR (48 downto 0);
    signal u0_m0_wo0_mtree_mult1_1_result_add_0_0_BitSelect_for_a_c : STD_LOGIC_VECTOR (5 downto 0);
    signal u0_m0_wo0_mtree_mult1_1_result_add_0_0_UpperBits_for_b_q : STD_LOGIC_VECTOR (4 downto 0);
    signal u0_m0_wo0_mtree_mult1_1_result_add_1_0_UpperBits_for_b_q : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_result_add_0_0_BitSelect_for_a_b : STD_LOGIC_VECTOR (48 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_result_add_0_0_BitSelect_for_a_c : STD_LOGIC_VECTOR (5 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_result_add_0_0_UpperBits_for_b_q : STD_LOGIC_VECTOR (4 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_result_add_1_0_UpperBits_for_b_q : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_mtree_mult1_1_result_add_0_0_BitExpansion_for_b_q : STD_LOGIC_VECTOR (54 downto 0);
    signal u0_m0_wo0_mtree_mult1_1_result_add_1_0_BitExpansion_for_b_q : STD_LOGIC_VECTOR (55 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_result_add_0_0_BitExpansion_for_b_q : STD_LOGIC_VECTOR (54 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_result_add_1_0_BitExpansion_for_b_q : STD_LOGIC_VECTOR (55 downto 0);
    signal u0_m0_wo0_mtree_mult1_1_result_add_0_0_BitSelect_for_b_b : STD_LOGIC_VECTOR (48 downto 0);
    signal u0_m0_wo0_mtree_mult1_1_result_add_0_0_BitSelect_for_b_c : STD_LOGIC_VECTOR (5 downto 0);
    signal u0_m0_wo0_mtree_mult1_1_result_add_1_0_BitSelect_for_b_b : STD_LOGIC_VECTOR (48 downto 0);
    signal u0_m0_wo0_mtree_mult1_1_result_add_1_0_BitSelect_for_b_c : STD_LOGIC_VECTOR (6 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_result_add_0_0_BitSelect_for_b_b : STD_LOGIC_VECTOR (48 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_result_add_0_0_BitSelect_for_b_c : STD_LOGIC_VECTOR (5 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_result_add_1_0_BitSelect_for_b_b : STD_LOGIC_VECTOR (48 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_result_add_1_0_BitSelect_for_b_c : STD_LOGIC_VECTOR (6 downto 0);

begin


    -- GND(CONSTANT,0)@0
    GND_q <= "0";

    -- VCC(CONSTANT,1)@0
    VCC_q <= "1";

    -- input_valid(LOGICAL,3)@10
    input_valid_q <= xIn_v and enable_i;

    -- d_in0_m0_wi0_wo0_assign_id1_q_11(DELAY,234)@10 + 1
    d_in0_m0_wi0_wo0_assign_id1_q_11 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => input_valid_q, xout => d_in0_m0_wi0_wo0_assign_id1_q_11_q, clk => clk, aclr => areset );

    -- u0_m0_wo0_inputframe_seq(SEQUENCE,14)@10 + 1
    u0_m0_wo0_inputframe_seq_clkproc: PROCESS (clk, areset)
        variable u0_m0_wo0_inputframe_seq_c : SIGNED(4 downto 0);
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_inputframe_seq_c := "00011";
            u0_m0_wo0_inputframe_seq_q <= "0";
            u0_m0_wo0_inputframe_seq_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (input_valid_q = "1") THEN
                IF (u0_m0_wo0_inputframe_seq_c = "00000") THEN
                    u0_m0_wo0_inputframe_seq_eq <= '1';
                ELSE
                    u0_m0_wo0_inputframe_seq_eq <= '0';
                END IF;
                IF (u0_m0_wo0_inputframe_seq_eq = '1') THEN
                    u0_m0_wo0_inputframe_seq_c := u0_m0_wo0_inputframe_seq_c + 3;
                ELSE
                    u0_m0_wo0_inputframe_seq_c := u0_m0_wo0_inputframe_seq_c - 1;
                END IF;
                u0_m0_wo0_inputframe_seq_q <= STD_LOGIC_VECTOR(u0_m0_wo0_inputframe_seq_c(4 downto 4));
            END IF;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_inputframe(LOGICAL,15)@11
    u0_m0_wo0_inputframe_q <= u0_m0_wo0_inputframe_seq_q and d_in0_m0_wi0_wo0_assign_id1_q_11_q;

    -- u0_m0_wo0_run(ENABLEGENERATOR,16)@11 + 2
    u0_m0_wo0_run_ctrl <= u0_m0_wo0_run_out & u0_m0_wo0_inputframe_q & u0_m0_wo0_run_enableQ;
    u0_m0_wo0_run_clkproc: PROCESS (clk, areset)
        variable u0_m0_wo0_run_enable_c : SIGNED(9 downto 0);
        variable u0_m0_wo0_run_inc : SIGNED(2 downto 0);
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_run_q <= "0";
            u0_m0_wo0_run_enable_c := TO_SIGNED(258, 10);
            u0_m0_wo0_run_enableQ <= "0";
            u0_m0_wo0_run_count <= "000";
            u0_m0_wo0_run_inc := (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_run_out = "1") THEN
                IF (u0_m0_wo0_run_enable_c(9) = '1') THEN
                    u0_m0_wo0_run_enable_c := u0_m0_wo0_run_enable_c - (-259);
                ELSE
                    u0_m0_wo0_run_enable_c := u0_m0_wo0_run_enable_c + (-1);
                END IF;
                u0_m0_wo0_run_enableQ <= STD_LOGIC_VECTOR(u0_m0_wo0_run_enable_c(9 downto 9));
            ELSE
                u0_m0_wo0_run_enableQ <= "0";
            END IF;
            CASE (u0_m0_wo0_run_ctrl) IS
                WHEN "000" | "001" => u0_m0_wo0_run_inc := "000";
                WHEN "010" | "011" => u0_m0_wo0_run_inc := "111";
                WHEN "100" => u0_m0_wo0_run_inc := "000";
                WHEN "101" => u0_m0_wo0_run_inc := "010";
                WHEN "110" => u0_m0_wo0_run_inc := "111";
                WHEN "111" => u0_m0_wo0_run_inc := "001";
                WHEN OTHERS => 
            END CASE;
            u0_m0_wo0_run_count <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_run_count) + SIGNED(u0_m0_wo0_run_inc));
            u0_m0_wo0_run_q <= u0_m0_wo0_run_out;
        END IF;
    END PROCESS;
    u0_m0_wo0_run_preEnaQ <= u0_m0_wo0_run_count(2 downto 2);
    u0_m0_wo0_run_out <= u0_m0_wo0_run_preEnaQ and VCC_q;

    -- u0_m0_wo0_memread(DELAY,17)@13
    u0_m0_wo0_memread : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_run_q, xout => u0_m0_wo0_memread_q, clk => clk, aclr => areset );

    -- d_u0_m0_wo0_memread_q_14(DELAY,236)@13 + 1
    d_u0_m0_wo0_memread_q_14 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_memread_q, xout => d_u0_m0_wo0_memread_q_14_q, clk => clk, aclr => areset );

    -- u0_m0_wo0_compute(DELAY,19)@14
    u0_m0_wo0_compute : dspba_delay
    GENERIC MAP ( width => 1, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => d_u0_m0_wo0_memread_q_14_q, xout => u0_m0_wo0_compute_q, clk => clk, aclr => areset );

    -- d_u0_m0_wo0_compute_q_15(DELAY,240)@14 + 1
    d_u0_m0_wo0_compute_q_15 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_compute_q, xout => d_u0_m0_wo0_compute_q_15_q, clk => clk, aclr => areset );

    -- d_u0_m0_wo0_compute_q_20(DELAY,241)@15 + 5
    d_u0_m0_wo0_compute_q_20 : dspba_delay
    GENERIC MAP ( width => 1, depth => 5, reset_kind => "ASYNC" )
    PORT MAP ( xin => d_u0_m0_wo0_compute_q_15_q, xout => d_u0_m0_wo0_compute_q_20_q, clk => clk, aclr => areset );

    -- u0_m0_wo0_aseq(SEQUENCE,51)@20 + 1
    u0_m0_wo0_aseq_clkproc: PROCESS (clk, areset)
        variable u0_m0_wo0_aseq_c : SIGNED(10 downto 0);
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_aseq_c := "00000000000";
            u0_m0_wo0_aseq_q <= "0";
            u0_m0_wo0_aseq_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (d_u0_m0_wo0_compute_q_20_q = "1") THEN
                IF (u0_m0_wo0_aseq_c = "11111111101") THEN
                    u0_m0_wo0_aseq_eq <= '1';
                ELSE
                    u0_m0_wo0_aseq_eq <= '0';
                END IF;
                IF (u0_m0_wo0_aseq_eq = '1') THEN
                    u0_m0_wo0_aseq_c := u0_m0_wo0_aseq_c + 259;
                ELSE
                    u0_m0_wo0_aseq_c := u0_m0_wo0_aseq_c - 1;
                END IF;
                u0_m0_wo0_aseq_q <= STD_LOGIC_VECTOR(u0_m0_wo0_aseq_c(10 downto 10));
            END IF;
        END IF;
    END PROCESS;

    -- d_u0_m0_wo0_compute_q_21(DELAY,242)@20 + 1
    d_u0_m0_wo0_compute_q_21 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => d_u0_m0_wo0_compute_q_20_q, xout => d_u0_m0_wo0_compute_q_21_q, clk => clk, aclr => areset );

    -- d_u0_m0_wo0_memread_q_15(DELAY,237)@14 + 1
    d_u0_m0_wo0_memread_q_15 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => d_u0_m0_wo0_memread_q_14_q, xout => d_u0_m0_wo0_memread_q_15_q, clk => clk, aclr => areset );

    -- d_u0_m0_wo0_memread_q_21(DELAY,238)@15 + 6
    d_u0_m0_wo0_memread_q_21 : dspba_delay
    GENERIC MAP ( width => 1, depth => 6, reset_kind => "ASYNC" )
    PORT MAP ( xin => d_u0_m0_wo0_memread_q_15_q, xout => d_u0_m0_wo0_memread_q_21_q, clk => clk, aclr => areset );

    -- u0_m0_wo0_adelay_p0(DELAY,179)@21
    u0_m0_wo0_adelay_p0 : dspba_delay
    GENERIC MAP ( width => 49, depth => 3, reset_kind => "NONE" )
    PORT MAP ( xin => u0_m0_wo0_accum_p1_of_2_q, xout => u0_m0_wo0_adelay_p0_q, ena => d_u0_m0_wo0_compute_q_21_q(0), clk => clk, aclr => areset );

    -- u0_m0_wo0_mtree_mult1_1_result_add_1_0_SignBit_for_b(BITSELECT,149)@19
    u0_m0_wo0_mtree_mult1_1_result_add_1_0_SignBit_for_b_b <= STD_LOGIC_VECTOR(u0_m0_wo0_mtree_mult1_1_align_17_q(39 downto 39));

    -- u0_m0_wo0_mtree_mult1_1_result_add_1_0_UpperBits_for_b(BITJOIN,150)@19
    u0_m0_wo0_mtree_mult1_1_result_add_1_0_UpperBits_for_b_q <= u0_m0_wo0_mtree_mult1_1_result_add_1_0_SignBit_for_b_b & u0_m0_wo0_mtree_mult1_1_result_add_1_0_SignBit_for_b_b & u0_m0_wo0_mtree_mult1_1_result_add_1_0_SignBit_for_b_b & u0_m0_wo0_mtree_mult1_1_result_add_1_0_SignBit_for_b_b & u0_m0_wo0_mtree_mult1_1_result_add_1_0_SignBit_for_b_b & u0_m0_wo0_mtree_mult1_1_result_add_1_0_SignBit_for_b_b & u0_m0_wo0_mtree_mult1_1_result_add_1_0_SignBit_for_b_b & u0_m0_wo0_mtree_mult1_1_result_add_1_0_SignBit_for_b_b & u0_m0_wo0_mtree_mult1_1_result_add_1_0_SignBit_for_b_b & u0_m0_wo0_mtree_mult1_1_result_add_1_0_SignBit_for_b_b & u0_m0_wo0_mtree_mult1_1_result_add_1_0_SignBit_for_b_b & u0_m0_wo0_mtree_mult1_1_result_add_1_0_SignBit_for_b_b & u0_m0_wo0_mtree_mult1_1_result_add_1_0_SignBit_for_b_b & u0_m0_wo0_mtree_mult1_1_result_add_1_0_SignBit_for_b_b & u0_m0_wo0_mtree_mult1_1_result_add_1_0_SignBit_for_b_b & u0_m0_wo0_mtree_mult1_1_result_add_1_0_SignBit_for_b_b;

    -- u0_m0_wo0_ca1_inner(COUNTER,39)@14
    -- low=-1, high=2, step=-1, init=2
    u0_m0_wo0_ca1_inner_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_ca1_inner_i <= TO_SIGNED(2, 3);
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_compute_q = "1") THEN
                IF (u0_m0_wo0_ca1_inner_i(2 downto 2) = "1") THEN
                    u0_m0_wo0_ca1_inner_i <= u0_m0_wo0_ca1_inner_i - 5;
                ELSE
                    u0_m0_wo0_ca1_inner_i <= u0_m0_wo0_ca1_inner_i - 1;
                END IF;
            END IF;
        END IF;
    END PROCESS;
    u0_m0_wo0_ca1_inner_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(u0_m0_wo0_ca1_inner_i, 3)));

    -- u0_m0_wo0_ca1_run(LOGICAL,40)@14
    u0_m0_wo0_ca1_run_q <= STD_LOGIC_VECTOR(u0_m0_wo0_ca1_inner_q(2 downto 2));

    -- u0_m0_wo0_ca1(COUNTER,41)@14
    -- low=0, high=64, step=1, init=0
    u0_m0_wo0_ca1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_ca1_i <= TO_UNSIGNED(0, 7);
            u0_m0_wo0_ca1_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_compute_q = "1" and u0_m0_wo0_ca1_run_q = "1") THEN
                IF (u0_m0_wo0_ca1_i = TO_UNSIGNED(63, 7)) THEN
                    u0_m0_wo0_ca1_eq <= '1';
                ELSE
                    u0_m0_wo0_ca1_eq <= '0';
                END IF;
                IF (u0_m0_wo0_ca1_eq = '1') THEN
                    u0_m0_wo0_ca1_i <= u0_m0_wo0_ca1_i + 64;
                ELSE
                    u0_m0_wo0_ca1_i <= u0_m0_wo0_ca1_i + 1;
                END IF;
            END IF;
        END IF;
    END PROCESS;
    u0_m0_wo0_ca1_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(u0_m0_wo0_ca1_i, 7)));

    -- u0_m0_wo0_cm0_lutmem(DUALMEM,64)@14 + 2
    u0_m0_wo0_cm0_lutmem_aa <= u0_m0_wo0_ca1_q;
    u0_m0_wo0_cm0_lutmem_reset0 <= areset;
    u0_m0_wo0_cm0_lutmem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "M9K",
        operation_mode => "ROM",
        width_a => 22,
        widthad_a => 7,
        numwords_a => 65,
        lpm_type => "altsyncram",
        width_byteena_a => 1,
        outdata_reg_a => "CLOCK0",
        outdata_aclr_a => "CLEAR0",
        clock_enable_input_a => "NORMAL",
        power_up_uninitialized => "FALSE",
        init_file => "rx_ciccomp_0002_rtl_core_u0_m0_wo0_cm0_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "Cyclone IV E"
    )
    PORT MAP (
        clocken0 => '1',
        aclr0 => u0_m0_wo0_cm0_lutmem_reset0,
        clock0 => clk,
        address_a => u0_m0_wo0_cm0_lutmem_aa,
        q_a => u0_m0_wo0_cm0_lutmem_ir
    );
    u0_m0_wo0_cm0_lutmem_r <= u0_m0_wo0_cm0_lutmem_ir(21 downto 0);

    -- u0_m0_wo0_mtree_mult1_1_bs8(BITSELECT,74)@16
    u0_m0_wo0_mtree_mult1_1_bs8_b <= STD_LOGIC_VECTOR(u0_m0_wo0_cm0_lutmem_r(21 downto 17));

    -- d_u0_m0_wo0_mtree_mult1_1_bs8_b_17(DELAY,248)@16 + 1
    d_u0_m0_wo0_mtree_mult1_1_bs8_b_17 : dspba_delay
    GENERIC MAP ( width => 5, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_mtree_mult1_1_bs8_b, xout => d_u0_m0_wo0_mtree_mult1_1_bs8_b_17_q, clk => clk, aclr => areset );

    -- u0_m0_wo0_wi0_r0_ra1_count2_inner(COUNTER,28)@13
    -- low=-1, high=2, step=-1, init=1
    u0_m0_wo0_wi0_r0_ra1_count2_inner_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_wi0_r0_ra1_count2_inner_i <= TO_SIGNED(1, 3);
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_memread_q = "1") THEN
                IF (u0_m0_wo0_wi0_r0_ra1_count2_inner_i(2 downto 2) = "1") THEN
                    u0_m0_wo0_wi0_r0_ra1_count2_inner_i <= u0_m0_wo0_wi0_r0_ra1_count2_inner_i - 5;
                ELSE
                    u0_m0_wo0_wi0_r0_ra1_count2_inner_i <= u0_m0_wo0_wi0_r0_ra1_count2_inner_i - 1;
                END IF;
            END IF;
        END IF;
    END PROCESS;
    u0_m0_wo0_wi0_r0_ra1_count2_inner_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(u0_m0_wo0_wi0_r0_ra1_count2_inner_i, 3)));

    -- u0_m0_wo0_wi0_r0_ra1_count2_run(LOGICAL,29)@13
    u0_m0_wo0_wi0_r0_ra1_count2_run_q <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_ra1_count2_inner_q(2 downto 2));

    -- u0_m0_wo0_wi0_r0_ra1_count2(COUNTER,30)@13
    -- low=0, high=64, step=1, init=0
    u0_m0_wo0_wi0_r0_ra1_count2_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_wi0_r0_ra1_count2_i <= TO_UNSIGNED(0, 7);
            u0_m0_wo0_wi0_r0_ra1_count2_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_memread_q = "1" and u0_m0_wo0_wi0_r0_ra1_count2_run_q = "1") THEN
                IF (u0_m0_wo0_wi0_r0_ra1_count2_i = TO_UNSIGNED(63, 7)) THEN
                    u0_m0_wo0_wi0_r0_ra1_count2_eq <= '1';
                ELSE
                    u0_m0_wo0_wi0_r0_ra1_count2_eq <= '0';
                END IF;
                IF (u0_m0_wo0_wi0_r0_ra1_count2_eq = '1') THEN
                    u0_m0_wo0_wi0_r0_ra1_count2_i <= u0_m0_wo0_wi0_r0_ra1_count2_i + 64;
                ELSE
                    u0_m0_wo0_wi0_r0_ra1_count2_i <= u0_m0_wo0_wi0_r0_ra1_count2_i + 1;
                END IF;
            END IF;
        END IF;
    END PROCESS;
    u0_m0_wo0_wi0_r0_ra1_count2_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(u0_m0_wo0_wi0_r0_ra1_count2_i, 7)));

    -- u0_m0_wo0_wi0_r0_ra1_count2_lut_lutmem(DUALMEM,62)@13 + 2
    u0_m0_wo0_wi0_r0_ra1_count2_lut_lutmem_aa <= u0_m0_wo0_wi0_r0_ra1_count2_q;
    u0_m0_wo0_wi0_r0_ra1_count2_lut_lutmem_reset0 <= areset;
    u0_m0_wo0_wi0_r0_ra1_count2_lut_lutmem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "M9K",
        operation_mode => "ROM",
        width_a => 10,
        widthad_a => 7,
        numwords_a => 65,
        lpm_type => "altsyncram",
        width_byteena_a => 1,
        outdata_reg_a => "CLOCK0",
        outdata_aclr_a => "CLEAR0",
        clock_enable_input_a => "NORMAL",
        power_up_uninitialized => "FALSE",
        init_file => "rx_ciccomp_0002_rtl_core_u0_m0_wo0_wi0_r0_ra1_count2_lut_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "Cyclone IV E"
    )
    PORT MAP (
        clocken0 => '1',
        aclr0 => u0_m0_wo0_wi0_r0_ra1_count2_lut_lutmem_reset0,
        clock0 => clk,
        address_a => u0_m0_wo0_wi0_r0_ra1_count2_lut_lutmem_aa,
        q_a => u0_m0_wo0_wi0_r0_ra1_count2_lut_lutmem_ir
    );
    u0_m0_wo0_wi0_r0_ra1_count2_lut_lutmem_r <= u0_m0_wo0_wi0_r0_ra1_count2_lut_lutmem_ir(9 downto 0);

    -- u0_m0_wo0_wi0_r0_ra1_count2_lutreg(REG,27)@15
    u0_m0_wo0_wi0_r0_ra1_count2_lutreg_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_wi0_r0_ra1_count2_lutreg_q <= "0100011100";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (d_u0_m0_wo0_memread_q_15_q = "1") THEN
                u0_m0_wo0_wi0_r0_ra1_count2_lutreg_q <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_ra1_count2_lut_lutmem_r);
            END IF;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_wi0_r0_ra1_count0_inner(COUNTER,22)@15
    -- low=-1, high=258, step=-1, init=258
    u0_m0_wo0_wi0_r0_ra1_count0_inner_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_wi0_r0_ra1_count0_inner_i <= TO_SIGNED(258, 10);
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (d_u0_m0_wo0_memread_q_15_q = "1") THEN
                IF (u0_m0_wo0_wi0_r0_ra1_count0_inner_i(9 downto 9) = "1") THEN
                    u0_m0_wo0_wi0_r0_ra1_count0_inner_i <= u0_m0_wo0_wi0_r0_ra1_count0_inner_i - 765;
                ELSE
                    u0_m0_wo0_wi0_r0_ra1_count0_inner_i <= u0_m0_wo0_wi0_r0_ra1_count0_inner_i - 1;
                END IF;
            END IF;
        END IF;
    END PROCESS;
    u0_m0_wo0_wi0_r0_ra1_count0_inner_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(u0_m0_wo0_wi0_r0_ra1_count0_inner_i, 10)));

    -- u0_m0_wo0_wi0_r0_ra1_count0_run(LOGICAL,23)@15
    u0_m0_wo0_wi0_r0_ra1_count0_run_q <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_ra1_count0_inner_q(9 downto 9));

    -- u0_m0_wo0_wi0_r0_ra1_count0(COUNTER,24)@15
    -- low=0, high=511, step=8, init=0
    u0_m0_wo0_wi0_r0_ra1_count0_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_wi0_r0_ra1_count0_i <= TO_UNSIGNED(0, 9);
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (d_u0_m0_wo0_memread_q_15_q = "1" and u0_m0_wo0_wi0_r0_ra1_count0_run_q = "1") THEN
                u0_m0_wo0_wi0_r0_ra1_count0_i <= u0_m0_wo0_wi0_r0_ra1_count0_i + 8;
            END IF;
        END IF;
    END PROCESS;
    u0_m0_wo0_wi0_r0_ra1_count0_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(u0_m0_wo0_wi0_r0_ra1_count0_i, 10)));

    -- u0_m0_wo0_wi0_r0_ra1_add_0_0_replace_or_BitSelect_for_a(BITSELECT,108)@15
    u0_m0_wo0_wi0_r0_ra1_add_0_0_replace_or_BitSelect_for_a_in <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((10 downto 10 => u0_m0_wo0_wi0_r0_ra1_count0_q(9)) & u0_m0_wo0_wi0_r0_ra1_count0_q));
    u0_m0_wo0_wi0_r0_ra1_add_0_0_replace_or_BitSelect_for_a_b <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_ra1_add_0_0_replace_or_BitSelect_for_a_in(8 downto 3));

    -- u0_m0_wo0_wi0_r0_ra1_count1(COUNTER,25)@15
    -- low=0, high=3, step=1, init=0
    u0_m0_wo0_wi0_r0_ra1_count1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_wi0_r0_ra1_count1_i <= TO_UNSIGNED(0, 2);
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (d_u0_m0_wo0_memread_q_15_q = "1") THEN
                u0_m0_wo0_wi0_r0_ra1_count1_i <= u0_m0_wo0_wi0_r0_ra1_count1_i + 1;
            END IF;
        END IF;
    END PROCESS;
    u0_m0_wo0_wi0_r0_ra1_count1_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(u0_m0_wo0_wi0_r0_ra1_count1_i, 3)));

    -- u0_m0_wo0_wi0_r0_ra1_add_0_0_replace_or_BitSelect_for_b(BITSELECT,109)@15
    u0_m0_wo0_wi0_r0_ra1_add_0_0_replace_or_BitSelect_for_b_in <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((10 downto 3 => u0_m0_wo0_wi0_r0_ra1_count1_q(2)) & u0_m0_wo0_wi0_r0_ra1_count1_q));
    u0_m0_wo0_wi0_r0_ra1_add_0_0_replace_or_BitSelect_for_b_b <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_ra1_add_0_0_replace_or_BitSelect_for_b_in(1 downto 0));

    -- u0_m0_wo0_wi0_r0_ra1_add_0_0_replace_or_join(BITJOIN,110)@15
    u0_m0_wo0_wi0_r0_ra1_add_0_0_replace_or_join_q <= GND_q & GND_q & u0_m0_wo0_wi0_r0_ra1_add_0_0_replace_or_BitSelect_for_a_b & GND_q & u0_m0_wo0_wi0_r0_ra1_add_0_0_replace_or_BitSelect_for_b_b;

    -- u0_m0_wo0_wi0_r0_ra1_add_1_0(ADD,32)@15 + 1
    u0_m0_wo0_wi0_r0_ra1_add_1_0_a <= STD_LOGIC_VECTOR("0" & u0_m0_wo0_wi0_r0_ra1_add_0_0_replace_or_join_q);
    u0_m0_wo0_wi0_r0_ra1_add_1_0_b <= STD_LOGIC_VECTOR("00" & u0_m0_wo0_wi0_r0_ra1_count2_lutreg_q);
    u0_m0_wo0_wi0_r0_ra1_add_1_0_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_wi0_r0_ra1_add_1_0_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_wi0_r0_ra1_add_1_0_o <= STD_LOGIC_VECTOR(UNSIGNED(u0_m0_wo0_wi0_r0_ra1_add_1_0_a) + UNSIGNED(u0_m0_wo0_wi0_r0_ra1_add_1_0_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_wi0_r0_ra1_add_1_0_q <= u0_m0_wo0_wi0_r0_ra1_add_1_0_o(11 downto 0);

    -- u0_m0_wo0_wi0_r0_ra1_resize(BITSELECT,33)@16
    u0_m0_wo0_wi0_r0_ra1_resize_in <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_ra1_add_1_0_q(8 downto 0));
    u0_m0_wo0_wi0_r0_ra1_resize_b <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_ra1_resize_in(8 downto 0));

    -- d_xIn_0_16_notEnable(LOGICAL,263)@10
    d_xIn_0_16_notEnable_q <= STD_LOGIC_VECTOR(not (VCC_q));

    -- d_xIn_0_16_nor(LOGICAL,264)@10
    d_xIn_0_16_nor_q <= not (d_xIn_0_16_notEnable_q or d_xIn_0_16_sticky_ena_q);

    -- d_xIn_0_16_mem_last(CONSTANT,260)
    d_xIn_0_16_mem_last_q <= "011";

    -- d_xIn_0_16_cmp(LOGICAL,261)@10
    d_xIn_0_16_cmp_q <= "1" WHEN d_xIn_0_16_mem_last_q = d_xIn_0_16_rdcnt_q ELSE "0";

    -- d_xIn_0_16_cmpReg(REG,262)@10 + 1
    d_xIn_0_16_cmpReg_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            d_xIn_0_16_cmpReg_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            d_xIn_0_16_cmpReg_q <= STD_LOGIC_VECTOR(d_xIn_0_16_cmp_q);
        END IF;
    END PROCESS;

    -- d_xIn_0_16_sticky_ena(REG,265)@10 + 1
    d_xIn_0_16_sticky_ena_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            d_xIn_0_16_sticky_ena_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (d_xIn_0_16_nor_q = "1") THEN
                d_xIn_0_16_sticky_ena_q <= STD_LOGIC_VECTOR(d_xIn_0_16_cmpReg_q);
            END IF;
        END IF;
    END PROCESS;

    -- d_xIn_0_16_enaAnd(LOGICAL,266)@10
    d_xIn_0_16_enaAnd_q <= d_xIn_0_16_sticky_ena_q and VCC_q;

    -- d_xIn_0_16_rdcnt(COUNTER,258)@10 + 1
    -- low=0, high=4, step=1, init=0
    d_xIn_0_16_rdcnt_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            d_xIn_0_16_rdcnt_i <= TO_UNSIGNED(0, 3);
            d_xIn_0_16_rdcnt_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (d_xIn_0_16_rdcnt_i = TO_UNSIGNED(3, 3)) THEN
                d_xIn_0_16_rdcnt_eq <= '1';
            ELSE
                d_xIn_0_16_rdcnt_eq <= '0';
            END IF;
            IF (d_xIn_0_16_rdcnt_eq = '1') THEN
                d_xIn_0_16_rdcnt_i <= d_xIn_0_16_rdcnt_i + 4;
            ELSE
                d_xIn_0_16_rdcnt_i <= d_xIn_0_16_rdcnt_i + 1;
            END IF;
        END IF;
    END PROCESS;
    d_xIn_0_16_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(d_xIn_0_16_rdcnt_i, 3)));

    -- d_xIn_0_16_wraddr(REG,259)@10 + 1
    d_xIn_0_16_wraddr_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            d_xIn_0_16_wraddr_q <= "100";
        ELSIF (clk'EVENT AND clk = '1') THEN
            d_xIn_0_16_wraddr_q <= STD_LOGIC_VECTOR(d_xIn_0_16_rdcnt_q);
        END IF;
    END PROCESS;

    -- d_xIn_0_16_mem(DUALMEM,257)@10 + 2
    d_xIn_0_16_mem_ia <= STD_LOGIC_VECTOR(xIn_0);
    d_xIn_0_16_mem_aa <= d_xIn_0_16_wraddr_q;
    d_xIn_0_16_mem_ab <= d_xIn_0_16_rdcnt_q;
    d_xIn_0_16_mem_reset0 <= areset;
    d_xIn_0_16_mem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "M9K",
        operation_mode => "DUAL_PORT",
        width_a => 32,
        widthad_a => 3,
        numwords_a => 5,
        width_b => 32,
        widthad_b => 3,
        numwords_b => 5,
        lpm_type => "altsyncram",
        width_byteena_a => 1,
        address_reg_b => "CLOCK0",
        indata_reg_b => "CLOCK0",
        wrcontrol_wraddress_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK1",
        outdata_aclr_b => "CLEAR1",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "TRUE",
        intended_device_family => "Cyclone IV E"
    )
    PORT MAP (
        clocken1 => d_xIn_0_16_enaAnd_q(0),
        clocken0 => VCC_q(0),
        clock0 => clk,
        aclr1 => d_xIn_0_16_mem_reset0,
        clock1 => clk,
        address_a => d_xIn_0_16_mem_aa,
        data_a => d_xIn_0_16_mem_ia,
        wren_a => VCC_q(0),
        address_b => d_xIn_0_16_mem_ab,
        q_b => d_xIn_0_16_mem_iq
    );
    d_xIn_0_16_mem_q <= d_xIn_0_16_mem_iq(31 downto 0);

    -- d_in0_m0_wi0_wo0_assign_id1_q_16(DELAY,235)@11 + 5
    d_in0_m0_wi0_wo0_assign_id1_q_16 : dspba_delay
    GENERIC MAP ( width => 1, depth => 5, reset_kind => "ASYNC" )
    PORT MAP ( xin => d_in0_m0_wi0_wo0_assign_id1_q_11_q, xout => d_in0_m0_wi0_wo0_assign_id1_q_16_q, clk => clk, aclr => areset );

    -- u0_m0_wo0_wi0_r0_wa0(COUNTER,35)@16
    -- low=0, high=511, step=1, init=28
    u0_m0_wo0_wi0_r0_wa0_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_wi0_r0_wa0_i <= TO_UNSIGNED(28, 9);
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (d_in0_m0_wi0_wo0_assign_id1_q_16_q = "1") THEN
                u0_m0_wo0_wi0_r0_wa0_i <= u0_m0_wo0_wi0_r0_wa0_i + 1;
            END IF;
        END IF;
    END PROCESS;
    u0_m0_wo0_wi0_r0_wa0_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(u0_m0_wo0_wi0_r0_wa0_i, 9)));

    -- u0_m0_wo0_wi0_r0_memr0(DUALMEM,37)@16
    u0_m0_wo0_wi0_r0_memr0_ia <= STD_LOGIC_VECTOR(d_xIn_0_16_mem_q);
    u0_m0_wo0_wi0_r0_memr0_aa <= u0_m0_wo0_wi0_r0_wa0_q;
    u0_m0_wo0_wi0_r0_memr0_ab <= u0_m0_wo0_wi0_r0_ra1_resize_b;
    u0_m0_wo0_wi0_r0_memr0_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "M9K",
        operation_mode => "DUAL_PORT",
        width_a => 32,
        widthad_a => 9,
        numwords_a => 512,
        width_b => 32,
        widthad_b => 9,
        numwords_b => 512,
        lpm_type => "altsyncram",
        width_byteena_a => 1,
        address_reg_b => "CLOCK0",
        indata_reg_b => "CLOCK0",
        wrcontrol_wraddress_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK0",
        outdata_aclr_b => "NONE",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "FALSE",
        init_file => "UNUSED",
        intended_device_family => "Cyclone IV E"
    )
    PORT MAP (
        clocken0 => '1',
        clock0 => clk,
        address_a => u0_m0_wo0_wi0_r0_memr0_aa,
        data_a => u0_m0_wo0_wi0_r0_memr0_ia,
        wren_a => d_in0_m0_wi0_wo0_assign_id1_q_16_q(0),
        address_b => u0_m0_wo0_wi0_r0_memr0_ab,
        q_b => u0_m0_wo0_wi0_r0_memr0_iq
    );
    u0_m0_wo0_wi0_r0_memr0_q <= u0_m0_wo0_wi0_r0_memr0_iq(31 downto 0);

    -- d_u0_m0_wo0_wi0_r0_memr0_q_17(DELAY,244)@16 + 1
    d_u0_m0_wo0_wi0_r0_memr0_q_17 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_memr0_q, xout => d_u0_m0_wo0_wi0_r0_memr0_q_17_q, clk => clk, aclr => areset );

    -- u0_m0_wo0_mtree_mult1_1_bs9(BITSELECT,75)@17
    u0_m0_wo0_mtree_mult1_1_bs9_in <= STD_LOGIC_VECTOR(d_u0_m0_wo0_wi0_r0_memr0_q_17_q(16 downto 0));
    u0_m0_wo0_mtree_mult1_1_bs9_b <= STD_LOGIC_VECTOR(u0_m0_wo0_mtree_mult1_1_bs9_in(16 downto 0));

    -- u0_m0_wo0_mtree_mult1_1_bjB10(BITJOIN,76)@17
    u0_m0_wo0_mtree_mult1_1_bjB10_q <= GND_q & u0_m0_wo0_mtree_mult1_1_bs9_b;

    -- u0_m0_wo0_mtree_mult1_1_im7(MULT,73)@17 + 2
    u0_m0_wo0_mtree_mult1_1_im7_a0 <= STD_LOGIC_VECTOR(u0_m0_wo0_mtree_mult1_1_bjB10_q);
    u0_m0_wo0_mtree_mult1_1_im7_b0 <= STD_LOGIC_VECTOR(d_u0_m0_wo0_mtree_mult1_1_bs8_b_17_q);
    u0_m0_wo0_mtree_mult1_1_im7_reset <= areset;
    u0_m0_wo0_mtree_mult1_1_im7_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 18,
        lpm_widthb => 5,
        lpm_widthp => 23,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "SIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => u0_m0_wo0_mtree_mult1_1_im7_a0,
        datab => u0_m0_wo0_mtree_mult1_1_im7_b0,
        clken => VCC_q(0),
        aclr => u0_m0_wo0_mtree_mult1_1_im7_reset,
        clock => clk,
        result => u0_m0_wo0_mtree_mult1_1_im7_s1
    );
    u0_m0_wo0_mtree_mult1_1_im7_q <= u0_m0_wo0_mtree_mult1_1_im7_s1;

    -- u0_m0_wo0_mtree_mult1_1_align_17(BITSHIFT,83)@19
    u0_m0_wo0_mtree_mult1_1_align_17_qint <= u0_m0_wo0_mtree_mult1_1_im7_q & "00000000000000000";
    u0_m0_wo0_mtree_mult1_1_align_17_q <= u0_m0_wo0_mtree_mult1_1_align_17_qint(39 downto 0);

    -- u0_m0_wo0_mtree_mult1_1_result_add_1_0_BitExpansion_for_b(BITJOIN,148)@19
    u0_m0_wo0_mtree_mult1_1_result_add_1_0_BitExpansion_for_b_q <= u0_m0_wo0_mtree_mult1_1_result_add_1_0_UpperBits_for_b_q & u0_m0_wo0_mtree_mult1_1_align_17_q;

    -- u0_m0_wo0_mtree_mult1_1_result_add_1_0_BitSelect_for_b(BITSELECT,152)@19
    u0_m0_wo0_mtree_mult1_1_result_add_1_0_BitSelect_for_b_b <= STD_LOGIC_VECTOR(u0_m0_wo0_mtree_mult1_1_result_add_1_0_BitExpansion_for_b_q(48 downto 0));
    u0_m0_wo0_mtree_mult1_1_result_add_1_0_BitSelect_for_b_c <= STD_LOGIC_VECTOR(u0_m0_wo0_mtree_mult1_1_result_add_1_0_BitExpansion_for_b_q(55 downto 49));

    -- u0_m0_wo0_mtree_mult1_1_result_add_0_0_SignBit_for_b(BITSELECT,138)@18
    u0_m0_wo0_mtree_mult1_1_result_add_0_0_SignBit_for_b_b <= STD_LOGIC_VECTOR(u0_m0_wo0_mtree_mult1_1_align_15_q(49 downto 49));

    -- u0_m0_wo0_mtree_mult1_1_result_add_0_0_UpperBits_for_b(BITJOIN,139)@18
    u0_m0_wo0_mtree_mult1_1_result_add_0_0_UpperBits_for_b_q <= u0_m0_wo0_mtree_mult1_1_result_add_0_0_SignBit_for_b_b & u0_m0_wo0_mtree_mult1_1_result_add_0_0_SignBit_for_b_b & u0_m0_wo0_mtree_mult1_1_result_add_0_0_SignBit_for_b_b & u0_m0_wo0_mtree_mult1_1_result_add_0_0_SignBit_for_b_b & u0_m0_wo0_mtree_mult1_1_result_add_0_0_SignBit_for_b_b;

    -- u0_m0_wo0_mtree_mult1_1_bs6(BITSELECT,72)@16
    u0_m0_wo0_mtree_mult1_1_bs6_b <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_memr0_q(31 downto 17));

    -- u0_m0_wo0_mtree_mult1_1_bs4(BITSELECT,70)@16
    u0_m0_wo0_mtree_mult1_1_bs4_in <= STD_LOGIC_VECTOR(u0_m0_wo0_cm0_lutmem_r(16 downto 0));
    u0_m0_wo0_mtree_mult1_1_bs4_b <= STD_LOGIC_VECTOR(u0_m0_wo0_mtree_mult1_1_bs4_in(16 downto 0));

    -- u0_m0_wo0_mtree_mult1_1_bjA5(BITJOIN,71)@16
    u0_m0_wo0_mtree_mult1_1_bjA5_q <= GND_q & u0_m0_wo0_mtree_mult1_1_bs4_b;

    -- u0_m0_wo0_mtree_mult1_1_im3(MULT,69)@16 + 2
    u0_m0_wo0_mtree_mult1_1_im3_a0 <= STD_LOGIC_VECTOR(u0_m0_wo0_mtree_mult1_1_bjA5_q);
    u0_m0_wo0_mtree_mult1_1_im3_b0 <= STD_LOGIC_VECTOR(u0_m0_wo0_mtree_mult1_1_bs6_b);
    u0_m0_wo0_mtree_mult1_1_im3_reset <= areset;
    u0_m0_wo0_mtree_mult1_1_im3_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 18,
        lpm_widthb => 15,
        lpm_widthp => 33,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "SIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => u0_m0_wo0_mtree_mult1_1_im3_a0,
        datab => u0_m0_wo0_mtree_mult1_1_im3_b0,
        clken => VCC_q(0),
        aclr => u0_m0_wo0_mtree_mult1_1_im3_reset,
        clock => clk,
        result => u0_m0_wo0_mtree_mult1_1_im3_s1
    );
    u0_m0_wo0_mtree_mult1_1_im3_q <= u0_m0_wo0_mtree_mult1_1_im3_s1;

    -- u0_m0_wo0_mtree_mult1_1_align_15(BITSHIFT,81)@18
    u0_m0_wo0_mtree_mult1_1_align_15_qint <= u0_m0_wo0_mtree_mult1_1_im3_q & "00000000000000000";
    u0_m0_wo0_mtree_mult1_1_align_15_q <= u0_m0_wo0_mtree_mult1_1_align_15_qint(49 downto 0);

    -- u0_m0_wo0_mtree_mult1_1_result_add_0_0_BitExpansion_for_b(BITJOIN,137)@18
    u0_m0_wo0_mtree_mult1_1_result_add_0_0_BitExpansion_for_b_q <= u0_m0_wo0_mtree_mult1_1_result_add_0_0_UpperBits_for_b_q & u0_m0_wo0_mtree_mult1_1_align_15_q;

    -- u0_m0_wo0_mtree_mult1_1_result_add_0_0_BitSelect_for_b(BITSELECT,141)@18
    u0_m0_wo0_mtree_mult1_1_result_add_0_0_BitSelect_for_b_b <= STD_LOGIC_VECTOR(u0_m0_wo0_mtree_mult1_1_result_add_0_0_BitExpansion_for_b_q(48 downto 0));
    u0_m0_wo0_mtree_mult1_1_result_add_0_0_BitSelect_for_b_c <= STD_LOGIC_VECTOR(u0_m0_wo0_mtree_mult1_1_result_add_0_0_BitExpansion_for_b_q(54 downto 49));

    -- u0_m0_wo0_mtree_mult1_1_result_add_0_0_SignBit_for_a(BITSELECT,135)@18
    u0_m0_wo0_mtree_mult1_1_result_add_0_0_SignBit_for_a_b <= STD_LOGIC_VECTOR(u0_m0_wo0_mtree_mult1_1_join_14_q(53 downto 53));

    -- u0_m0_wo0_mtree_mult1_1_im11(MULT,77)@16 + 2
    u0_m0_wo0_mtree_mult1_1_im11_a0 <= STD_LOGIC_VECTOR(u0_m0_wo0_mtree_mult1_1_bs6_b);
    u0_m0_wo0_mtree_mult1_1_im11_b0 <= STD_LOGIC_VECTOR(u0_m0_wo0_mtree_mult1_1_bs8_b);
    u0_m0_wo0_mtree_mult1_1_im11_reset <= areset;
    u0_m0_wo0_mtree_mult1_1_im11_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 15,
        lpm_widthb => 5,
        lpm_widthp => 20,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "SIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => u0_m0_wo0_mtree_mult1_1_im11_a0,
        datab => u0_m0_wo0_mtree_mult1_1_im11_b0,
        clken => VCC_q(0),
        aclr => u0_m0_wo0_mtree_mult1_1_im11_reset,
        clock => clk,
        result => u0_m0_wo0_mtree_mult1_1_im11_s1
    );
    u0_m0_wo0_mtree_mult1_1_im11_q <= u0_m0_wo0_mtree_mult1_1_im11_s1;

    -- u0_m0_wo0_mtree_mult1_1_bs2(BITSELECT,68)@16
    u0_m0_wo0_mtree_mult1_1_bs2_in <= u0_m0_wo0_wi0_r0_memr0_q(16 downto 0);
    u0_m0_wo0_mtree_mult1_1_bs2_b <= u0_m0_wo0_mtree_mult1_1_bs2_in(16 downto 0);

    -- u0_m0_wo0_mtree_mult1_1_bs1(BITSELECT,67)@16
    u0_m0_wo0_mtree_mult1_1_bs1_in <= u0_m0_wo0_cm0_lutmem_r(16 downto 0);
    u0_m0_wo0_mtree_mult1_1_bs1_b <= u0_m0_wo0_mtree_mult1_1_bs1_in(16 downto 0);

    -- u0_m0_wo0_mtree_mult1_1_im0(MULT,66)@16 + 2
    u0_m0_wo0_mtree_mult1_1_im0_a0 <= u0_m0_wo0_mtree_mult1_1_bs1_b;
    u0_m0_wo0_mtree_mult1_1_im0_b0 <= u0_m0_wo0_mtree_mult1_1_bs2_b;
    u0_m0_wo0_mtree_mult1_1_im0_reset <= areset;
    u0_m0_wo0_mtree_mult1_1_im0_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 17,
        lpm_widthb => 17,
        lpm_widthp => 34,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "UNSIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => u0_m0_wo0_mtree_mult1_1_im0_a0,
        datab => u0_m0_wo0_mtree_mult1_1_im0_b0,
        clken => VCC_q(0),
        aclr => u0_m0_wo0_mtree_mult1_1_im0_reset,
        clock => clk,
        result => u0_m0_wo0_mtree_mult1_1_im0_s1
    );
    u0_m0_wo0_mtree_mult1_1_im0_q <= u0_m0_wo0_mtree_mult1_1_im0_s1;

    -- u0_m0_wo0_mtree_mult1_1_join_14(BITJOIN,80)@18
    u0_m0_wo0_mtree_mult1_1_join_14_q <= u0_m0_wo0_mtree_mult1_1_im11_q & u0_m0_wo0_mtree_mult1_1_im0_q;

    -- u0_m0_wo0_mtree_mult1_1_result_add_0_0_BitExpansion_for_a(BITJOIN,134)@18
    u0_m0_wo0_mtree_mult1_1_result_add_0_0_BitExpansion_for_a_q <= u0_m0_wo0_mtree_mult1_1_result_add_0_0_SignBit_for_a_b & u0_m0_wo0_mtree_mult1_1_join_14_q;

    -- u0_m0_wo0_mtree_mult1_1_result_add_0_0_BitSelect_for_a(BITSELECT,140)@18
    u0_m0_wo0_mtree_mult1_1_result_add_0_0_BitSelect_for_a_b <= STD_LOGIC_VECTOR(u0_m0_wo0_mtree_mult1_1_result_add_0_0_BitExpansion_for_a_q(48 downto 0));
    u0_m0_wo0_mtree_mult1_1_result_add_0_0_BitSelect_for_a_c <= STD_LOGIC_VECTOR(u0_m0_wo0_mtree_mult1_1_result_add_0_0_BitExpansion_for_a_q(54 downto 49));

    -- u0_m0_wo0_mtree_mult1_1_result_add_0_0_p1_of_2(ADD,142)@18 + 1
    u0_m0_wo0_mtree_mult1_1_result_add_0_0_p1_of_2_a <= STD_LOGIC_VECTOR("0" & u0_m0_wo0_mtree_mult1_1_result_add_0_0_BitSelect_for_a_b);
    u0_m0_wo0_mtree_mult1_1_result_add_0_0_p1_of_2_b <= STD_LOGIC_VECTOR("0" & u0_m0_wo0_mtree_mult1_1_result_add_0_0_BitSelect_for_b_b);
    u0_m0_wo0_mtree_mult1_1_result_add_0_0_p1_of_2_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_1_result_add_0_0_p1_of_2_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_1_result_add_0_0_p1_of_2_o <= STD_LOGIC_VECTOR(UNSIGNED(u0_m0_wo0_mtree_mult1_1_result_add_0_0_p1_of_2_a) + UNSIGNED(u0_m0_wo0_mtree_mult1_1_result_add_0_0_p1_of_2_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_1_result_add_0_0_p1_of_2_c(0) <= u0_m0_wo0_mtree_mult1_1_result_add_0_0_p1_of_2_o(49);
    u0_m0_wo0_mtree_mult1_1_result_add_0_0_p1_of_2_q <= u0_m0_wo0_mtree_mult1_1_result_add_0_0_p1_of_2_o(48 downto 0);

    -- u0_m0_wo0_mtree_mult1_1_result_add_1_0_p1_of_2(ADD,153)@19 + 1
    u0_m0_wo0_mtree_mult1_1_result_add_1_0_p1_of_2_a <= STD_LOGIC_VECTOR("0" & u0_m0_wo0_mtree_mult1_1_result_add_0_0_p1_of_2_q);
    u0_m0_wo0_mtree_mult1_1_result_add_1_0_p1_of_2_b <= STD_LOGIC_VECTOR("0" & u0_m0_wo0_mtree_mult1_1_result_add_1_0_BitSelect_for_b_b);
    u0_m0_wo0_mtree_mult1_1_result_add_1_0_p1_of_2_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_1_result_add_1_0_p1_of_2_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_1_result_add_1_0_p1_of_2_o <= STD_LOGIC_VECTOR(UNSIGNED(u0_m0_wo0_mtree_mult1_1_result_add_1_0_p1_of_2_a) + UNSIGNED(u0_m0_wo0_mtree_mult1_1_result_add_1_0_p1_of_2_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_1_result_add_1_0_p1_of_2_c(0) <= u0_m0_wo0_mtree_mult1_1_result_add_1_0_p1_of_2_o(49);
    u0_m0_wo0_mtree_mult1_1_result_add_1_0_p1_of_2_q <= u0_m0_wo0_mtree_mult1_1_result_add_1_0_p1_of_2_o(48 downto 0);

    -- u0_m0_wo0_mtree_mult1_0_result_add_1_0_SignBit_for_b(BITSELECT,171)@19
    u0_m0_wo0_mtree_mult1_0_result_add_1_0_SignBit_for_b_b <= STD_LOGIC_VECTOR(u0_m0_wo0_mtree_mult1_0_align_17_q(39 downto 39));

    -- u0_m0_wo0_mtree_mult1_0_result_add_1_0_UpperBits_for_b(BITJOIN,172)@19
    u0_m0_wo0_mtree_mult1_0_result_add_1_0_UpperBits_for_b_q <= u0_m0_wo0_mtree_mult1_0_result_add_1_0_SignBit_for_b_b & u0_m0_wo0_mtree_mult1_0_result_add_1_0_SignBit_for_b_b & u0_m0_wo0_mtree_mult1_0_result_add_1_0_SignBit_for_b_b & u0_m0_wo0_mtree_mult1_0_result_add_1_0_SignBit_for_b_b & u0_m0_wo0_mtree_mult1_0_result_add_1_0_SignBit_for_b_b & u0_m0_wo0_mtree_mult1_0_result_add_1_0_SignBit_for_b_b & u0_m0_wo0_mtree_mult1_0_result_add_1_0_SignBit_for_b_b & u0_m0_wo0_mtree_mult1_0_result_add_1_0_SignBit_for_b_b & u0_m0_wo0_mtree_mult1_0_result_add_1_0_SignBit_for_b_b & u0_m0_wo0_mtree_mult1_0_result_add_1_0_SignBit_for_b_b & u0_m0_wo0_mtree_mult1_0_result_add_1_0_SignBit_for_b_b & u0_m0_wo0_mtree_mult1_0_result_add_1_0_SignBit_for_b_b & u0_m0_wo0_mtree_mult1_0_result_add_1_0_SignBit_for_b_b & u0_m0_wo0_mtree_mult1_0_result_add_1_0_SignBit_for_b_b & u0_m0_wo0_mtree_mult1_0_result_add_1_0_SignBit_for_b_b & u0_m0_wo0_mtree_mult1_0_result_add_1_0_SignBit_for_b_b;

    -- u0_m0_wo0_cm1_lutmem(DUALMEM,65)@14 + 2
    u0_m0_wo0_cm1_lutmem_aa <= u0_m0_wo0_ca1_q;
    u0_m0_wo0_cm1_lutmem_reset0 <= areset;
    u0_m0_wo0_cm1_lutmem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "M9K",
        operation_mode => "ROM",
        width_a => 22,
        widthad_a => 7,
        numwords_a => 65,
        lpm_type => "altsyncram",
        width_byteena_a => 1,
        outdata_reg_a => "CLOCK0",
        outdata_aclr_a => "CLEAR0",
        clock_enable_input_a => "NORMAL",
        power_up_uninitialized => "FALSE",
        init_file => "rx_ciccomp_0002_rtl_core_u0_m0_wo0_cm1_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "Cyclone IV E"
    )
    PORT MAP (
        clocken0 => '1',
        aclr0 => u0_m0_wo0_cm1_lutmem_reset0,
        clock0 => clk,
        address_a => u0_m0_wo0_cm1_lutmem_aa,
        q_a => u0_m0_wo0_cm1_lutmem_ir
    );
    u0_m0_wo0_cm1_lutmem_r <= u0_m0_wo0_cm1_lutmem_ir(21 downto 0);

    -- u0_m0_wo0_mtree_mult1_0_bs8(BITSELECT,95)@16
    u0_m0_wo0_mtree_mult1_0_bs8_b <= STD_LOGIC_VECTOR(u0_m0_wo0_cm1_lutmem_r(21 downto 17));

    -- d_u0_m0_wo0_mtree_mult1_0_bs8_b_17(DELAY,249)@16 + 1
    d_u0_m0_wo0_mtree_mult1_0_bs8_b_17 : dspba_delay
    GENERIC MAP ( width => 5, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_mtree_mult1_0_bs8_b, xout => d_u0_m0_wo0_mtree_mult1_0_bs8_b_17_q, clk => clk, aclr => areset );

    -- u0_m0_wo0_wi0_r0_we1_seq(SEQUENCE,34)@15 + 1
    u0_m0_wo0_wi0_r0_we1_seq_clkproc: PROCESS (clk, areset)
        variable u0_m0_wo0_wi0_r0_we1_seq_c : SIGNED(10 downto 0);
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_wi0_r0_we1_seq_c := "00000000000";
            u0_m0_wo0_wi0_r0_we1_seq_q <= "0";
            u0_m0_wo0_wi0_r0_we1_seq_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (d_u0_m0_wo0_compute_q_15_q = "1") THEN
                IF (u0_m0_wo0_wi0_r0_we1_seq_c = "11111111001") THEN
                    u0_m0_wo0_wi0_r0_we1_seq_eq <= '1';
                ELSE
                    u0_m0_wo0_wi0_r0_we1_seq_eq <= '0';
                END IF;
                IF (u0_m0_wo0_wi0_r0_we1_seq_eq = '1') THEN
                    u0_m0_wo0_wi0_r0_we1_seq_c := u0_m0_wo0_wi0_r0_we1_seq_c + 259;
                ELSE
                    u0_m0_wo0_wi0_r0_we1_seq_c := u0_m0_wo0_wi0_r0_we1_seq_c - 1;
                END IF;
                u0_m0_wo0_wi0_r0_we1_seq_q <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_we1_seq_c(10 downto 10));
            ELSE
                u0_m0_wo0_wi0_r0_we1_seq_q <= "0";
            END IF;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_wi0_r0_wa1(COUNTER,36)@16
    -- low=0, high=511, step=1, init=32
    u0_m0_wo0_wi0_r0_wa1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_wi0_r0_wa1_i <= TO_UNSIGNED(32, 9);
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_wi0_r0_we1_seq_q = "1") THEN
                u0_m0_wo0_wi0_r0_wa1_i <= u0_m0_wo0_wi0_r0_wa1_i + 1;
            END IF;
        END IF;
    END PROCESS;
    u0_m0_wo0_wi0_r0_wa1_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(u0_m0_wo0_wi0_r0_wa1_i, 9)));

    -- u0_m0_wo0_wi0_r0_memr1(DUALMEM,38)@16
    u0_m0_wo0_wi0_r0_memr1_ia <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_memr0_q);
    u0_m0_wo0_wi0_r0_memr1_aa <= u0_m0_wo0_wi0_r0_wa1_q;
    u0_m0_wo0_wi0_r0_memr1_ab <= u0_m0_wo0_wi0_r0_ra1_resize_b;
    u0_m0_wo0_wi0_r0_memr1_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "M9K",
        operation_mode => "DUAL_PORT",
        width_a => 32,
        widthad_a => 9,
        numwords_a => 512,
        width_b => 32,
        widthad_b => 9,
        numwords_b => 512,
        lpm_type => "altsyncram",
        width_byteena_a => 1,
        address_reg_b => "CLOCK0",
        indata_reg_b => "CLOCK0",
        wrcontrol_wraddress_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK0",
        outdata_aclr_b => "NONE",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "FALSE",
        init_file => "UNUSED",
        intended_device_family => "Cyclone IV E"
    )
    PORT MAP (
        clocken0 => '1',
        clock0 => clk,
        address_a => u0_m0_wo0_wi0_r0_memr1_aa,
        data_a => u0_m0_wo0_wi0_r0_memr1_ia,
        wren_a => u0_m0_wo0_wi0_r0_we1_seq_q(0),
        address_b => u0_m0_wo0_wi0_r0_memr1_ab,
        q_b => u0_m0_wo0_wi0_r0_memr1_iq
    );
    u0_m0_wo0_wi0_r0_memr1_q <= u0_m0_wo0_wi0_r0_memr1_iq(31 downto 0);

    -- d_u0_m0_wo0_wi0_r0_memr1_q_17(DELAY,245)@16 + 1
    d_u0_m0_wo0_wi0_r0_memr1_q_17 : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_memr1_q, xout => d_u0_m0_wo0_wi0_r0_memr1_q_17_q, clk => clk, aclr => areset );

    -- u0_m0_wo0_mtree_mult1_0_bs9(BITSELECT,96)@17
    u0_m0_wo0_mtree_mult1_0_bs9_in <= STD_LOGIC_VECTOR(d_u0_m0_wo0_wi0_r0_memr1_q_17_q(16 downto 0));
    u0_m0_wo0_mtree_mult1_0_bs9_b <= STD_LOGIC_VECTOR(u0_m0_wo0_mtree_mult1_0_bs9_in(16 downto 0));

    -- u0_m0_wo0_mtree_mult1_0_bjB10(BITJOIN,97)@17
    u0_m0_wo0_mtree_mult1_0_bjB10_q <= GND_q & u0_m0_wo0_mtree_mult1_0_bs9_b;

    -- u0_m0_wo0_mtree_mult1_0_im7(MULT,94)@17 + 2
    u0_m0_wo0_mtree_mult1_0_im7_a0 <= STD_LOGIC_VECTOR(u0_m0_wo0_mtree_mult1_0_bjB10_q);
    u0_m0_wo0_mtree_mult1_0_im7_b0 <= STD_LOGIC_VECTOR(d_u0_m0_wo0_mtree_mult1_0_bs8_b_17_q);
    u0_m0_wo0_mtree_mult1_0_im7_reset <= areset;
    u0_m0_wo0_mtree_mult1_0_im7_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 18,
        lpm_widthb => 5,
        lpm_widthp => 23,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "SIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => u0_m0_wo0_mtree_mult1_0_im7_a0,
        datab => u0_m0_wo0_mtree_mult1_0_im7_b0,
        clken => VCC_q(0),
        aclr => u0_m0_wo0_mtree_mult1_0_im7_reset,
        clock => clk,
        result => u0_m0_wo0_mtree_mult1_0_im7_s1
    );
    u0_m0_wo0_mtree_mult1_0_im7_q <= u0_m0_wo0_mtree_mult1_0_im7_s1;

    -- u0_m0_wo0_mtree_mult1_0_align_17(BITSHIFT,104)@19
    u0_m0_wo0_mtree_mult1_0_align_17_qint <= u0_m0_wo0_mtree_mult1_0_im7_q & "00000000000000000";
    u0_m0_wo0_mtree_mult1_0_align_17_q <= u0_m0_wo0_mtree_mult1_0_align_17_qint(39 downto 0);

    -- u0_m0_wo0_mtree_mult1_0_result_add_1_0_BitExpansion_for_b(BITJOIN,170)@19
    u0_m0_wo0_mtree_mult1_0_result_add_1_0_BitExpansion_for_b_q <= u0_m0_wo0_mtree_mult1_0_result_add_1_0_UpperBits_for_b_q & u0_m0_wo0_mtree_mult1_0_align_17_q;

    -- u0_m0_wo0_mtree_mult1_0_result_add_1_0_BitSelect_for_b(BITSELECT,174)@19
    u0_m0_wo0_mtree_mult1_0_result_add_1_0_BitSelect_for_b_b <= STD_LOGIC_VECTOR(u0_m0_wo0_mtree_mult1_0_result_add_1_0_BitExpansion_for_b_q(48 downto 0));
    u0_m0_wo0_mtree_mult1_0_result_add_1_0_BitSelect_for_b_c <= STD_LOGIC_VECTOR(u0_m0_wo0_mtree_mult1_0_result_add_1_0_BitExpansion_for_b_q(55 downto 49));

    -- u0_m0_wo0_mtree_mult1_0_result_add_0_0_SignBit_for_b(BITSELECT,160)@18
    u0_m0_wo0_mtree_mult1_0_result_add_0_0_SignBit_for_b_b <= STD_LOGIC_VECTOR(u0_m0_wo0_mtree_mult1_0_align_15_q(49 downto 49));

    -- u0_m0_wo0_mtree_mult1_0_result_add_0_0_UpperBits_for_b(BITJOIN,161)@18
    u0_m0_wo0_mtree_mult1_0_result_add_0_0_UpperBits_for_b_q <= u0_m0_wo0_mtree_mult1_0_result_add_0_0_SignBit_for_b_b & u0_m0_wo0_mtree_mult1_0_result_add_0_0_SignBit_for_b_b & u0_m0_wo0_mtree_mult1_0_result_add_0_0_SignBit_for_b_b & u0_m0_wo0_mtree_mult1_0_result_add_0_0_SignBit_for_b_b & u0_m0_wo0_mtree_mult1_0_result_add_0_0_SignBit_for_b_b;

    -- u0_m0_wo0_mtree_mult1_0_bs6(BITSELECT,93)@16
    u0_m0_wo0_mtree_mult1_0_bs6_b <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_memr1_q(31 downto 17));

    -- u0_m0_wo0_mtree_mult1_0_bs4(BITSELECT,91)@16
    u0_m0_wo0_mtree_mult1_0_bs4_in <= STD_LOGIC_VECTOR(u0_m0_wo0_cm1_lutmem_r(16 downto 0));
    u0_m0_wo0_mtree_mult1_0_bs4_b <= STD_LOGIC_VECTOR(u0_m0_wo0_mtree_mult1_0_bs4_in(16 downto 0));

    -- u0_m0_wo0_mtree_mult1_0_bjA5(BITJOIN,92)@16
    u0_m0_wo0_mtree_mult1_0_bjA5_q <= GND_q & u0_m0_wo0_mtree_mult1_0_bs4_b;

    -- u0_m0_wo0_mtree_mult1_0_im3(MULT,90)@16 + 2
    u0_m0_wo0_mtree_mult1_0_im3_a0 <= STD_LOGIC_VECTOR(u0_m0_wo0_mtree_mult1_0_bjA5_q);
    u0_m0_wo0_mtree_mult1_0_im3_b0 <= STD_LOGIC_VECTOR(u0_m0_wo0_mtree_mult1_0_bs6_b);
    u0_m0_wo0_mtree_mult1_0_im3_reset <= areset;
    u0_m0_wo0_mtree_mult1_0_im3_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 18,
        lpm_widthb => 15,
        lpm_widthp => 33,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "SIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => u0_m0_wo0_mtree_mult1_0_im3_a0,
        datab => u0_m0_wo0_mtree_mult1_0_im3_b0,
        clken => VCC_q(0),
        aclr => u0_m0_wo0_mtree_mult1_0_im3_reset,
        clock => clk,
        result => u0_m0_wo0_mtree_mult1_0_im3_s1
    );
    u0_m0_wo0_mtree_mult1_0_im3_q <= u0_m0_wo0_mtree_mult1_0_im3_s1;

    -- u0_m0_wo0_mtree_mult1_0_align_15(BITSHIFT,102)@18
    u0_m0_wo0_mtree_mult1_0_align_15_qint <= u0_m0_wo0_mtree_mult1_0_im3_q & "00000000000000000";
    u0_m0_wo0_mtree_mult1_0_align_15_q <= u0_m0_wo0_mtree_mult1_0_align_15_qint(49 downto 0);

    -- u0_m0_wo0_mtree_mult1_0_result_add_0_0_BitExpansion_for_b(BITJOIN,159)@18
    u0_m0_wo0_mtree_mult1_0_result_add_0_0_BitExpansion_for_b_q <= u0_m0_wo0_mtree_mult1_0_result_add_0_0_UpperBits_for_b_q & u0_m0_wo0_mtree_mult1_0_align_15_q;

    -- u0_m0_wo0_mtree_mult1_0_result_add_0_0_BitSelect_for_b(BITSELECT,163)@18
    u0_m0_wo0_mtree_mult1_0_result_add_0_0_BitSelect_for_b_b <= STD_LOGIC_VECTOR(u0_m0_wo0_mtree_mult1_0_result_add_0_0_BitExpansion_for_b_q(48 downto 0));
    u0_m0_wo0_mtree_mult1_0_result_add_0_0_BitSelect_for_b_c <= STD_LOGIC_VECTOR(u0_m0_wo0_mtree_mult1_0_result_add_0_0_BitExpansion_for_b_q(54 downto 49));

    -- u0_m0_wo0_mtree_mult1_0_result_add_0_0_SignBit_for_a(BITSELECT,157)@18
    u0_m0_wo0_mtree_mult1_0_result_add_0_0_SignBit_for_a_b <= STD_LOGIC_VECTOR(u0_m0_wo0_mtree_mult1_0_join_14_q(53 downto 53));

    -- u0_m0_wo0_mtree_mult1_0_im11(MULT,98)@16 + 2
    u0_m0_wo0_mtree_mult1_0_im11_a0 <= STD_LOGIC_VECTOR(u0_m0_wo0_mtree_mult1_0_bs6_b);
    u0_m0_wo0_mtree_mult1_0_im11_b0 <= STD_LOGIC_VECTOR(u0_m0_wo0_mtree_mult1_0_bs8_b);
    u0_m0_wo0_mtree_mult1_0_im11_reset <= areset;
    u0_m0_wo0_mtree_mult1_0_im11_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 15,
        lpm_widthb => 5,
        lpm_widthp => 20,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "SIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => u0_m0_wo0_mtree_mult1_0_im11_a0,
        datab => u0_m0_wo0_mtree_mult1_0_im11_b0,
        clken => VCC_q(0),
        aclr => u0_m0_wo0_mtree_mult1_0_im11_reset,
        clock => clk,
        result => u0_m0_wo0_mtree_mult1_0_im11_s1
    );
    u0_m0_wo0_mtree_mult1_0_im11_q <= u0_m0_wo0_mtree_mult1_0_im11_s1;

    -- u0_m0_wo0_mtree_mult1_0_bs2(BITSELECT,89)@16
    u0_m0_wo0_mtree_mult1_0_bs2_in <= u0_m0_wo0_wi0_r0_memr1_q(16 downto 0);
    u0_m0_wo0_mtree_mult1_0_bs2_b <= u0_m0_wo0_mtree_mult1_0_bs2_in(16 downto 0);

    -- u0_m0_wo0_mtree_mult1_0_bs1(BITSELECT,88)@16
    u0_m0_wo0_mtree_mult1_0_bs1_in <= u0_m0_wo0_cm1_lutmem_r(16 downto 0);
    u0_m0_wo0_mtree_mult1_0_bs1_b <= u0_m0_wo0_mtree_mult1_0_bs1_in(16 downto 0);

    -- u0_m0_wo0_mtree_mult1_0_im0(MULT,87)@16 + 2
    u0_m0_wo0_mtree_mult1_0_im0_a0 <= u0_m0_wo0_mtree_mult1_0_bs1_b;
    u0_m0_wo0_mtree_mult1_0_im0_b0 <= u0_m0_wo0_mtree_mult1_0_bs2_b;
    u0_m0_wo0_mtree_mult1_0_im0_reset <= areset;
    u0_m0_wo0_mtree_mult1_0_im0_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 17,
        lpm_widthb => 17,
        lpm_widthp => 34,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "UNSIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => u0_m0_wo0_mtree_mult1_0_im0_a0,
        datab => u0_m0_wo0_mtree_mult1_0_im0_b0,
        clken => VCC_q(0),
        aclr => u0_m0_wo0_mtree_mult1_0_im0_reset,
        clock => clk,
        result => u0_m0_wo0_mtree_mult1_0_im0_s1
    );
    u0_m0_wo0_mtree_mult1_0_im0_q <= u0_m0_wo0_mtree_mult1_0_im0_s1;

    -- u0_m0_wo0_mtree_mult1_0_join_14(BITJOIN,101)@18
    u0_m0_wo0_mtree_mult1_0_join_14_q <= u0_m0_wo0_mtree_mult1_0_im11_q & u0_m0_wo0_mtree_mult1_0_im0_q;

    -- u0_m0_wo0_mtree_mult1_0_result_add_0_0_BitExpansion_for_a(BITJOIN,156)@18
    u0_m0_wo0_mtree_mult1_0_result_add_0_0_BitExpansion_for_a_q <= u0_m0_wo0_mtree_mult1_0_result_add_0_0_SignBit_for_a_b & u0_m0_wo0_mtree_mult1_0_join_14_q;

    -- u0_m0_wo0_mtree_mult1_0_result_add_0_0_BitSelect_for_a(BITSELECT,162)@18
    u0_m0_wo0_mtree_mult1_0_result_add_0_0_BitSelect_for_a_b <= STD_LOGIC_VECTOR(u0_m0_wo0_mtree_mult1_0_result_add_0_0_BitExpansion_for_a_q(48 downto 0));
    u0_m0_wo0_mtree_mult1_0_result_add_0_0_BitSelect_for_a_c <= STD_LOGIC_VECTOR(u0_m0_wo0_mtree_mult1_0_result_add_0_0_BitExpansion_for_a_q(54 downto 49));

    -- u0_m0_wo0_mtree_mult1_0_result_add_0_0_p1_of_2(ADD,164)@18 + 1
    u0_m0_wo0_mtree_mult1_0_result_add_0_0_p1_of_2_a <= STD_LOGIC_VECTOR("0" & u0_m0_wo0_mtree_mult1_0_result_add_0_0_BitSelect_for_a_b);
    u0_m0_wo0_mtree_mult1_0_result_add_0_0_p1_of_2_b <= STD_LOGIC_VECTOR("0" & u0_m0_wo0_mtree_mult1_0_result_add_0_0_BitSelect_for_b_b);
    u0_m0_wo0_mtree_mult1_0_result_add_0_0_p1_of_2_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_0_result_add_0_0_p1_of_2_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_0_result_add_0_0_p1_of_2_o <= STD_LOGIC_VECTOR(UNSIGNED(u0_m0_wo0_mtree_mult1_0_result_add_0_0_p1_of_2_a) + UNSIGNED(u0_m0_wo0_mtree_mult1_0_result_add_0_0_p1_of_2_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_0_result_add_0_0_p1_of_2_c(0) <= u0_m0_wo0_mtree_mult1_0_result_add_0_0_p1_of_2_o(49);
    u0_m0_wo0_mtree_mult1_0_result_add_0_0_p1_of_2_q <= u0_m0_wo0_mtree_mult1_0_result_add_0_0_p1_of_2_o(48 downto 0);

    -- u0_m0_wo0_mtree_mult1_0_result_add_1_0_p1_of_2(ADD,175)@19 + 1
    u0_m0_wo0_mtree_mult1_0_result_add_1_0_p1_of_2_a <= STD_LOGIC_VECTOR("0" & u0_m0_wo0_mtree_mult1_0_result_add_0_0_p1_of_2_q);
    u0_m0_wo0_mtree_mult1_0_result_add_1_0_p1_of_2_b <= STD_LOGIC_VECTOR("0" & u0_m0_wo0_mtree_mult1_0_result_add_1_0_BitSelect_for_b_b);
    u0_m0_wo0_mtree_mult1_0_result_add_1_0_p1_of_2_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_0_result_add_1_0_p1_of_2_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_0_result_add_1_0_p1_of_2_o <= STD_LOGIC_VECTOR(UNSIGNED(u0_m0_wo0_mtree_mult1_0_result_add_1_0_p1_of_2_a) + UNSIGNED(u0_m0_wo0_mtree_mult1_0_result_add_1_0_p1_of_2_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_0_result_add_1_0_p1_of_2_c(0) <= u0_m0_wo0_mtree_mult1_0_result_add_1_0_p1_of_2_o(49);
    u0_m0_wo0_mtree_mult1_0_result_add_1_0_p1_of_2_q <= u0_m0_wo0_mtree_mult1_0_result_add_1_0_p1_of_2_o(48 downto 0);

    -- u0_m0_wo0_mtree_add0_0_p1_of_2(ADD,119)@20 + 1
    u0_m0_wo0_mtree_add0_0_p1_of_2_a <= STD_LOGIC_VECTOR("0" & u0_m0_wo0_mtree_mult1_0_result_add_1_0_p1_of_2_q);
    u0_m0_wo0_mtree_add0_0_p1_of_2_b <= STD_LOGIC_VECTOR("0" & u0_m0_wo0_mtree_mult1_1_result_add_1_0_p1_of_2_q);
    u0_m0_wo0_mtree_add0_0_p1_of_2_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add0_0_p1_of_2_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add0_0_p1_of_2_o <= STD_LOGIC_VECTOR(UNSIGNED(u0_m0_wo0_mtree_add0_0_p1_of_2_a) + UNSIGNED(u0_m0_wo0_mtree_add0_0_p1_of_2_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add0_0_p1_of_2_c(0) <= u0_m0_wo0_mtree_add0_0_p1_of_2_o(49);
    u0_m0_wo0_mtree_add0_0_p1_of_2_q <= u0_m0_wo0_mtree_add0_0_p1_of_2_o(48 downto 0);

    -- u0_m0_wo0_accum_p1_of_2(ADD,131)@21 + 1
    u0_m0_wo0_accum_p1_of_2_a <= STD_LOGIC_VECTOR("0" & u0_m0_wo0_mtree_add0_0_p1_of_2_q);
    u0_m0_wo0_accum_p1_of_2_b <= STD_LOGIC_VECTOR("0" & u0_m0_wo0_adelay_p0_q);
    u0_m0_wo0_accum_p1_of_2_i <= u0_m0_wo0_accum_p1_of_2_a;
    u0_m0_wo0_accum_p1_of_2_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_accum_p1_of_2_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (d_u0_m0_wo0_compute_q_21_q = "1") THEN
                IF (u0_m0_wo0_aseq_q = "1") THEN
                    u0_m0_wo0_accum_p1_of_2_o <= u0_m0_wo0_accum_p1_of_2_i;
                ELSE
                    u0_m0_wo0_accum_p1_of_2_o <= STD_LOGIC_VECTOR(UNSIGNED(u0_m0_wo0_accum_p1_of_2_a) + UNSIGNED(u0_m0_wo0_accum_p1_of_2_b));
                END IF;
            END IF;
        END IF;
    END PROCESS;
    u0_m0_wo0_accum_p1_of_2_c(0) <= u0_m0_wo0_accum_p1_of_2_o(49);
    u0_m0_wo0_accum_p1_of_2_q <= u0_m0_wo0_accum_p1_of_2_o(48 downto 0);

    -- d_u0_m0_wo0_aseq_q_22(DELAY,246)@21 + 1
    d_u0_m0_wo0_aseq_q_22 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_aseq_q, xout => d_u0_m0_wo0_aseq_q_22_q, clk => clk, aclr => areset );

    -- d_u0_m0_wo0_compute_q_22(DELAY,243)@21 + 1
    d_u0_m0_wo0_compute_q_22 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => d_u0_m0_wo0_compute_q_21_q, xout => d_u0_m0_wo0_compute_q_22_q, clk => clk, aclr => areset );

    -- d_u0_m0_wo0_memread_q_22(DELAY,239)@21 + 1
    d_u0_m0_wo0_memread_q_22 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => d_u0_m0_wo0_memread_q_21_q, xout => d_u0_m0_wo0_memread_q_22_q, clk => clk, aclr => areset );

    -- u0_m0_wo0_adelay_p1(DELAY,180)@22
    u0_m0_wo0_adelay_p1 : dspba_delay
    GENERIC MAP ( width => 13, depth => 3, reset_kind => "NONE" )
    PORT MAP ( xin => u0_m0_wo0_accum_p2_of_2_q, xout => u0_m0_wo0_adelay_p1_q, ena => d_u0_m0_wo0_compute_q_22_q(0), clk => clk, aclr => areset );

    -- u0_m0_wo0_accum_BitSelect_for_a_tessel1_1(BITSELECT,195)@22
    u0_m0_wo0_accum_BitSelect_for_a_tessel1_1_b <= STD_LOGIC_VECTOR(u0_m0_wo0_mtree_add0_0_p2_of_2_q(5 downto 5));

    -- d_u0_m0_wo0_mtree_mult1_1_result_add_1_0_BitSelect_for_b_c_20(DELAY,253)@19 + 1
    d_u0_m0_wo0_mtree_mult1_1_result_add_1_0_BitSelect_for_b_c_20 : dspba_delay
    GENERIC MAP ( width => 7, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_mtree_mult1_1_result_add_1_0_BitSelect_for_b_c, xout => d_u0_m0_wo0_mtree_mult1_1_result_add_1_0_BitSelect_for_b_c_20_q, clk => clk, aclr => areset );

    -- u0_m0_wo0_mtree_mult1_1_result_add_1_0_BitSelect_for_a_tessel1_1(BITSELECT,221)@20
    u0_m0_wo0_mtree_mult1_1_result_add_1_0_BitSelect_for_a_tessel1_1_b <= STD_LOGIC_VECTOR(u0_m0_wo0_mtree_mult1_1_result_add_0_0_p2_of_2_q(5 downto 5));

    -- d_u0_m0_wo0_mtree_mult1_1_result_add_0_0_BitSelect_for_b_c_19(DELAY,252)@18 + 1
    d_u0_m0_wo0_mtree_mult1_1_result_add_0_0_BitSelect_for_b_c_19 : dspba_delay
    GENERIC MAP ( width => 6, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_mtree_mult1_1_result_add_0_0_BitSelect_for_b_c, xout => d_u0_m0_wo0_mtree_mult1_1_result_add_0_0_BitSelect_for_b_c_19_q, clk => clk, aclr => areset );

    -- d_u0_m0_wo0_mtree_mult1_1_result_add_0_0_BitSelect_for_a_c_19(DELAY,251)@18 + 1
    d_u0_m0_wo0_mtree_mult1_1_result_add_0_0_BitSelect_for_a_c_19 : dspba_delay
    GENERIC MAP ( width => 6, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_mtree_mult1_1_result_add_0_0_BitSelect_for_a_c, xout => d_u0_m0_wo0_mtree_mult1_1_result_add_0_0_BitSelect_for_a_c_19_q, clk => clk, aclr => areset );

    -- u0_m0_wo0_mtree_mult1_1_result_add_0_0_p2_of_2(ADD,143)@19 + 1
    u0_m0_wo0_mtree_mult1_1_result_add_0_0_p2_of_2_cin <= u0_m0_wo0_mtree_mult1_1_result_add_0_0_p1_of_2_c;
    u0_m0_wo0_mtree_mult1_1_result_add_0_0_p2_of_2_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((6 downto 6 => d_u0_m0_wo0_mtree_mult1_1_result_add_0_0_BitSelect_for_a_c_19_q(5)) & d_u0_m0_wo0_mtree_mult1_1_result_add_0_0_BitSelect_for_a_c_19_q) & '1');
    u0_m0_wo0_mtree_mult1_1_result_add_0_0_p2_of_2_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((6 downto 6 => d_u0_m0_wo0_mtree_mult1_1_result_add_0_0_BitSelect_for_b_c_19_q(5)) & d_u0_m0_wo0_mtree_mult1_1_result_add_0_0_BitSelect_for_b_c_19_q) & u0_m0_wo0_mtree_mult1_1_result_add_0_0_p2_of_2_cin(0));
    u0_m0_wo0_mtree_mult1_1_result_add_0_0_p2_of_2_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_1_result_add_0_0_p2_of_2_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_1_result_add_0_0_p2_of_2_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_1_result_add_0_0_p2_of_2_a) + SIGNED(u0_m0_wo0_mtree_mult1_1_result_add_0_0_p2_of_2_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_1_result_add_0_0_p2_of_2_q <= u0_m0_wo0_mtree_mult1_1_result_add_0_0_p2_of_2_o(6 downto 1);

    -- u0_m0_wo0_mtree_mult1_1_result_add_1_0_BitSelect_for_a_BitJoin_for_c(BITJOIN,222)@20
    u0_m0_wo0_mtree_mult1_1_result_add_1_0_BitSelect_for_a_BitJoin_for_c_q <= u0_m0_wo0_mtree_mult1_1_result_add_1_0_BitSelect_for_a_tessel1_1_b & u0_m0_wo0_mtree_mult1_1_result_add_0_0_p2_of_2_q;

    -- u0_m0_wo0_mtree_mult1_1_result_add_1_0_p2_of_2(ADD,154)@20 + 1
    u0_m0_wo0_mtree_mult1_1_result_add_1_0_p2_of_2_cin <= u0_m0_wo0_mtree_mult1_1_result_add_1_0_p1_of_2_c;
    u0_m0_wo0_mtree_mult1_1_result_add_1_0_p2_of_2_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((7 downto 7 => u0_m0_wo0_mtree_mult1_1_result_add_1_0_BitSelect_for_a_BitJoin_for_c_q(6)) & u0_m0_wo0_mtree_mult1_1_result_add_1_0_BitSelect_for_a_BitJoin_for_c_q) & '1');
    u0_m0_wo0_mtree_mult1_1_result_add_1_0_p2_of_2_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((7 downto 7 => d_u0_m0_wo0_mtree_mult1_1_result_add_1_0_BitSelect_for_b_c_20_q(6)) & d_u0_m0_wo0_mtree_mult1_1_result_add_1_0_BitSelect_for_b_c_20_q) & u0_m0_wo0_mtree_mult1_1_result_add_1_0_p2_of_2_cin(0));
    u0_m0_wo0_mtree_mult1_1_result_add_1_0_p2_of_2_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_1_result_add_1_0_p2_of_2_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_1_result_add_1_0_p2_of_2_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_1_result_add_1_0_p2_of_2_a) + SIGNED(u0_m0_wo0_mtree_mult1_1_result_add_1_0_p2_of_2_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_1_result_add_1_0_p2_of_2_q <= u0_m0_wo0_mtree_mult1_1_result_add_1_0_p2_of_2_o(7 downto 1);

    -- u0_m0_wo0_mtree_add0_0_BitSelect_for_b_tessel1_1(BITSELECT,190)@21
    u0_m0_wo0_mtree_add0_0_BitSelect_for_b_tessel1_1_b <= STD_LOGIC_VECTOR(u0_m0_wo0_mtree_mult1_1_result_add_1_0_p2_of_2_q(4 downto 4));

    -- u0_m0_wo0_mtree_add0_0_BitSelect_for_b_tessel1_0(BITSELECT,189)@21
    u0_m0_wo0_mtree_add0_0_BitSelect_for_b_tessel1_0_b <= STD_LOGIC_VECTOR(u0_m0_wo0_mtree_mult1_1_result_add_1_0_p2_of_2_q(4 downto 0));

    -- u0_m0_wo0_mtree_add0_0_BitSelect_for_b_BitJoin_for_c(BITJOIN,191)@21
    u0_m0_wo0_mtree_add0_0_BitSelect_for_b_BitJoin_for_c_q <= u0_m0_wo0_mtree_add0_0_BitSelect_for_b_tessel1_1_b & u0_m0_wo0_mtree_add0_0_BitSelect_for_b_tessel1_0_b;

    -- d_u0_m0_wo0_mtree_mult1_0_result_add_1_0_BitSelect_for_b_c_20(DELAY,256)@19 + 1
    d_u0_m0_wo0_mtree_mult1_0_result_add_1_0_BitSelect_for_b_c_20 : dspba_delay
    GENERIC MAP ( width => 7, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_mtree_mult1_0_result_add_1_0_BitSelect_for_b_c, xout => d_u0_m0_wo0_mtree_mult1_0_result_add_1_0_BitSelect_for_b_c_20_q, clk => clk, aclr => areset );

    -- u0_m0_wo0_mtree_mult1_0_result_add_1_0_BitSelect_for_a_tessel1_1(BITSELECT,226)@20
    u0_m0_wo0_mtree_mult1_0_result_add_1_0_BitSelect_for_a_tessel1_1_b <= STD_LOGIC_VECTOR(u0_m0_wo0_mtree_mult1_0_result_add_0_0_p2_of_2_q(5 downto 5));

    -- d_u0_m0_wo0_mtree_mult1_0_result_add_0_0_BitSelect_for_b_c_19(DELAY,255)@18 + 1
    d_u0_m0_wo0_mtree_mult1_0_result_add_0_0_BitSelect_for_b_c_19 : dspba_delay
    GENERIC MAP ( width => 6, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_mtree_mult1_0_result_add_0_0_BitSelect_for_b_c, xout => d_u0_m0_wo0_mtree_mult1_0_result_add_0_0_BitSelect_for_b_c_19_q, clk => clk, aclr => areset );

    -- d_u0_m0_wo0_mtree_mult1_0_result_add_0_0_BitSelect_for_a_c_19(DELAY,254)@18 + 1
    d_u0_m0_wo0_mtree_mult1_0_result_add_0_0_BitSelect_for_a_c_19 : dspba_delay
    GENERIC MAP ( width => 6, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_mtree_mult1_0_result_add_0_0_BitSelect_for_a_c, xout => d_u0_m0_wo0_mtree_mult1_0_result_add_0_0_BitSelect_for_a_c_19_q, clk => clk, aclr => areset );

    -- u0_m0_wo0_mtree_mult1_0_result_add_0_0_p2_of_2(ADD,165)@19 + 1
    u0_m0_wo0_mtree_mult1_0_result_add_0_0_p2_of_2_cin <= u0_m0_wo0_mtree_mult1_0_result_add_0_0_p1_of_2_c;
    u0_m0_wo0_mtree_mult1_0_result_add_0_0_p2_of_2_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((6 downto 6 => d_u0_m0_wo0_mtree_mult1_0_result_add_0_0_BitSelect_for_a_c_19_q(5)) & d_u0_m0_wo0_mtree_mult1_0_result_add_0_0_BitSelect_for_a_c_19_q) & '1');
    u0_m0_wo0_mtree_mult1_0_result_add_0_0_p2_of_2_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((6 downto 6 => d_u0_m0_wo0_mtree_mult1_0_result_add_0_0_BitSelect_for_b_c_19_q(5)) & d_u0_m0_wo0_mtree_mult1_0_result_add_0_0_BitSelect_for_b_c_19_q) & u0_m0_wo0_mtree_mult1_0_result_add_0_0_p2_of_2_cin(0));
    u0_m0_wo0_mtree_mult1_0_result_add_0_0_p2_of_2_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_0_result_add_0_0_p2_of_2_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_0_result_add_0_0_p2_of_2_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_0_result_add_0_0_p2_of_2_a) + SIGNED(u0_m0_wo0_mtree_mult1_0_result_add_0_0_p2_of_2_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_0_result_add_0_0_p2_of_2_q <= u0_m0_wo0_mtree_mult1_0_result_add_0_0_p2_of_2_o(6 downto 1);

    -- u0_m0_wo0_mtree_mult1_0_result_add_1_0_BitSelect_for_a_BitJoin_for_c(BITJOIN,227)@20
    u0_m0_wo0_mtree_mult1_0_result_add_1_0_BitSelect_for_a_BitJoin_for_c_q <= u0_m0_wo0_mtree_mult1_0_result_add_1_0_BitSelect_for_a_tessel1_1_b & u0_m0_wo0_mtree_mult1_0_result_add_0_0_p2_of_2_q;

    -- u0_m0_wo0_mtree_mult1_0_result_add_1_0_p2_of_2(ADD,176)@20 + 1
    u0_m0_wo0_mtree_mult1_0_result_add_1_0_p2_of_2_cin <= u0_m0_wo0_mtree_mult1_0_result_add_1_0_p1_of_2_c;
    u0_m0_wo0_mtree_mult1_0_result_add_1_0_p2_of_2_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((7 downto 7 => u0_m0_wo0_mtree_mult1_0_result_add_1_0_BitSelect_for_a_BitJoin_for_c_q(6)) & u0_m0_wo0_mtree_mult1_0_result_add_1_0_BitSelect_for_a_BitJoin_for_c_q) & '1');
    u0_m0_wo0_mtree_mult1_0_result_add_1_0_p2_of_2_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((7 downto 7 => d_u0_m0_wo0_mtree_mult1_0_result_add_1_0_BitSelect_for_b_c_20_q(6)) & d_u0_m0_wo0_mtree_mult1_0_result_add_1_0_BitSelect_for_b_c_20_q) & u0_m0_wo0_mtree_mult1_0_result_add_1_0_p2_of_2_cin(0));
    u0_m0_wo0_mtree_mult1_0_result_add_1_0_p2_of_2_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_0_result_add_1_0_p2_of_2_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_0_result_add_1_0_p2_of_2_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_0_result_add_1_0_p2_of_2_a) + SIGNED(u0_m0_wo0_mtree_mult1_0_result_add_1_0_p2_of_2_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_0_result_add_1_0_p2_of_2_q <= u0_m0_wo0_mtree_mult1_0_result_add_1_0_p2_of_2_o(7 downto 1);

    -- u0_m0_wo0_mtree_add0_0_BitSelect_for_a_tessel1_1(BITSELECT,185)@21
    u0_m0_wo0_mtree_add0_0_BitSelect_for_a_tessel1_1_b <= STD_LOGIC_VECTOR(u0_m0_wo0_mtree_mult1_0_result_add_1_0_p2_of_2_q(4 downto 4));

    -- u0_m0_wo0_mtree_add0_0_BitSelect_for_a_tessel1_0(BITSELECT,184)@21
    u0_m0_wo0_mtree_add0_0_BitSelect_for_a_tessel1_0_b <= STD_LOGIC_VECTOR(u0_m0_wo0_mtree_mult1_0_result_add_1_0_p2_of_2_q(4 downto 0));

    -- u0_m0_wo0_mtree_add0_0_BitSelect_for_a_BitJoin_for_c(BITJOIN,186)@21
    u0_m0_wo0_mtree_add0_0_BitSelect_for_a_BitJoin_for_c_q <= u0_m0_wo0_mtree_add0_0_BitSelect_for_a_tessel1_1_b & u0_m0_wo0_mtree_add0_0_BitSelect_for_a_tessel1_0_b;

    -- u0_m0_wo0_mtree_add0_0_p2_of_2(ADD,120)@21 + 1
    u0_m0_wo0_mtree_add0_0_p2_of_2_cin <= u0_m0_wo0_mtree_add0_0_p1_of_2_c;
    u0_m0_wo0_mtree_add0_0_p2_of_2_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((6 downto 6 => u0_m0_wo0_mtree_add0_0_BitSelect_for_a_BitJoin_for_c_q(5)) & u0_m0_wo0_mtree_add0_0_BitSelect_for_a_BitJoin_for_c_q) & '1');
    u0_m0_wo0_mtree_add0_0_p2_of_2_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((6 downto 6 => u0_m0_wo0_mtree_add0_0_BitSelect_for_b_BitJoin_for_c_q(5)) & u0_m0_wo0_mtree_add0_0_BitSelect_for_b_BitJoin_for_c_q) & u0_m0_wo0_mtree_add0_0_p2_of_2_cin(0));
    u0_m0_wo0_mtree_add0_0_p2_of_2_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add0_0_p2_of_2_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add0_0_p2_of_2_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add0_0_p2_of_2_a) + SIGNED(u0_m0_wo0_mtree_add0_0_p2_of_2_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add0_0_p2_of_2_q <= u0_m0_wo0_mtree_add0_0_p2_of_2_o(6 downto 1);

    -- u0_m0_wo0_accum_BitSelect_for_a_BitJoin_for_c(BITJOIN,202)@22
    u0_m0_wo0_accum_BitSelect_for_a_BitJoin_for_c_q <= u0_m0_wo0_accum_BitSelect_for_a_tessel1_1_b & u0_m0_wo0_accum_BitSelect_for_a_tessel1_1_b & u0_m0_wo0_accum_BitSelect_for_a_tessel1_1_b & u0_m0_wo0_accum_BitSelect_for_a_tessel1_1_b & u0_m0_wo0_accum_BitSelect_for_a_tessel1_1_b & u0_m0_wo0_accum_BitSelect_for_a_tessel1_1_b & u0_m0_wo0_accum_BitSelect_for_a_tessel1_1_b & u0_m0_wo0_mtree_add0_0_p2_of_2_q;

    -- u0_m0_wo0_accum_p2_of_2(ADD,132)@22 + 1
    u0_m0_wo0_accum_p2_of_2_cin <= u0_m0_wo0_accum_p1_of_2_c;
    u0_m0_wo0_accum_p2_of_2_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((13 downto 13 => u0_m0_wo0_accum_BitSelect_for_a_BitJoin_for_c_q(12)) & u0_m0_wo0_accum_BitSelect_for_a_BitJoin_for_c_q) & '1');
    u0_m0_wo0_accum_p2_of_2_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((13 downto 13 => u0_m0_wo0_adelay_p1_q(12)) & u0_m0_wo0_adelay_p1_q) & u0_m0_wo0_accum_p2_of_2_cin(0));
    u0_m0_wo0_accum_p2_of_2_i <= u0_m0_wo0_accum_p2_of_2_a;
    u0_m0_wo0_accum_p2_of_2_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_accum_p2_of_2_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (d_u0_m0_wo0_compute_q_22_q = "1") THEN
                IF (d_u0_m0_wo0_aseq_q_22_q = "1") THEN
                    u0_m0_wo0_accum_p2_of_2_o <= u0_m0_wo0_accum_p2_of_2_i;
                ELSE
                    u0_m0_wo0_accum_p2_of_2_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_accum_p2_of_2_a) + SIGNED(u0_m0_wo0_accum_p2_of_2_b));
                END IF;
            END IF;
        END IF;
    END PROCESS;
    u0_m0_wo0_accum_p2_of_2_q <= u0_m0_wo0_accum_p2_of_2_o(13 downto 1);

    -- d_u0_m0_wo0_accum_p1_of_2_q_23(DELAY,250)@22 + 1
    d_u0_m0_wo0_accum_p1_of_2_q_23 : dspba_delay
    GENERIC MAP ( width => 49, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_accum_p1_of_2_q, xout => d_u0_m0_wo0_accum_p1_of_2_q_23_q, clk => clk, aclr => areset );

    -- u0_m0_wo0_accum_BitJoin_for_q(BITJOIN,133)@23
    u0_m0_wo0_accum_BitJoin_for_q_q <= u0_m0_wo0_accum_p2_of_2_q & d_u0_m0_wo0_accum_p1_of_2_q_23_q;

    -- u0_m0_wo0_oseq(SEQUENCE,53)@20 + 1
    u0_m0_wo0_oseq_clkproc: PROCESS (clk, areset)
        variable u0_m0_wo0_oseq_c : SIGNED(10 downto 0);
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_oseq_c := "00100000000";
            u0_m0_wo0_oseq_q <= "0";
            u0_m0_wo0_oseq_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (d_u0_m0_wo0_compute_q_20_q = "1") THEN
                IF (u0_m0_wo0_oseq_c = "11111111101") THEN
                    u0_m0_wo0_oseq_eq <= '1';
                ELSE
                    u0_m0_wo0_oseq_eq <= '0';
                END IF;
                IF (u0_m0_wo0_oseq_eq = '1') THEN
                    u0_m0_wo0_oseq_c := u0_m0_wo0_oseq_c + 259;
                ELSE
                    u0_m0_wo0_oseq_c := u0_m0_wo0_oseq_c - 1;
                END IF;
                u0_m0_wo0_oseq_q <= STD_LOGIC_VECTOR(u0_m0_wo0_oseq_c(10 downto 10));
            END IF;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_oseq_gated(LOGICAL,54)@21
    u0_m0_wo0_oseq_gated_q <= u0_m0_wo0_oseq_q and d_u0_m0_wo0_compute_q_21_q;

    -- u0_m0_wo0_oseq_gated_reg(REG,55)@21 + 1
    u0_m0_wo0_oseq_gated_reg_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_oseq_gated_reg_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_oseq_gated_reg_q <= STD_LOGIC_VECTOR(u0_m0_wo0_oseq_gated_q);
        END IF;
    END PROCESS;

    -- outchan(COUNTER,60)@22 + 1
    -- low=0, high=3, step=1, init=3
    outchan_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            outchan_i <= TO_UNSIGNED(3, 2);
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_oseq_gated_reg_q = "1") THEN
                outchan_i <= outchan_i + 1;
            END IF;
        END IF;
    END PROCESS;
    outchan_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(outchan_i, 3)));

    -- d_out0_m0_wo0_assign_id3_q_23(DELAY,247)@22 + 1
    d_out0_m0_wo0_assign_id3_q_23 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_oseq_gated_reg_q, xout => d_out0_m0_wo0_assign_id3_q_23_q, clk => clk, aclr => areset );

    -- xOut(PORTOUT,61)@23 + 1
    xOut_v <= d_out0_m0_wo0_assign_id3_q_23_q;
    xOut_c <= STD_LOGIC_VECTOR("00000" & outchan_q);
    xOut_0 <= u0_m0_wo0_accum_BitJoin_for_q_q;

END normal;
