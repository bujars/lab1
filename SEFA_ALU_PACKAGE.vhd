library ieee;
use ieee.std_logic_1164.all;

PACKAGE SEFA_ALU_PACKAGE IS 

COMPONENT SEFA_Register_N_VHDL is 
	generic (SEFA_N: integer := 32);
	port (
		SEFA_clk: in std_logic; 
		SEFA_wren: in std_logic;
		SEFA_rden: in std_logic;
		SEFA_chen: in std_logic; 
		SEFA_data: in std_logic_vector (SEFA_N-1 downto 0);
		SEFA_q: out std_logic_vector(SEFA_N-1 downto 0)
		);
end COMPONENT SEFA_Register_N_VHDL;



COMPONENT SEFA_RS_REGISTER IS
	generic (SEFA_N: integer := 32);
	port(
	SEFA_clk: in std_logic;
		SEFA_wren: in std_logic;
		SEFA_rden: in std_logic;
		SEFA_chen: in std_logic;
		SEFA_data: in std_logic_vector (SEFA_N-1 downto 0);
		SEFA_RS: out std_logic_vector(SEFA_N-1 downto 0)
		);
end COMPONENT SEFA_RS_REGISTER;

COMPONENT SEFA_RT_REGISTER IS
	generic (SEFA_N: integer := 32);
	port(
	SEFA_clk: in std_logic;
		SEFA_wren: in std_logic;
		SEFA_rden: in std_logic;
		SEFA_chen: in std_logic;
		SEFA_data: in std_logic_vector (SEFA_N-1 downto 0);
		SEFA_RS: out std_logic_vector(SEFA_N-1 downto 0)
		);
end COMPONENT SEFA_RT_REGISTER;


COMPONENT SEFA_RD_REGISTER IS
	generic (SEFA_N: integer := 32);
	port(
	SEFA_clk: in std_logic;
		SEFA_wren: in std_logic;
		SEFA_rden: in std_logic;
		SEFA_chen: in std_logic;
		SEFA_data: in std_logic_vector (SEFA_N-1 downto 0);
		SEFA_RS: out std_logic_vector(SEFA_N-1 downto 0)
		);
end COMPONENT SEFA_RD_REGISTER;



COMPONENT SEFA_Bitwise_OR is
	generic (SEFA_N: integer := 32);
	port(
		SEFA_RS, SEFA_RT: IN STD_LOGIC_VECTOR(SEFA_N-1 downto 0);
		SEFA_RD : OUT STD_LOGIC_VECTOR(SEFA_N-1 downto 0)
	);
end COMPONENT SEFA_Bitwise_OR;


COMPONENT SEFA_Bitwise_AND is
	generic (SEFA_N: integer := 32);
	port(
		SEFA_RS, SEFA_RT: IN STD_LOGIC_VECTOR(SEFA_N-1 downto 0);
		SEFA_RD : OUT STD_LOGIC_VECTOR(SEFA_N-1 downto 0)
	);
end COMPONENT SEFA_Bitwise_AND;


COMPONENT SEFA_Bitwise_NOR is
	generic (SEFA_N: integer := 32);
	port(
		SEFA_RS, SEFA_RT: IN STD_LOGIC_VECTOR(SEFA_N-1 downto 0);
		SEFA_RD : OUT STD_LOGIC_VECTOR(SEFA_N-1 downto 0)
	);
end COMPONENT SEFA_Bitwise_NOR;


COMPONENT SEFA_ADDER_SUB_SIGNED IS
	PORT
	(
		SEFA_add_sub		: IN STD_LOGIC ;
		SEFA_cin		: IN STD_LOGIC ;
		SEFA_dataa		: IN STD_LOGIC_VECTOR (31 DOWNTO 0);
		SEFA_datab		: IN STD_LOGIC_VECTOR (31 DOWNTO 0);
		SEFA_cout		: OUT STD_LOGIC ;
		SEFA_overflow		: OUT STD_LOGIC ;
		SEFA_result		: OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
		SEFA_negative: OUT STD_LOGIC;
		SEFA_ZERO: OUT STD_LOGIC
	);
END COMPONENT SEFA_ADDER_SUB_SIGNED;

COMPONENT SEFA_ADDER_SUB_UNSIGNED IS
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
END COMPONENT SEFA_ADDER_SUB_UNSIGNED;



end SEFA_ALU_PACKAGE;