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


begin

--- NOTE, my original attempt was to use if/else statements inside a process. But due to synchronization that was not working (something to loook into)
--- Now we will use generate as we did in the adder lab (when we want to create components based on a condition). 


U0: if (SEFA_Operation_Code  = "0000") generate
	R0:SEFA_Bitwise_AND port map (SEFA_RS => SEFA_RS, SEFA_RT => SEFA_RT, SEFA_RD => SEFA_RD);
end generate; 

U1: if (SEFA_Operation_Code  = "0001") generate
	R1:SEFA_Bitwise_OR port map (SEFA_RS => SEFA_RS, SEFA_RT => SEFA_RT, SEFA_RD => SEFA_RD);
end generate;

U2: if (SEFA_Operation_Code  = "0010") generate
	R2:SEFA_Bitwise_NOR port map (SEFA_RS => SEFA_RS, SEFA_RT => SEFA_RT, SEFA_RD => SEFA_RD);
end generate;

U3: if (SEFA_Operation_Code  = "0011") generate 
	R3: SEFA_ADDER_SUB_SIGNED port map (SEFA_add_sub => '1', SEFA_cin => '0', SEFA_dataa => SEFA_RS, SEFA_datab => SEFA_RT, SEFA_cout => SEFA_TEMP_COUT, SEFA_overflow => SEFA_OVERFLOW, SEFA_result => SEFA_RD, SEFA_negative => SEFA_NEGATIVE, SEFA_ZERO => SEFA_ZERO);
	end generate;	

U4: if (SEFA_Operation_Code  = "0100") generate 
	R4: SEFA_ADDER_SUB_SIGNED port map (SEFA_add_sub => '0', SEFA_cin => '0', SEFA_dataa => SEFA_RS, SEFA_datab => SEFA_RT, SEFA_cout => SEFA_TEMP_COUT, SEFA_overflow => SEFA_OVERFLOW, SEFA_result => SEFA_RD, SEFA_negative => SEFA_NEGATIVE, SEFA_ZERO => SEFA_ZERO);
end generate;				
			
U5: if (SEFA_Operation_Code  = "0101") generate 
	R5: SEFA_ADDER_SUB_UNSIGNED port map (SEFA_add_sub => '1', SEFA_cin => '0', SEFA_dataa => SEFA_RS, SEFA_datab => SEFA_RT, SEFA_cout => SEFA_TEMP_COUT, SEFA_overflow => SEFA_OVERFLOW, SEFA_result => SEFA_RD, SEFA_negative => SEFA_NEGATIVE, SEFA_ZERO => SEFA_ZERO);
end generate;	

U6: if (SEFA_Operation_Code  = "0110") generate 
	R6: SEFA_ADDER_SUB_UNSIGNED port map (SEFA_add_sub => '0', SEFA_cin => '0', SEFA_dataa => SEFA_RS, SEFA_datab => SEFA_RT, SEFA_cout => SEFA_TEMP_COUT, SEFA_overflow => SEFA_OVERFLOW, SEFA_result => SEFA_RD, SEFA_negative => SEFA_NEGATIVE, SEFA_ZERO => SEFA_ZERO);
end generate;

	

end arch;