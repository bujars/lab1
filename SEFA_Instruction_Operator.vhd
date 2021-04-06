library ieee; 
use ieee.std_logic_1164.all;
use work.SEFA_ALU_PACKAGE.all;

entity SEFA_Instruction_Operator is
	generic (SEFA_N: integer := 32);
	port(
		SEFA_RS, SEFA_RT: IN STD_LOGIC_VECTOR(SEFA_N-1 downto 0);
		SEFA_Operation_Code: IN STD_LOGIC_VECTOR(2 downto 0); -- Note we have a 3 bit selector. 
		SEFA_ZERO, SEFA_NEGATIVE, SEFA_OVERFLOW: OUT STD_LOGIC := '0' ;
		SEFA_RD : OUT STD_LOGIC_VECTOR(SEFA_N-1 downto 0)
	);
end SEFA_Instruction_Operator;


architecture arch of SEFA_Instruction_Operator is 

SIGNAL SEFA_TEMP_COUT: STD_LOGIC; 


begin

RESULT: process(SEFA_RS, SEFA_RT, SEFA_Operation_Code, SEFA_ZERO, SEFA_NEGATIVE, SEFA_OVERFLOW, SEFA_RD)
		begin
			if(SEFA_Operation_Code  = "000") then
				U0: SEFA_Bitwise_AND port map (SEFA_RS, SEFA_RT, SEFA_RD);
			elsif(SEFA_Operation_Code  = "001") then
				U1: SEFA_Bitwise_OR port map (SEFA_RS, SEFA_RT, SEFA_RD);
			elsif(SEFA_Operation_Code  = "010") then
				U2: SEFA_Bitwise_NOR port map (SEFA_RS, SEFA_RT, SEFA_RD);
			elsif(SEFA_Operation_Code  = "011") then
				-- SIGNED ADDITION
				U3: SEFA_ADDER_SUB_SIGNED port map (1, 0, SEFA_RS, SEFA_RT, SEFA_TEMP_COUT, SEFA_OVERFLOW, SEFA_RD, SEFA_NEGATIVE, SEFA_ZERO);
			elsif(SEFA_Operation_Code  = "100") then
				-- SIGNED SUBTRACTION
				U4: SEFA_ADDER_SUB_SIGNED port map (0, 0, SEFA_RS, SEFA_RT, SEFA_TEMP_COUT, SEFA_OVERFLOW, SEFA_RD, SEFA_NEGATIVE, SEFA_ZERO);
			elsif(SEFA_Operation_Code  = "101") then
				-- UNSIGNED ADDITION
				U5: SEFA_ADDER_SUB_UNSIGNED port map (1, 0, SEFA_RS, SEFA_RT, SEFA_TEMP_COUT, SEFA_OVERFLOW, SEFA_RD, SEFA_NEGATIVE, SEFA_ZERO);
			else 
				-- UNSIGNED SUBTRACTION
				U6: SEFA_ADDER_SUB_UNSIGNED port map (0, 0, SEFA_RS, SEFA_RT, SEFA_TEMP_COUT, SEFA_OVERFLOW, SEFA_RD, SEFA_NEGATIVE, SEFA_ZERO);
			end if; 
		end process PP; 
	

end arch;