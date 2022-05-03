library ieee;
use ieee.std_logic_1164.all;
 entity full_adder is
		 Port ( 
				a : in std_logic;
				b : in std_logic;
				cin : in std_logic;
				s : out std_logic;
				cout : out std_logic
		 );
end full_adder;
architecture full_adder_arch of full_adder is
begin
	s <= a xor b xor cin ;
	cout <= (a and b) or (cin and a) or (cin and b) ;
end full_adder_arch;