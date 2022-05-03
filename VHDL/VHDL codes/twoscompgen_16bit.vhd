library ieee;
use ieee.std_logic_1164.all;
entity twoscompgen_16bit is
        port (
        		enable : in std_logic;
				a : in std_logic_vector(15 downto 0);
				r : out std_logic_vector(15 downto 0)
        );
end twoscompgen_16bit;
architecture twoscompgen_16bit_arch of twoscompgen_16bit is
component incrementer_16bit
	port
	(
		cin : in std_logic;
		inc_in : in std_logic_vector(15 downto 0);
		inc_out : out std_logic_vector(15 downto 0)
	);
end component;
signal a_temp: std_logic_vector(15 downto 0);
begin
	ABAR: for i in 0 to 15 generate
		a_temp(i) <= a(i) xor enable;
	end generate ABAR;
	U2: incrementer_16bit port map (enable, a_temp, r);
end twoscompgen_16bit_arch;
