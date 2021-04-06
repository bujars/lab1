-- megafunction wizard: %LPM_ADD_SUB%
-- GENERATION: STANDARD
-- VERSION: WM1.0
-- MODULE: LPM_ADD_SUB 

-- ============================================================
-- File Name: SEFA_ADDER_SUB_UNSIGNED.vhd
-- Megafunction Name(s):
-- 			LPM_ADD_SUB
--
-- Simulation Library Files(s):
-- 			lpm
-- ============================================================
-- ************************************************************
-- THIS IS A WIZARD-GENERATED FILE. DO NOT EDIT THIS FILE!
--
-- 20.1.1 Build 720 11/11/2020 SJ Lite Edition
-- ************************************************************


--Copyright (C) 2020  Intel Corporation. All rights reserved.
--Your use of Intel Corporation's design tools, logic functions 
--and other software and tools, and any partner logic 
--functions, and any output files from any of the foregoing 
--(including device programming or simulation files), and any 
--associated documentation or information are expressly subject 
--to the terms and conditions of the Intel Program License 
--Subscription Agreement, the Intel Quartus Prime License Agreement,
--the Intel FPGA IP License Agreement, or other applicable license
--agreement, including, without limitation, that your use is for
--the sole purpose of programming logic devices manufactured by
--Intel and sold by Intel or its authorized distributors.  Please
--refer to the applicable agreement for further details, at
--https://fpgasoftware.intel.com/eula.


LIBRARY ieee;
USE ieee.std_logic_1164.all;

LIBRARY lpm;
USE lpm.all;

ENTITY SEFA_ADDER_SUB_UNSIGNED IS
	PORT
	(
		SEFA_add_sub		: IN STD_LOGIC ;
		SEFA_cin		: IN STD_LOGIC ;
		SEFA_dataa		: IN STD_LOGIC_VECTOR (31 DOWNTO 0);
		SEFA_datab		: IN STD_LOGIC_VECTOR (31 DOWNTO 0);
		SEFA_cout		: OUT STD_LOGIC ;
		SEFA_overflow		: OUT STD_LOGIC ;
		SEFA_result		: OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
		SEFA_NEGATIVE: OUT STD_LOGIC;
		SEFA_ZERO: OUT STD_LOGIC
	);
END SEFA_ADDER_SUB_UNSIGNED;


ARCHITECTURE SYN OF sefa_adder_sub_unsigned IS

	SIGNAL sub_wire0	: STD_LOGIC ;
	SIGNAL sub_wire1	: STD_LOGIC ;
	SIGNAL sub_wire2	: STD_LOGIC_VECTOR (31 DOWNTO 0);



	COMPONENT lpm_add_sub
	GENERIC (
		lpm_direction		: STRING;
		lpm_hint		: STRING;
		lpm_representation		: STRING;
		lpm_type		: STRING;
		lpm_width		: NATURAL
	);
	PORT (
			add_sub	: IN STD_LOGIC ;
			cin	: IN STD_LOGIC ;
			dataa	: IN STD_LOGIC_VECTOR (31 DOWNTO 0);
			datab	: IN STD_LOGIC_VECTOR (31 DOWNTO 0);
			cout	: OUT STD_LOGIC ;
			overflow	: OUT STD_LOGIC ;
			result	: OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
	);
	END COMPONENT;

BEGIN
	SEFA_cout    <= sub_wire0;
	SEFA_overflow    <= sub_wire1;
	SEFA_result    <= sub_wire2(31 DOWNTO 0);

	LPM_ADD_SUB_component : LPM_ADD_SUB
	GENERIC MAP (
		lpm_direction => "UNUSED",
		lpm_hint => "ONE_INPUT_IS_CONSTANT=NO,CIN_USED=YES",
		lpm_representation => "UNSIGNED",
		lpm_type => "LPM_ADD_SUB",
		lpm_width => 32
	)
	PORT MAP (
		add_sub => SEFA_add_sub,
		cin => SEFA_cin,
		dataa => SEFA_dataa,
		datab => SEFA_datab,
		cout => sub_wire0,
		overflow => sub_wire1,
		result => sub_wire2
	);
	
	-- MSB tells us if its negative
		SEFA_NEGATIVE <= '0';


		PP: process(sub_wire2)
		variable SEFA_IS_ZERO: STD_LOGIC := '0';
		begin
			FOR i in 0 to 31 loop
				if(sub_wire2(i)  = '1') then
					SEFA_IS_ZERO :=  '0'; 
					exit;
				else SEFA_IS_ZERO := '1';
				end if; 
			end loop;
			SEFA_ZERO <= SEFA_IS_ZERO; 
		end process PP; 

