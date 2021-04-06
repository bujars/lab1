library ieee; 
use ieee.std_logic_1164.all;
use ieee.numeric_std;

entity SEFA_Bitwise_ORI is
	generic (SEFA_N: integer := 32);
	port(
		SEFA_RS: IN STD_LOGIC_VECTOR(SEFA_N-1 downto 0);
		SEFA_IMMEDIATE: IN STD_LOGIC_VECTOR(15 downto 0);
		SEFA_RT : OUT STD_LOGIC_VECTOR(SEFA_N-1 downto 0)
	);
end SEFA_Bitwise_ORI;

architecture arch of SEFA_Bitwise_ORI is
begin
	SEFA_RT <= SEFA_RS; --OR std_logic_vector(resize(unsigned(SEFA_IMMEDIATE), SEFA_N)); CURRENT CODE IS NOT WORKING
end arch;