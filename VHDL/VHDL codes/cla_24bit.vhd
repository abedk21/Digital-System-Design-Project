library ieee;
use ieee.std_logic_1164.all;
entity cla_24bit is
	port (
		a    : in  std_logic_vector(23 downto 0);
		b    : in  std_logic_vector(23 downto 0);
		cin  : in  std_logic;
		sum  : out std_logic_vector(23 downto 0);
		cout : out std_logic
	);
end cla_24bit;
architecture cla_24bit_arch of cla_24bit is
	component cla_12bit is
		port
		(
			a    : in  std_logic_vector(11 downto 0);
			b    : in  std_logic_vector(11 downto 0);
			cin  : in  std_logic;
			sum  : out std_logic_vector(11 downto 0);
			cout : out std_logic
		);
	end component;
	signal cout_temp : std_logic;
begin
		U1 : cla_12bit port map (a(11 downto 0), b(11 downto 0), '0', sum(11 downto 0), cout_temp);
		U2 : cla_12bit port map (a(23 downto 12), b(23 downto 12), cout_temp, sum(23 downto 12), cout);
end cla_24bit_arch;

