library ieee;
use ieee.std_logic_1164.all;
entity incrementer_14bit is
	port (
		cin     : in  std_logic;
		inc_in  : in  std_logic_vector (13 downto 0);
		inc_out : out std_logic_vector (13 downto 0)
	);
end incrementer_14bit;
architecture incrementer_14bit_arch of incrementer_14bit is
	component half_adder
		port
		(
			a    : in  std_logic;
			b    : in  std_logic;
			sum  : out std_logic;
			cout : out std_logic
		);
	end component;
	signal cout_temp : std_logic_vector (14 downto 0);
begin
	cout_temp(0) <= cin;
	UHA : for i in 0 to 13 generate
			U1 : half_adder port map (inc_in(i), cout_temp(i), inc_out(i), cout_temp(i+1));
	end generate UHA;
end incrementer_14bit_arch;

