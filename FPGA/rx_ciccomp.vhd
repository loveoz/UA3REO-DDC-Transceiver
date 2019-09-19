-- -------------------------------------------------------------
--
-- Module: rx_ciccomp
-- Generated by MATLAB(R) 9.6 and Filter Design HDL Coder 3.1.5.
-- Generated on: 2019-09-18 12:48:04
-- -------------------------------------------------------------

-- -------------------------------------------------------------
-- HDL Code Generation Options:
--
-- TargetLanguage: VHDL
-- OptimizeForHDL: on
-- EDAScriptGeneration: off
-- Name: rx_ciccomp
-- SerialPartition: 17
-- TestBenchName: rx_ciccomp_tb
-- TestBenchStimulus: step ramp chirp noise 
-- GenerateHDLTestBench: off

-- Filter Specifications:
--
-- Sample Rate            : N/A (normalized frequency)
-- Response               : CIC Compensator
-- Specification          : N,Fp,Fst
-- Decimation Factor      : 2
-- Multirate Type         : Decimator
-- Passband Edge          : 0.45
-- Differential Delay     : 1
-- Filter Order           : 64
-- Stopband Edge          : 0.55
-- Number of Sections     : 5
-- CIC Rate Change Factor : 512
-- -------------------------------------------------------------

-- -------------------------------------------------------------
-- HDL Implementation    : Fully Serial
-- Folding Factor        : 17
-- -------------------------------------------------------------
-- Filter Settings:
--
-- Discrete-Time FIR Multirate Filter (real)
-- -----------------------------------------
-- Filter Structure   : Direct-Form FIR Polyphase Decimator
-- Decimation Factor  : 2
-- Polyphase Length   : 33
-- Filter Length      : 65
-- Stable             : Yes
-- Linear Phase       : Yes (Type 1)
--
-- Arithmetic         : fixed
-- Numerator          : s32,31 -> [-1 1)
-- -------------------------------------------------------------



LIBRARY IEEE;
USE IEEE.std_logic_1164.all;
USE IEEE.numeric_std.ALL;

ENTITY rx_ciccomp IS
   PORT( clk                             :   IN    std_logic; 
         clk_enable                      :   IN    std_logic; 
         reset                           :   IN    std_logic; 
         filter_in                       :   IN    std_logic_vector(31 DOWNTO 0); -- sfix32_En31
         filter_out                      :   OUT   std_logic_vector(15 DOWNTO 0); -- sfix16_En15
         ce_out                          :   OUT   std_logic  
         );

END rx_ciccomp;


