library ieee; 
use ieee.std_logic_1164.all;

entity SEFA_Bitwise_NOR is
	generic (SEFA_N: integer := 32);
	port(
		SEFA_RS, SEFA_RT: IN STD_LOGIC_VECTOR(SEFA_N-1 downto 0);
		SEFA_RD : OUT STD_LOGIC_VECTOR(SEFA_N-1 downto 0)
	);
end SEFA_Bitwise_NOR;

architecture arch of SEFA_Bitwise_NOR is
begin
	SEFA_RD <= SEFA_RS NOR SEFA_RT; 
end arch;