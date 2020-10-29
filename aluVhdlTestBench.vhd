LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use IEEE.std_logic_unsigned.all;
USE ieee.numeric_std.ALL;
 
ENTITY tb_ALU IS
END tb_ALU;
 
ARCHITECTURE behavior OF tb_ALU IS 
 

 
    COMPONENT ALU
    PORT(
         A : IN  std_logic_vector(2 downto 0);
         B : IN  std_logic_vector(2 downto 0);
         ALU_Sel : IN  std_logic_vector(1 downto 0);
         ALU_Out : OUT  std_logic_vector(2 downto 0);
    	 inv : OUT STD_LOGIC_VECTOR(0 downto 0);
         Carryout : OUT  std_logic
        );
    END COMPONENT;
       --Inputs
   signal A : std_logic_vector(2 downto 0) := (others => '0');
   signal B : std_logic_vector(2 downto 0) := (others => '0');
   signal ALU_Sel : std_logic_vector(1 downto 0) := (others => '0');
   
  --Outputs
   signal ALU_Out : std_logic_vector(2 downto 0);
   signal Carryout : std_logic;
   signal inv : std_logic;
   signal i:integer;
BEGIN

   uut: ALU PORT MAP (
          A => A,
          B => B,
          ALU_Sel => ALU_Sel,
          ALU_Out => ALU_Out,
          Carryout => Carryout
        );

   stim_proc: process
    begin  

        A <= "101";
  		B <= "010";
  		ALU_Sel <= "00";

   end process;

END;