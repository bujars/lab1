library ieee; 
use ieee.std_logic_1164.all;

entity SEFA_Bitwise_SRL is
	generic (SEFA_N: integer := 32);
	port(
		SEFA_RS, SEFA_SHIFT_AMOUNT: IN STD_LOGIC_VECTOR(SEFA_N-1 downto 0);
		SEFA_RD : OUT STD_LOGIC_VECTOR(SEFA_N-1 downto 0)
	);
end SEFA_Bitwise_SRL;

architecture arch of SEFA_Bitwise_SRL is
begin
	SEFA_RD <= SEFA_RS srl SEFA_SHIFT_AMOUNT; 
end arch;