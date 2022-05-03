library ieee;
use ieee.std_logic_1164.all;
entity decoder is
	port (
		sel : in  std_logic_vector (2 downto 0);
		x   : out std_logic_vector (2 downto 0)
	);
end decoder;
architecture decoder_arch of decoder is
begin
	with sel select
	x <= 	"010" when "001" | "010",
		"100" when "011",
		"101" when "100",
		"011" when "101" | "110",
		"000" when others;
end decoder_arch;