library ieee;
use ieee.std_logic_1164.all;
entity cla_20bit is
	port (
		a    : in  std_logic_vector(19 downto 0);
		b    : in  std_logic_vector(19 downto 0);
		cin  : in  std_logic;
		sum  : out std_logic_vector(19 downto 0);
		cout : out std_logic
	);
end cla_20bit;
architecture cla_20bit_arch of cla_20bit is
	component cla_10bit is
		port
		(
			a    : in  std_logic_vector(9 downto 0);
			b    : in  std_logic_vector(9 downto 0);
			cin  : in  std_logic;
			sum  : out std_logic_vector(9 downto 0);
			cout : out std_logic
		);
	end component;
	signal cout_temp : std_logic;
begin
		U1 : cla_10bit port map (a(9 downto 0), b(9 downto 0), '0', sum(9 downto 0), cout_temp);
		U2 : cla_10bit port map (a(19 downto 10), b(19 downto 10), cout_temp, sum(19 downto 10), cout);
end cla_20bit_arch;


