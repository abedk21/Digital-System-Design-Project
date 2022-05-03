library ieee;
use ieee.std_logic_1164.all;
entity cla_22bit is
	port (
		a    : in  std_logic_vector(21 downto 0);
		b    : in  std_logic_vector(21 downto 0);
		cin  : in  std_logic;
		sum  : out std_logic_vector(21 downto 0);
		cout : out std_logic
	);
end cla_22bit;
architecture cla_22bit_arch of cla_22bit is
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
		U1 : cla_12bit port map (a(11 downto 0), b(11 downto 0), '0', sum(11 downto 0), cout_temp);
		U2 : cla_10bit port map (a(21 downto 12), b(21 downto 12), cout_temp, sum(21 downto 12), cout);
end cla_22bit_arch;

