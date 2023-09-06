----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08/27/2023 08:05:46 PM
-- Design Name: 
-- Module Name: n_bit_multipler - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use 

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity n_bit_multipler is
        generic (bits: integer := 4);
 port (
  a     :  in std_logic_vector(bits-1 downto 0);
  b     :  in std_logic_vector(bits-1 downto 0);
  result:  out std_logic_vector(bits*2-1 downto 0)      --sum-out
  );
end n_bit_multipler; 

architecture Behavioral of n_bit_multipler is

signal  temp1:std_logic_vector(bits*2-1 downto 0);
signal  temp2:std_logic_vector(bits*2-1 downto 0);
begin process (a,b)
begin
temp1(bits - 1 downto 0) <= a(bits-1 downto 0);
temp1(bits*2 - 1 downto bits)  <= (others => '0');

for i in 0 to bits - 1 loop
    if (b(i) = '1') then
       temp1 <= std_logic_vector(shift_left(unsigned(temp1), 1));
       temp2 <= temp1 + temp2;
    else
       temp1 <= std_logic_vector(shift_left(unsigned(temp1), 1));
       temp2 <= temp2;
     end if;
end loop;
END PROCESS;
end Behavioral;