END SYN;

-- ============================================================
-- CNX file retrieval info
-- ============================================================
-- Retrieval info: PRIVATE: CarryIn NUMERIC "1"
-- Retrieval info: PRIVATE: CarryOut NUMERIC "1"
-- Retrieval info: PRIVATE: ConstantA NUMERIC "0"
-- Retrieval info: PRIVATE: ConstantB NUMERIC "0"
-- Retrieval info: PRIVATE: Function NUMERIC "2"
-- Retrieval info: PRIVATE: INTENDED_DEVICE_FAMILY STRING "Cyclone V"
-- Retrieval info: PRIVATE: LPM_PIPELINE NUMERIC "0"
-- Retrieval info: PRIVATE: Latency NUMERIC "0"
-- Retrieval info: PRIVATE: Overflow NUMERIC "1"
-- Retrieval info: PRIVATE: RadixA NUMERIC "10"
-- Retrieval info: PRIVATE: RadixB NUMERIC "10"
-- Retrieval info: PRIVATE: Representation NUMERIC "1"
-- Retrieval info: PRIVATE: SYNTH_WRAPPER_GEN_POSTFIX STRING "0"
-- Retrieval info: PRIVATE: ValidCtA NUMERIC "0"
-- Retrieval info: PRIVATE: ValidCtB NUMERIC "0"
-- Retrieval info: PRIVATE: WhichConstant NUMERIC "0"
-- Retrieval info: PRIVATE: aclr NUMERIC "0"
-- Retrieval info: PRIVATE: clken NUMERIC "0"
-- Retrieval info: PRIVATE: nBit NUMERIC "32"
-- Retrieval info: PRIVATE: new_diagram STRING "1"
-- Retrieval info: LIBRARY: lpm lpm.lpm_components.all
-- Retrieval info: CONSTANT: LPM_DIRECTION STRING "UNUSED"
-- Retrieval info: CONSTANT: LPM_HINT STRING "ONE_INPUT_IS_CONSTANT=NO,CIN_USED=YES"
-- Retrieval info: CONSTANT: LPM_REPRESENTATION STRING "UNSIGNED"
-- Retrieval info: CONSTANT: LPM_TYPE STRING "LPM_ADD_SUB"
-- Retrieval info: CONSTANT: LPM_WIDTH NUMERIC "32"
-- Retrieval info: USED_PORT: add_sub 0 0 0 0 INPUT NODEFVAL "add_sub"
-- Retrieval info: USED_PORT: cin 0 0 0 0 INPUT NODEFVAL "cin"
-- Retrieval info: USED_PORT: cout 0 0 0 0 OUTPUT NODEFVAL "cout"
-- Retrieval info: USED_PORT: dataa 0 0 32 0 INPUT NODEFVAL "dataa[31..0]"
-- Retrieval info: USED_PORT: datab 0 0 32 0 INPUT NODEFVAL "datab[31..0]"
-- Retrieval info: USED_PORT: overflow 0 0 0 0 OUTPUT NODEFVAL "overflow"
-- Retrieval info: USED_PORT: result 0 0 32 0 OUTPUT NODEFVAL "result[31..0]"
-- Retrieval info: CONNECT: @add_sub 0 0 0 0 add_sub 0 0 0 0
-- Retrieval info: CONNECT: @cin 0 0 0 0 cin 0 0 0 0
-- Retrieval info: CONNECT: @dataa 0 0 32 0 dataa 0 0 32 0
-- Retrieval info: CONNECT: @datab 0 0 32 0 datab 0 0 32 0
-- Retrieval info: CONNECT: cout 0 0 0 0 @cout 0 0 0 0
-- Retrieval info: CONNECT: overflow 0 0 0 0 @overflow 0 0 0 0
-- Retrieval info: CONNECT: result 0 0 32 0 @result 0 0 32 0
-- Retrieval info: GEN_FILE: TYPE_NORMAL SEFA_ADDER_SUB_UNSIGNED.vhd TRUE
-- Retrieval info: GEN_FILE: TYPE_NORMAL SEFA_ADDER_SUB_UNSIGNED.inc FALSE
-- Retrieval info: GEN_FILE: TYPE_NORMAL SEFA_ADDER_SUB_UNSIGNED.cmp TRUE
-- Retrieval info: GEN_FILE: TYPE_NORMAL SEFA_ADDER_SUB_UNSIGNED.bsf FALSE
-- Retrieval info: GEN_FILE: TYPE_NORMAL SEFA_ADDER_SUB_UNSIGNED_inst.vhd FALSE
-- Retrieval info: LIB_FILE: lpm
