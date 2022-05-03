library ieee;
use ieee.std_logic_1164.all;
entity cla_28bit is
	port (
		a    : in  std_logic_vector(27 downto 0);
		b    : in  std_logic_vector(27 downto 0);
		cin  : in  std_logic;
		sum  : out std_logic_vector(27 downto 0);
		cout : out std_logic
	);
end cla_28bit;
architecture cla_28bit_arch of cla_28bit is
	component cla_14bit is
		port
		(
			a    : in  std_logic_vector(13 downto 0);
			b    : in  std_logic_vector(13 downto 0);
			cin  : in  std_logic;
			sum  : out std_logic_vector(13 downto 0);
			cout : out std_logic
		);
	end component;
	signal cout_temp : std_logic;
begin
		U1 : cla_14bit port map (a(13 downto 0), b(13 downto 0), '0', sum(13 downto 0), cout_temp);
		U2 : cla_14bit port map (a(27 downto 14), b(27 downto 14), cout_temp, sum(27 downto 14), cout);
end cla_28bit_arch;

