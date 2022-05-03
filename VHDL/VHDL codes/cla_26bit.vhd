library ieee;
use ieee.std_logic_1164.all;
entity cla_26bit is
	port (
		a    : in  std_logic_vector(25 downto 0);
		b    : in  std_logic_vector(25 downto 0);
		cin  : in  std_logic;
		sum  : out std_logic_vector(25 downto 0);
		cout : out std_logic
	);
end cla_26bit;
architecture cla_26bit_arch of cla_26bit is
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
		U1 : cla_14bit port map (a(13 downto 0), b(13 downto 0), '0', sum(13 downto 0), cout_temp);
		U2 : cla_12bit port map (a(25 downto 14), b(25 downto 14), cout_temp, sum(25 downto 14), cout);
end cla_26bit_arch;

