library IEEE;
use IEEE.std_logic_1164.all;
use work.SEFA_ALU_PACKAGE.all;

entity SEFA_MAR_REGISTER is
	generic(SEFA_N : integer := 32);
	port(
		SEFA_clk : in std_logic;
		SEFA_wren: in std_logic;
		SEFA_rden : in std_logic;
		SEFA_chen: in std_logic;
		SEFA_data : in std_logic_vector(SEFA_N-1 downto 0);
		SEFA_q: out std_logic_vector(SEFA_N-1 downto 0)
		);
end SEFA_MAR_REGISTER;

architecture arch of SEFA_MAR_REGISTER is
begin
	U0 : SEFA_Register_N_VHDL port map (SEFA_clk, SEFA_wren, SEFA_rden, SEFA_chen, SEFA_data, SEFA_q);
end arch;