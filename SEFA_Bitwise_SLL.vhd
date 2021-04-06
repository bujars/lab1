library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity SEFA_Bitwise_SLL is
	generic (SEFA_N: integer := 32);
	port(
		SEFA_RS: IN STD_LOGIC_VECTOR(SEFA_N-1 downto 0);
		SEFA_SHIFT_AMOUNT: IN STD_LOGIC_VECTOR(15 downto 0);	-- SHIFT AMOUNT (SHAMT) is the integer placeholder of how much we shift by
		SEFA_RD : OUT STD_LOGIC_VECTOR(SEFA_N-1 downto 0)
	);
end SEFA_Bitwise_SLL;

architecture arch of SEFA_Bitwise_SLL is
begin
	SEFA_RD <= to_stdlogicvector(to_bitvector(SEFA_RS) sll to_integer(unsigned(SEFA_SHIFT_AMOUNT))); -- note we convert shift amount into an actual number (and not just bits)
end arch;