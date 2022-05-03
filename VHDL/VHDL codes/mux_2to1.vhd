library ieee;
use ieee.std_logic_1164.all;
entity mux_2to1 is
    Port ( 
			sel : in  std_logic;
			mux_in1 : in  std_logic;
			mux_in2 : in  std_logic;
			c : out std_logic
		);
end mux_2to1;
architecture mux_2to1_arch of mux_2to1 is
begin
    c <= mux_in1 when (sel = '1') else mux_in2;
end mux_2to1_arch;