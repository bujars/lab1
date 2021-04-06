library ieee; 
use ieee.std_logic_1164.all;
use work.SEFA_ALU_PACKAGE.all;

entity SEFA_Instruction_Operator is
	generic (SEFA_N: integer := 32);
	port(
		SEFA_RS, SEFA_RT: IN STD_LOGIC_VECTOR(SEFA_N-1 downto 0);
		SEFA_Operation_Code: IN STD_LOGIC_VECTOR(3 downto 0); -- Note we have a 4 bit selector, per project requirement. 
		SEFA_ZERO, SEFA_NEGATIVE, SEFA_OVERFLOW: OUT STD_LOGIC := '0' ;
		SEFA_RD : OUT STD_LOGIC_VECTOR(SEFA_N-1 downto 0)
	);
end SEFA_Instruction_Operator;


architecture arch of SEFA_Instruction_Operator is 

SIGNAL SEFA_TEMP_COUT: STD_LOGIC; 
SIGNAL SEFA_AND_RESULT, SEFA_OR_RESULT, SEFA_NOR_RESULT, SEFA_ADD_SIGNED_RESULT, SEFA_SUB_SIGNED_RESULT, SEFA_ADD_UNSIGNED_RESULT, SEFA_SUB_UNSIGNED_RESULT: STD_LOGIC_VECTOR(SEFA_N-1 DOWNTO 0);

begin

--- NOTE, my original attempt was to use if/else statements inside a process. But due to synchronization that was not working (something to loook into)
--- Now we will use generate as we did in the adder lab (when we want to create components based on a condition). 
--- NOTE, that using generate that didn't work as well. Becuase it must be static





	U0: SEFA_Bitwise_AND port map (SEFA_RS => SEFA_RS, SEFA_RT => SEFA_RT, SEFA_RD => SEFA_AND_RESULT);
	U1: SEFA_Bitwise_OR port map (SEFA_RS => SEFA_RS, SEFA_RT => SEFA_RT, SEFA_RD => SEFA_OR_RESULT);
	U2: SEFA_Bitwise_NOR port map (SEFA_RS => SEFA_RS, SEFA_RT => SEFA_RT, SEFA_RD => SEFA_NOR_RESULT);
	U3: SEFA_ADDER_SUB_SIGNED port map (SEFA_add_sub => '1', SEFA_cin => '0', SEFA_dataa => SEFA_RS, SEFA_datab => SEFA_RT, SEFA_cout => SEFA_TEMP_COUT, SEFA_overflow => SEFA_OVERFLOW, SEFA_result => SEFA_ADD_SIGNED_RESULT, SEFA_negative => SEFA_NEGATIVE, SEFA_ZERO => SEFA_ZERO);
	U4: SEFA_ADDER_SUB_SIGNED port map (SEFA_add_sub => '0', SEFA_cin => '0', SEFA_dataa => SEFA_RS, SEFA_datab => SEFA_RT, SEFA_cout => SEFA_TEMP_COUT, SEFA_overflow => SEFA_OVERFLOW, SEFA_result => SEFA_SUB_SIGNED_RESULT, SEFA_negative => SEFA_NEGATIVE, SEFA_ZERO => SEFA_ZERO);
	U5: SEFA_ADDER_SUB_UNSIGNED port map (SEFA_add_sub => '1', SEFA_cin => '0', SEFA_dataa => SEFA_RS, SEFA_datab => SEFA_RT, SEFA_cout => SEFA_TEMP_COUT, SEFA_overflow => SEFA_OVERFLOW, SEFA_result => SEFA_ADD_UNSIGNED_RESULT, SEFA_negative => SEFA_NEGATIVE, SEFA_ZERO => SEFA_ZERO);
	U6: SEFA_ADDER_SUB_UNSIGNED port map (SEFA_add_sub => '0', SEFA_cin => '0', SEFA_dataa => SEFA_RS, SEFA_datab => SEFA_RT, SEFA_cout => SEFA_TEMP_COUT, SEFA_overflow => SEFA_OVERFLOW, SEFA_result => SEFA_SUB_UNSIGNED_RESULT, SEFA_negative => SEFA_NEGATIVE, SEFA_ZERO => SEFA_ZERO);

	SEFA_RD <= SEFA_AND_RESULT WHEN SEFA_Operation_Code = "0000" else
				SEFA_OR_RESULT WHEN SEFA_Operation_Code = "0001" else
				SEFA_NOR_RESULT WHEN SEFA_Operation_Code = "0010" else
				SEFA_ADD_SIGNED_RESULT WHEN SEFA_Operation_Code = "0011" else
				SEFA_SUB_SIGNED_RESULT WHEN SEFA_Operation_Code = "0100" else
				SEFA_ADD_UNSIGNED_RESULT WHEN SEFA_Operation_Code = "0101" else
				SEFA_SUB_UNSIGNED_RESULT;
				
					

	

end arch;