----------------------------------------------------------------
--Module Architecture: rx_ciccomp
----------------------------------------------------------------
ARCHITECTURE rtl OF rx_ciccomp IS
  -- Local Functions
  -- Type Definitions
  TYPE input_pipeline_type IS ARRAY (NATURAL range <>) OF signed(31 DOWNTO 0); -- sfix32_En31
  -- Constants
  CONSTANT const_one                      : std_logic := '1'; -- boolean
  CONSTANT coeffphase1_1                  : signed(31 DOWNTO 0) := to_signed(39525, 32); -- sfix32_En31
  CONSTANT coeffphase1_2                  : signed(31 DOWNTO 0) := to_signed(-89326, 32); -- sfix32_En31
  CONSTANT coeffphase1_3                  : signed(31 DOWNTO 0) := to_signed(133401, 32); -- sfix32_En31
  CONSTANT coeffphase1_4                  : signed(31 DOWNTO 0) := to_signed(-218155, 32); -- sfix32_En31
  CONSTANT coeffphase1_5                  : signed(31 DOWNTO 0) := to_signed(341331, 32); -- sfix32_En31
  CONSTANT coeffphase1_6                  : signed(31 DOWNTO 0) := to_signed(-522734, 32); -- sfix32_En31
  CONSTANT coeffphase1_7                  : signed(31 DOWNTO 0) := to_signed(784311, 32); -- sfix32_En31
  CONSTANT coeffphase1_8                  : signed(31 DOWNTO 0) := to_signed(-1166121, 32); -- sfix32_En31
  CONSTANT coeffphase1_9                  : signed(31 DOWNTO 0) := to_signed(1730321, 32); -- sfix32_En31
  CONSTANT coeffphase1_10                 : signed(31 DOWNTO 0) := to_signed(-2589537, 32); -- sfix32_En31
  CONSTANT coeffphase1_11                 : signed(31 DOWNTO 0) := to_signed(3946782, 32); -- sfix32_En31
  CONSTANT coeffphase1_12                 : signed(31 DOWNTO 0) := to_signed(-6224447, 32); -- sfix32_En31
  CONSTANT coeffphase1_13                 : signed(31 DOWNTO 0) := to_signed(10404237, 32); -- sfix32_En31
  CONSTANT coeffphase1_14                 : signed(31 DOWNTO 0) := to_signed(-19213857, 32); -- sfix32_En31
  CONSTANT coeffphase1_15                 : signed(31 DOWNTO 0) := to_signed(42597314, 32); -- sfix32_En31
  CONSTANT coeffphase1_16                 : signed(31 DOWNTO 0) := to_signed(-138933897, 32); -- sfix32_En31
  CONSTANT coeffphase1_17                 : signed(31 DOWNTO 0) := to_signed(1291703525, 32); -- sfix32_En31
  CONSTANT coeffphase1_18                 : signed(31 DOWNTO 0) := to_signed(-138933897, 32); -- sfix32_En31
  CONSTANT coeffphase1_19                 : signed(31 DOWNTO 0) := to_signed(42597314, 32); -- sfix32_En31
  CONSTANT coeffphase1_20                 : signed(31 DOWNTO 0) := to_signed(-19213857, 32); -- sfix32_En31
  CONSTANT coeffphase1_21                 : signed(31 DOWNTO 0) := to_signed(10404237, 32); -- sfix32_En31
  CONSTANT coeffphase1_22                 : signed(31 DOWNTO 0) := to_signed(-6224447, 32); -- sfix32_En31
  CONSTANT coeffphase1_23                 : signed(31 DOWNTO 0) := to_signed(3946782, 32); -- sfix32_En31
  CONSTANT coeffphase1_24                 : signed(31 DOWNTO 0) := to_signed(-2589537, 32); -- sfix32_En31
  CONSTANT coeffphase1_25                 : signed(31 DOWNTO 0) := to_signed(1730321, 32); -- sfix32_En31
  CONSTANT coeffphase1_26                 : signed(31 DOWNTO 0) := to_signed(-1166121, 32); -- sfix32_En31
  CONSTANT coeffphase1_27                 : signed(31 DOWNTO 0) := to_signed(784311, 32); -- sfix32_En31
  CONSTANT coeffphase1_28                 : signed(31 DOWNTO 0) := to_signed(-522734, 32); -- sfix32_En31
  CONSTANT coeffphase1_29                 : signed(31 DOWNTO 0) := to_signed(341331, 32); -- sfix32_En31
  CONSTANT coeffphase1_30                 : signed(31 DOWNTO 0) := to_signed(-218155, 32); -- sfix32_En31
  CONSTANT coeffphase1_31                 : signed(31 DOWNTO 0) := to_signed(133401, 32); -- sfix32_En31
  CONSTANT coeffphase1_32                 : signed(31 DOWNTO 0) := to_signed(-89326, 32); -- sfix32_En31
  CONSTANT coeffphase1_33                 : signed(31 DOWNTO 0) := to_signed(39525, 32); -- sfix32_En31
  CONSTANT coeffphase2_1                  : signed(31 DOWNTO 0) := to_signed(-4036440, 32); -- sfix32_En31
  CONSTANT coeffphase2_2                  : signed(31 DOWNTO 0) := to_signed(4587229, 32); -- sfix32_En31
  CONSTANT coeffphase2_3                  : signed(31 DOWNTO 0) := to_signed(-7092565, 32); -- sfix32_En31
  CONSTANT coeffphase2_4                  : signed(31 DOWNTO 0) := to_signed(10414685, 32); -- sfix32_En31
  CONSTANT coeffphase2_5                  : signed(31 DOWNTO 0) := to_signed(-14725292, 32); -- sfix32_En31
  CONSTANT coeffphase2_6                  : signed(31 DOWNTO 0) := to_signed(20237243, 32); -- sfix32_En31
  CONSTANT coeffphase2_7                  : signed(31 DOWNTO 0) := to_signed(-27220731, 32); -- sfix32_En31
  CONSTANT coeffphase2_8                  : signed(31 DOWNTO 0) := to_signed(36044825, 32); -- sfix32_En31
  CONSTANT coeffphase2_9                  : signed(31 DOWNTO 0) := to_signed(-47243066, 32); -- sfix32_En31
  CONSTANT coeffphase2_10                 : signed(31 DOWNTO 0) := to_signed(61656586, 32); -- sfix32_En31
  CONSTANT coeffphase2_11                 : signed(31 DOWNTO 0) := to_signed(-80707428, 32); -- sfix32_En31
  CONSTANT coeffphase2_12                 : signed(31 DOWNTO 0) := to_signed(107040775, 32); -- sfix32_En31
  CONSTANT coeffphase2_13                 : signed(31 DOWNTO 0) := to_signed(-146167827, 32); -- sfix32_En31
  CONSTANT coeffphase2_14                 : signed(31 DOWNTO 0) := to_signed(211627556, 32); -- sfix32_En31
  CONSTANT coeffphase2_15                 : signed(31 DOWNTO 0) := to_signed(-346187385, 32); -- sfix32_En31
  CONSTANT coeffphase2_16                 : signed(31 DOWNTO 0) := to_signed(756368485, 32); -- sfix32_En31
  CONSTANT coeffphase2_17                 : signed(31 DOWNTO 0) := to_signed(756368485, 32); -- sfix32_En31
  CONSTANT coeffphase2_18                 : signed(31 DOWNTO 0) := to_signed(-346187385, 32); -- sfix32_En31
  CONSTANT coeffphase2_19                 : signed(31 DOWNTO 0) := to_signed(211627556, 32); -- sfix32_En31
  CONSTANT coeffphase2_20                 : signed(31 DOWNTO 0) := to_signed(-146167827, 32); -- sfix32_En31
  CONSTANT coeffphase2_21                 : signed(31 DOWNTO 0) := to_signed(107040775, 32); -- sfix32_En31
  CONSTANT coeffphase2_22                 : signed(31 DOWNTO 0) := to_signed(-80707428, 32); -- sfix32_En31
  CONSTANT coeffphase2_23                 : signed(31 DOWNTO 0) := to_signed(61656586, 32); -- sfix32_En31
  CONSTANT coeffphase2_24                 : signed(31 DOWNTO 0) := to_signed(-47243066, 32); -- sfix32_En31
  CONSTANT coeffphase2_25                 : signed(31 DOWNTO 0) := to_signed(36044825, 32); -- sfix32_En31
  CONSTANT coeffphase2_26                 : signed(31 DOWNTO 0) := to_signed(-27220731, 32); -- sfix32_En31
  CONSTANT coeffphase2_27                 : signed(31 DOWNTO 0) := to_signed(20237243, 32); -- sfix32_En31
  CONSTANT coeffphase2_28                 : signed(31 DOWNTO 0) := to_signed(-14725292, 32); -- sfix32_En31
  CONSTANT coeffphase2_29                 : signed(31 DOWNTO 0) := to_signed(10414685, 32); -- sfix32_En31
  CONSTANT coeffphase2_30                 : signed(31 DOWNTO 0) := to_signed(-7092565, 32); -- sfix32_En31
  CONSTANT coeffphase2_31                 : signed(31 DOWNTO 0) := to_signed(4587229, 32); -- sfix32_En31
  CONSTANT coeffphase2_32                 : signed(31 DOWNTO 0) := to_signed(-4036440, 32); -- sfix32_En31
  CONSTANT coeffphase2_33                 : signed(31 DOWNTO 0) := to_signed(0, 32); -- sfix32_En31

  CONSTANT const_zero                     : signed(64 DOWNTO 0) := to_signed(0, 65); -- sfix65_En62
  -- Signals
  SIGNAL cur_count                        : unsigned(5 DOWNTO 0); -- ufix6
  SIGNAL phase_0                          : std_logic; -- boolean
  SIGNAL phase_1                          : std_logic; -- boolean
  SIGNAL phase_17                         : std_logic; -- boolean
  SIGNAL phase_18                         : std_logic; -- boolean
  SIGNAL phase_temp                       : std_logic; -- boolean
  SIGNAL phase_reg_temp                   : std_logic; -- boolean
  SIGNAL phase_reg                        : std_logic; -- boolean
  SIGNAL int_delay_pipe                   : std_logic_vector(0 TO 33); -- boolean
  SIGNAL ce_out_reg                       : std_logic; -- boolean
  SIGNAL input_register                   : signed(31 DOWNTO 0); -- sfix32_En31
  SIGNAL input_pipeline_phase0            : input_pipeline_type(0 TO 32); -- sfix32_En31
  SIGNAL input_pipeline_phase1            : input_pipeline_type(0 TO 32); -- sfix32_En31
  SIGNAL tapsum_0_0and0_32                : signed(32 DOWNTO 0); -- sfix33_En31
  SIGNAL tapsum_0_1and0_31                : signed(32 DOWNTO 0); -- sfix33_En31
  SIGNAL tapsum_0_2and0_30                : signed(32 DOWNTO 0); -- sfix33_En31
  SIGNAL tapsum_0_3and0_29                : signed(32 DOWNTO 0); -- sfix33_En31
  SIGNAL tapsum_0_4and0_28                : signed(32 DOWNTO 0); -- sfix33_En31
  SIGNAL tapsum_0_5and0_27                : signed(32 DOWNTO 0); -- sfix33_En31
  SIGNAL tapsum_0_6and0_26                : signed(32 DOWNTO 0); -- sfix33_En31
  SIGNAL tapsum_0_7and0_25                : signed(32 DOWNTO 0); -- sfix33_En31
  SIGNAL tapsum_0_8and0_24                : signed(32 DOWNTO 0); -- sfix33_En31
  SIGNAL tapsum_0_9and0_23                : signed(32 DOWNTO 0); -- sfix33_En31
  SIGNAL tapsum_0_10and0_22               : signed(32 DOWNTO 0); -- sfix33_En31
  SIGNAL tapsum_0_11and0_21               : signed(32 DOWNTO 0); -- sfix33_En31
  SIGNAL tapsum_0_12and0_20               : signed(32 DOWNTO 0); -- sfix33_En31
  SIGNAL tapsum_0_13and0_19               : signed(32 DOWNTO 0); -- sfix33_En31
  SIGNAL tapsum_0_14and0_18               : signed(32 DOWNTO 0); -- sfix33_En31
  SIGNAL tapsum_0_15and0_17               : signed(32 DOWNTO 0); -- sfix33_En31
  SIGNAL tapsum_1_0and1_31                : signed(32 DOWNTO 0); -- sfix33_En31
  SIGNAL tapsum_1_1and1_30                : signed(32 DOWNTO 0); -- sfix33_En31
  SIGNAL tapsum_1_2and1_29                : signed(32 DOWNTO 0); -- sfix33_En31
  SIGNAL tapsum_1_3and1_28                : signed(32 DOWNTO 0); -- sfix33_En31
  SIGNAL tapsum_1_4and1_27                : signed(32 DOWNTO 0); -- sfix33_En31
  SIGNAL tapsum_1_5and1_26                : signed(32 DOWNTO 0); -- sfix33_En31
  SIGNAL tapsum_1_6and1_25                : signed(32 DOWNTO 0); -- sfix33_En31
  SIGNAL tapsum_1_7and1_24                : signed(32 DOWNTO 0); -- sfix33_En31
  SIGNAL tapsum_1_8and1_23                : signed(32 DOWNTO 0); -- sfix33_En31
  SIGNAL tapsum_1_9and1_22                : signed(32 DOWNTO 0); -- sfix33_En31
  SIGNAL tapsum_1_10and1_21               : signed(32 DOWNTO 0); -- sfix33_En31
  SIGNAL tapsum_1_11and1_20               : signed(32 DOWNTO 0); -- sfix33_En31
  SIGNAL tapsum_1_12and1_19               : signed(32 DOWNTO 0); -- sfix33_En31
  SIGNAL tapsum_1_13and1_18               : signed(32 DOWNTO 0); -- sfix33_En31
  SIGNAL tapsum_1_14and1_17               : signed(32 DOWNTO 0); -- sfix33_En31
  SIGNAL tapsum_1_15and1_16               : signed(32 DOWNTO 0); -- sfix33_En31
  SIGNAL input_pipeline_phase016_cast     : signed(32 DOWNTO 0); -- sfix33_En31
  SIGNAL inputmux                         : signed(32 DOWNTO 0); -- sfix33_En31
  SIGNAL product                          : signed(64 DOWNTO 0); -- sfix65_En62
  SIGNAL product_mux                      : signed(31 DOWNTO 0); -- sfix32_En31
  SIGNAL phasemux                         : signed(64 DOWNTO 0); -- sfix65_En62
  SIGNAL sumofproducts                    : signed(64 DOWNTO 0); -- sfix65_En62
  SIGNAL sumofproducts_cast               : signed(80 DOWNTO 0); -- sfix81_En62
  SIGNAL acc_sum                          : signed(80 DOWNTO 0); -- sfix81_En62
  SIGNAL accreg_in                        : signed(80 DOWNTO 0); -- sfix81_En62
  SIGNAL accreg_out                       : signed(80 DOWNTO 0); -- sfix81_En62
  SIGNAL add_temp                         : signed(81 DOWNTO 0); -- sfix82_En62
  SIGNAL accreg_final                     : signed(80 DOWNTO 0); -- sfix81_En62
  SIGNAL output_typeconvert               : signed(15 DOWNTO 0); -- sfix16_En15
  SIGNAL output_register                  : signed(15 DOWNTO 0); -- sfix16_En15


