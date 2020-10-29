library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use ieee.NUMERIC_STD.all;

---------- ALU 2 3-bit inputs -----------------

entity ALU is
  generic ( 
     constant N: natural := 1  -- number of shifted 
    );
  
    Port (
    A, B     : in  STD_LOGIC_VECTOR(2 downto 0);  
    ALU_Sel  : in  STD_LOGIC_VECTOR(1 downto 0);  
    ALU_Out   : out  STD_LOGIC_VECTOR(2 downto 0); 
    inv : OUT STD_LOGIC_VECTOR(0 downto 0);
    Carryout : out std_logic        -- Carryout used only when needed
    );
end ALU; 
architecture Behavioral of ALU is

signal ALU_Result : std_logic_vector (2 downto 0);
signal tmp: std_logic_vector (3 downto 0);

begin
   process(A,B,ALU_Sel)
 begin
  case(ALU_Sel) is
  when "00" => -- Addition of 2 3 bit inputs
   ALU_Result <= A + B ; 
   inv <= "0";
  when "01" => -- shifting left of 1 3 bit input A (multiply by 2)
   ALU_Result <= std_logic_vector(unsigned(A) sll N);
   inv <= "0";
  when "10" => -- the xor command
   ALU_Result <= A xor B;
   inv <= "0";
  when others => ALU_Result <= "000"; inv <= "1"; --when select isnt the above 3
  
  end case;
 end process;
 ALU_Out <= ALU_Result; -- output of the alu w/o the carry
 tmp <= ('0' & A) + ('0' & B); --used to get a carry
 Carryout <= tmp(3); --carryout when needed
end Behavioral;
