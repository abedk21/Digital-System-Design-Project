library ieee;
use ieee.std_logic_1164.all;
entity adder_accumulate is
	port (
		cin : in  std_logic;
		a   : in  std_logic_vector(35 downto 0);
		b   : in  std_logic_vector(35 downto 0);
		sum : out std_logic_vector(35 downto 0)
	);
end adder_accumulate;
architecture adder_accumulate_arch of adder_accumulate is
	component cla_14bit is
		port
		(
			a    : in  std_logic_vector(13 downto 0);
			b    : in  std_logic_vector(13 downto 0);
			cin  : in  std_logic;
			sum  : out std_logic_vector(13 downto 0);
			cout : out std_logic
		);
	end component cla_14bit;
	component cla_12bit is
		port
		(
			a    : in  std_logic_vector(11 downto 0);
			b    : in  std_logic_vector(11 downto 0);
			cin  : in  std_logic;
			sum  : out std_logic_vector(11 downto 0);
			cout : out std_logic
		);
	end component cla_12bit;
	component cla_10bit is
		port
		(
			a    : in  std_logic_vector(9 downto 0);
			b    : in  std_logic_vector(9 downto 0);
			cin  : in  std_logic;
			sum  : out std_logic_vector(9 downto 0);
			cout : out std_logic
		);
	end component cla_10bit;
	signal cout1, cout2 : std_logic;
begin
		U1 : cla_14bit port map (a(13 downto 0), b(13 downto 0), cin, sum(13 downto 0), cout1);
		U2 : cla_12bit port map (a(25 downto 14), b(25 downto 14), cout1, sum(25 downto 14), cout2);
		U3 : cla_10bit port map (a(35 downto 26), b(35 downto 26), cout2, sum(35 downto 26));
end adder_accumulate_arch;