BEGIN

  -- Block Statements
  Counter : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      cur_count <= to_unsigned(33, 6);
    ELSIF clk'event AND clk = '1' THEN
      IF clk_enable = '1' THEN
        IF cur_count >= to_unsigned(33, 6) THEN
          cur_count <= to_unsigned(0, 6);
        ELSE
          cur_count <= cur_count + to_unsigned(1, 6);
        END IF;
      END IF;
    END IF; 
  END PROCESS Counter;

  phase_0 <= '1' WHEN cur_count = to_unsigned(0, 6) AND clk_enable = '1' ELSE '0';

  phase_1 <= '1' WHEN  (((cur_count = to_unsigned(1, 6))  OR
                         (cur_count = to_unsigned(2, 6))  OR
                         (cur_count = to_unsigned(3, 6))  OR
                         (cur_count = to_unsigned(4, 6))  OR
                         (cur_count = to_unsigned(5, 6))  OR
                         (cur_count = to_unsigned(6, 6))  OR
                         (cur_count = to_unsigned(7, 6))  OR
                         (cur_count = to_unsigned(8, 6))  OR
                         (cur_count = to_unsigned(9, 6))  OR
                         (cur_count = to_unsigned(10, 6))  OR
                         (cur_count = to_unsigned(11, 6))  OR
                         (cur_count = to_unsigned(12, 6))  OR
                         (cur_count = to_unsigned(13, 6))  OR
                         (cur_count = to_unsigned(14, 6))  OR
                         (cur_count = to_unsigned(15, 6))  OR
                         (cur_count = to_unsigned(16, 6))  OR
                         (cur_count = to_unsigned(17, 6))  OR
                         (cur_count = to_unsigned(18, 6))  OR
                         (cur_count = to_unsigned(19, 6))  OR
                         (cur_count = to_unsigned(20, 6))  OR
                         (cur_count = to_unsigned(21, 6))  OR
                         (cur_count = to_unsigned(22, 6))  OR
                         (cur_count = to_unsigned(23, 6))  OR
                         (cur_count = to_unsigned(24, 6))  OR
                         (cur_count = to_unsigned(25, 6))  OR
                         (cur_count = to_unsigned(26, 6))  OR
                         (cur_count = to_unsigned(27, 6))  OR
                         (cur_count = to_unsigned(28, 6))  OR
                         (cur_count = to_unsigned(29, 6))  OR
                         (cur_count = to_unsigned(30, 6))  OR
                         (cur_count = to_unsigned(31, 6))  OR
                         (cur_count = to_unsigned(32, 6))  OR
                         (cur_count = to_unsigned(33, 6)))  AND clk_enable = '1') ELSE '0';

  phase_17 <= '1' WHEN cur_count = to_unsigned(17, 6) AND clk_enable = '1' ELSE '0';

  phase_18 <= '1' WHEN cur_count = to_unsigned(18, 6) AND clk_enable = '1' ELSE '0';

  phase_temp <=  phase_0 AND const_one;

  ceout_delay_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      int_delay_pipe <= (OTHERS => '0');
    ELSIF clk'event AND clk = '1' THEN
      IF clk_enable = '1' THEN
        int_delay_pipe(1 TO 33) <= int_delay_pipe(0 TO 32);
        int_delay_pipe(0) <= phase_temp;
      END IF;
    END IF;
  END PROCESS ceout_delay_process;
  phase_reg_temp <= int_delay_pipe(33);

  phase_reg <=  phase_reg_temp AND phase_temp;

  ce_out_register_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      ce_out_reg <= '0';
    ELSIF clk'event AND clk = '1' THEN
      IF clk_enable = '1' THEN
        ce_out_reg <= phase_reg;
      END IF;
    END IF; 
  END PROCESS ce_out_register_process;

  input_reg_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      input_register <= (OTHERS => '0');
    ELSIF clk'event AND clk = '1' THEN
      IF clk_enable = '1' THEN
        input_register <= signed(filter_in);
      END IF;
    END IF; 
  END PROCESS input_reg_process;

  Delay_Pipeline_Phase0_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      input_pipeline_phase0(0 TO 32) <= (OTHERS => (OTHERS => '0'));
    ELSIF clk'event AND clk = '1' THEN
      IF phase_0 = '1' THEN
        input_pipeline_phase0(0) <= input_register;
        input_pipeline_phase0(1 TO 32) <= input_pipeline_phase0(0 TO 31);
      END IF;
    END IF; 
  END PROCESS Delay_Pipeline_Phase0_process;

  Delay_Pipeline_Phase1_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      input_pipeline_phase1(0 TO 32) <= (OTHERS => (OTHERS => '0'));
    ELSIF clk'event AND clk = '1' THEN
      IF phase_17 = '1' THEN
        input_pipeline_phase1(0) <= input_register;
        input_pipeline_phase1(1 TO 32) <= input_pipeline_phase1(0 TO 31);
      END IF;
    END IF; 
  END PROCESS Delay_Pipeline_Phase1_process;

  -- Adding (or subtracting) the taps based on the symmetry (or asymmetry)

  tapsum_0_0and0_32 <= resize(input_pipeline_phase0(0), 33) + resize(input_pipeline_phase0(32), 33);

  tapsum_0_1and0_31 <= resize(input_pipeline_phase0(1), 33) + resize(input_pipeline_phase0(31), 33);

  tapsum_0_2and0_30 <= resize(input_pipeline_phase0(2), 33) + resize(input_pipeline_phase0(30), 33);

  tapsum_0_3and0_29 <= resize(input_pipeline_phase0(3), 33) + resize(input_pipeline_phase0(29), 33);

  tapsum_0_4and0_28 <= resize(input_pipeline_phase0(4), 33) + resize(input_pipeline_phase0(28), 33);

  tapsum_0_5and0_27 <= resize(input_pipeline_phase0(5), 33) + resize(input_pipeline_phase0(27), 33);

  tapsum_0_6and0_26 <= resize(input_pipeline_phase0(6), 33) + resize(input_pipeline_phase0(26), 33);

  tapsum_0_7and0_25 <= resize(input_pipeline_phase0(7), 33) + resize(input_pipeline_phase0(25), 33);

  tapsum_0_8and0_24 <= resize(input_pipeline_phase0(8), 33) + resize(input_pipeline_phase0(24), 33);

  tapsum_0_9and0_23 <= resize(input_pipeline_phase0(9), 33) + resize(input_pipeline_phase0(23), 33);

  tapsum_0_10and0_22 <= resize(input_pipeline_phase0(10), 33) + resize(input_pipeline_phase0(22), 33);

  tapsum_0_11and0_21 <= resize(input_pipeline_phase0(11), 33) + resize(input_pipeline_phase0(21), 33);

  tapsum_0_12and0_20 <= resize(input_pipeline_phase0(12), 33) + resize(input_pipeline_phase0(20), 33);

  tapsum_0_13and0_19 <= resize(input_pipeline_phase0(13), 33) + resize(input_pipeline_phase0(19), 33);

  tapsum_0_14and0_18 <= resize(input_pipeline_phase0(14), 33) + resize(input_pipeline_phase0(18), 33);

  tapsum_0_15and0_17 <= resize(input_pipeline_phase0(15), 33) + resize(input_pipeline_phase0(17), 33);

  tapsum_1_0and1_31 <= resize(input_pipeline_phase1(0), 33) + resize(input_pipeline_phase1(31), 33);

  tapsum_1_1and1_30 <= resize(input_pipeline_phase1(1), 33) + resize(input_pipeline_phase1(30), 33);

  tapsum_1_2and1_29 <= resize(input_pipeline_phase1(2), 33) + resize(input_pipeline_phase1(29), 33);

  tapsum_1_3and1_28 <= resize(input_pipeline_phase1(3), 33) + resize(input_pipeline_phase1(28), 33);

  tapsum_1_4and1_27 <= resize(input_pipeline_phase1(4), 33) + resize(input_pipeline_phase1(27), 33);

  tapsum_1_5and1_26 <= resize(input_pipeline_phase1(5), 33) + resize(input_pipeline_phase1(26), 33);

  tapsum_1_6and1_25 <= resize(input_pipeline_phase1(6), 33) + resize(input_pipeline_phase1(25), 33);

  tapsum_1_7and1_24 <= resize(input_pipeline_phase1(7), 33) + resize(input_pipeline_phase1(24), 33);

  tapsum_1_8and1_23 <= resize(input_pipeline_phase1(8), 33) + resize(input_pipeline_phase1(23), 33);

  tapsum_1_9and1_22 <= resize(input_pipeline_phase1(9), 33) + resize(input_pipeline_phase1(22), 33);

  tapsum_1_10and1_21 <= resize(input_pipeline_phase1(10), 33) + resize(input_pipeline_phase1(21), 33);

  tapsum_1_11and1_20 <= resize(input_pipeline_phase1(11), 33) + resize(input_pipeline_phase1(20), 33);

  tapsum_1_12and1_19 <= resize(input_pipeline_phase1(12), 33) + resize(input_pipeline_phase1(19), 33);

  tapsum_1_13and1_18 <= resize(input_pipeline_phase1(13), 33) + resize(input_pipeline_phase1(18), 33);

  tapsum_1_14and1_17 <= resize(input_pipeline_phase1(14), 33) + resize(input_pipeline_phase1(17), 33);

  tapsum_1_15and1_16 <= resize(input_pipeline_phase1(15), 33) + resize(input_pipeline_phase1(16), 33);

  -- Mux(es) to select the input taps for multipliers 

  input_pipeline_phase016_cast <= resize(input_pipeline_phase0(16), 33);

  inputmux <= tapsum_0_0and0_32 WHEN ( cur_count = to_unsigned(1, 6) ) ELSE
                   tapsum_0_1and0_31 WHEN ( cur_count = to_unsigned(2, 6) ) ELSE
                   tapsum_0_2and0_30 WHEN ( cur_count = to_unsigned(3, 6) ) ELSE
                   tapsum_0_3and0_29 WHEN ( cur_count = to_unsigned(4, 6) ) ELSE
                   tapsum_0_4and0_28 WHEN ( cur_count = to_unsigned(5, 6) ) ELSE
                   tapsum_0_5and0_27 WHEN ( cur_count = to_unsigned(6, 6) ) ELSE
                   tapsum_0_6and0_26 WHEN ( cur_count = to_unsigned(7, 6) ) ELSE
                   tapsum_0_7and0_25 WHEN ( cur_count = to_unsigned(8, 6) ) ELSE
                   tapsum_0_8and0_24 WHEN ( cur_count = to_unsigned(9, 6) ) ELSE
                   tapsum_0_9and0_23 WHEN ( cur_count = to_unsigned(10, 6) ) ELSE
                   tapsum_0_10and0_22 WHEN ( cur_count = to_unsigned(11, 6) ) ELSE
                   tapsum_0_11and0_21 WHEN ( cur_count = to_unsigned(12, 6) ) ELSE
                   tapsum_0_12and0_20 WHEN ( cur_count = to_unsigned(13, 6) ) ELSE
                   tapsum_0_13and0_19 WHEN ( cur_count = to_unsigned(14, 6) ) ELSE
                   tapsum_0_14and0_18 WHEN ( cur_count = to_unsigned(15, 6) ) ELSE
                   tapsum_0_15and0_17 WHEN ( cur_count = to_unsigned(16, 6) ) ELSE
                   input_pipeline_phase016_cast WHEN ( cur_count = to_unsigned(17, 6) ) ELSE
                   tapsum_1_0and1_31 WHEN ( cur_count = to_unsigned(18, 6) ) ELSE
                   tapsum_1_1and1_30 WHEN ( cur_count = to_unsigned(19, 6) ) ELSE
                   tapsum_1_2and1_29 WHEN ( cur_count = to_unsigned(20, 6) ) ELSE
                   tapsum_1_3and1_28 WHEN ( cur_count = to_unsigned(21, 6) ) ELSE
                   tapsum_1_4and1_27 WHEN ( cur_count = to_unsigned(22, 6) ) ELSE
                   tapsum_1_5and1_26 WHEN ( cur_count = to_unsigned(23, 6) ) ELSE
                   tapsum_1_6and1_25 WHEN ( cur_count = to_unsigned(24, 6) ) ELSE
                   tapsum_1_7and1_24 WHEN ( cur_count = to_unsigned(25, 6) ) ELSE
                   tapsum_1_8and1_23 WHEN ( cur_count = to_unsigned(26, 6) ) ELSE
                   tapsum_1_9and1_22 WHEN ( cur_count = to_unsigned(27, 6) ) ELSE
                   tapsum_1_10and1_21 WHEN ( cur_count = to_unsigned(28, 6) ) ELSE
                   tapsum_1_11and1_20 WHEN ( cur_count = to_unsigned(29, 6) ) ELSE
                   tapsum_1_12and1_19 WHEN ( cur_count = to_unsigned(30, 6) ) ELSE
                   tapsum_1_13and1_18 WHEN ( cur_count = to_unsigned(31, 6) ) ELSE
                   tapsum_1_14and1_17 WHEN ( cur_count = to_unsigned(32, 6) ) ELSE
                   tapsum_1_15and1_16;

  product_mux <= coeffphase1_1 WHEN ( cur_count = to_unsigned(1, 6) ) ELSE
                      coeffphase1_2 WHEN ( cur_count = to_unsigned(2, 6) ) ELSE
                      coeffphase1_3 WHEN ( cur_count = to_unsigned(3, 6) ) ELSE
                      coeffphase1_4 WHEN ( cur_count = to_unsigned(4, 6) ) ELSE
                      coeffphase1_5 WHEN ( cur_count = to_unsigned(5, 6) ) ELSE
                      coeffphase1_6 WHEN ( cur_count = to_unsigned(6, 6) ) ELSE
                      coeffphase1_7 WHEN ( cur_count = to_unsigned(7, 6) ) ELSE
                      coeffphase1_8 WHEN ( cur_count = to_unsigned(8, 6) ) ELSE
                      coeffphase1_9 WHEN ( cur_count = to_unsigned(9, 6) ) ELSE
                      coeffphase1_10 WHEN ( cur_count = to_unsigned(10, 6) ) ELSE
                      coeffphase1_11 WHEN ( cur_count = to_unsigned(11, 6) ) ELSE
                      coeffphase1_12 WHEN ( cur_count = to_unsigned(12, 6) ) ELSE
                      coeffphase1_13 WHEN ( cur_count = to_unsigned(13, 6) ) ELSE
                      coeffphase1_14 WHEN ( cur_count = to_unsigned(14, 6) ) ELSE
                      coeffphase1_15 WHEN ( cur_count = to_unsigned(15, 6) ) ELSE
                      coeffphase1_16 WHEN ( cur_count = to_unsigned(16, 6) ) ELSE
                      coeffphase1_17 WHEN ( cur_count = to_unsigned(17, 6) ) ELSE
                      coeffphase2_1 WHEN ( cur_count = to_unsigned(18, 6) ) ELSE
                      coeffphase2_2 WHEN ( cur_count = to_unsigned(19, 6) ) ELSE
                      coeffphase2_3 WHEN ( cur_count = to_unsigned(20, 6) ) ELSE
                      coeffphase2_4 WHEN ( cur_count = to_unsigned(21, 6) ) ELSE
                      coeffphase2_5 WHEN ( cur_count = to_unsigned(22, 6) ) ELSE
                      coeffphase2_6 WHEN ( cur_count = to_unsigned(23, 6) ) ELSE
                      coeffphase2_7 WHEN ( cur_count = to_unsigned(24, 6) ) ELSE
                      coeffphase2_8 WHEN ( cur_count = to_unsigned(25, 6) ) ELSE
                      coeffphase2_9 WHEN ( cur_count = to_unsigned(26, 6) ) ELSE
                      coeffphase2_10 WHEN ( cur_count = to_unsigned(27, 6) ) ELSE
                      coeffphase2_11 WHEN ( cur_count = to_unsigned(28, 6) ) ELSE
                      coeffphase2_12 WHEN ( cur_count = to_unsigned(29, 6) ) ELSE
                      coeffphase2_13 WHEN ( cur_count = to_unsigned(30, 6) ) ELSE
                      coeffphase2_14 WHEN ( cur_count = to_unsigned(31, 6) ) ELSE
                      coeffphase2_15 WHEN ( cur_count = to_unsigned(32, 6) ) ELSE
                      coeffphase2_16;
  product <= inputmux * product_mux;

  phasemux <= product WHEN ( phase_1 = '1' ) ELSE
                   const_zero;


  -- Add the products in linear fashion

  sumofproducts <= phasemux;

  -- Resize the sum of products to the accumulator type for full precision addition

  sumofproducts_cast <= resize(sumofproducts, 81);

  -- Accumulator register with a mux to reset it with the first addend

  add_temp <= resize(sumofproducts_cast, 82) + resize(accreg_out, 82);
  acc_sum <= add_temp(80 DOWNTO 0);

  accreg_in <= sumofproducts_cast WHEN ( phase_18 = '1' ) ELSE
                    acc_sum;

  Acc_reg_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      accreg_out <= (OTHERS => '0');
    ELSIF clk'event AND clk = '1' THEN
      IF clk_enable = '1' THEN
        accreg_out <= accreg_in;
      END IF;
    END IF; 
  END PROCESS Acc_reg_process;

  -- Register to hold the final value of the accumulated sum

  Acc_finalreg_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      accreg_final <= (OTHERS => '0');
    ELSIF clk'event AND clk = '1' THEN
      IF phase_18 = '1' THEN
        accreg_final <= accreg_out;
      END IF;
    END IF; 
  END PROCESS Acc_finalreg_process;

  output_typeconvert <= resize(shift_right(accreg_final(62 DOWNTO 0) + ( "0" & (accreg_final(47) & NOT accreg_final(47) & NOT accreg_final(47) & NOT accreg_final(47) & NOT accreg_final(47) & NOT accreg_final(47) & NOT accreg_final(47) & NOT accreg_final(47) & NOT accreg_final(47) & NOT accreg_final(47) & NOT accreg_final(47) & NOT accreg_final(47) & NOT accreg_final(47) & NOT accreg_final(47) & NOT accreg_final(47) & NOT accreg_final(47) & NOT accreg_final(47) & NOT accreg_final(47) & NOT accreg_final(47) & NOT accreg_final(47) & NOT accreg_final(47) & NOT accreg_final(47) & NOT accreg_final(47) & NOT accreg_final(47) & NOT accreg_final(47) & NOT accreg_final(47) & NOT accreg_final(47) & NOT accreg_final(47) & NOT accreg_final(47) & NOT accreg_final(47) & NOT accreg_final(47) & NOT accreg_final(47) & NOT accreg_final(47) & NOT accreg_final(47) & NOT accreg_final(47) & NOT accreg_final(47) & NOT accreg_final(47) & NOT accreg_final(47) & NOT accreg_final(47) & NOT accreg_final(47) & NOT accreg_final(47) & NOT accreg_final(47) & NOT accreg_final(47) & NOT accreg_final(47) & NOT accreg_final(47) & NOT accreg_final(47) & NOT accreg_final(47))), 47), 16);

  output_register_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      output_register <= (OTHERS => '0');
    ELSIF clk'event AND clk = '1' THEN
      IF phase_reg = '1' THEN
        output_register <= output_typeconvert;
      END IF;
    END IF; 
  END PROCESS output_register_process;

  -- Assignment Statements
  ce_out <= ce_out_reg;
  filter_out <= std_logic_vector(output_register);
END rtl;
