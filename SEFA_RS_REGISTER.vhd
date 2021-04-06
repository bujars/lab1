library IEEE;
use IEEE.std_logic_1164.all;
use work.SEFA_ALU_PACKAGE.all;

entity SEFA_RS_REGISTER IS
	generic (SEFA_N: integer := 32);
	port(
	SEFA_clk: in std_logic; -- clock
		SEFA_wren: in std_logic; -- write enable (if it is 0, the stored data will not change)
		SEFA_rden: in std_logic; -- read enable (only when it is 1, the stored data will be displayed to output)
		SEFA_chen: in std_logic; --  chip enable (if it is 0, the output will be undefined)
		SEFA_data: in std_logic_vector (SEFA_N-1 downto 0); -- data input
		SEFA_RS: out std_logic_vector(SEFA_N-1 downto 0)
		);
end SEFA_RS_REGISTER;


architecture arch of SEFA_RS_REGISTER is 

begin

	RS: SEFA_Register_N_VHDL port map (SEFA_clk, SEFA_wren, SEFA_rden, SEFA_chen, SEFA_data, SEFA_RS);
	
end arch; 