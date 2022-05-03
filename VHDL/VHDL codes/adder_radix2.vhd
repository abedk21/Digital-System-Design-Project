library ieee;
use ieee.std_logic_1164.all;
entity adder_radix2 is
	port (
		cin : in  std_logic;
		pp1 : in  std_logic_vector(15 downto 0);
		pp2 : in  std_logic_vector(14 downto 0);
		pp3 : in  std_logic_vector(13 downto 0);
		pp4 : in  std_logic_vector(12 downto 0);
		pp5 : in  std_logic_vector(11 downto 0);
		pp6 : in  std_logic_vector(10 downto 0);
		pp7 : in  std_logic_vector(9 downto 0);
		pp8 : in  std_logic_vector(8 downto 0);
		sum : out std_logic_vector(15 downto 0)
	);
end adder_radix2;
architecture adder_radix2_arch of adder_radix2 is
	component cla_15bit is
		port
		(
			a    : in  std_logic_vector(14 downto 0);
			b    : in  std_logic_vector(14 downto 0);
			cin  : in  std_logic;
			sum  : out std_logic_vector(14 downto 0);
			cout : out std_logic
		);
	end component cla_15bit;
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
	component cla_13bit is
		port
		(
			a    : in  std_logic_vector(12 downto 0);
			b    : in  std_logic_vector(12 downto 0);
			cin  : in  std_logic;
			sum  : out std_logic_vector(12 downto 0);
			cout : out std_logic
		);
	end component cla_13bit;
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
	component cla_11bit is
		port
		(
			a    : in  std_logic_vector(10 downto 0);
			b    : in  std_logic_vector(10 downto 0);
			cin  : in  std_logic;
			sum  : out std_logic_vector(10 downto 0);
			cout : out std_logic
		);
	end component cla_11bit;
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
	component cla_9bit is
		port
		(
			a    : in  std_logic_vector(8 downto 0);
			b    : in  std_logic_vector(8 downto 0);
			cin  : in  std_logic;
			sum  : out std_logic_vector(8 downto 0);
			cout : out std_logic
		);
	end component cla_9bit;
	signal sum1 : std_logic_vector(14 downto 0);
	signal sum2 : std_logic_vector(13 downto 0);
	signal sum3 : std_logic_vector(12 downto 0);
	signal sum4 : std_logic_vector(11 downto 0);
	signal sum5 : std_logic_vector(10 downto 0);
	signal sum6 : std_logic_vector(9 downto 0);
	signal sum7 : std_logic_vector(8 downto 0);
begin
	sum(0) <= pp1(0);
		U1 : cla_15bit port map (pp1(15 downto 1), pp2, cin, sum1);
	sum(1) <= sum1(0);
		U2 : cla_14bit port map (sum1(14 downto 1), pp3, '0', sum2);
	sum(2) <= sum2(0);
		U3 : cla_13bit port map (sum2(13 downto 1), pp4, '0', sum3);
	sum(3) <= sum3(0);
		U4 : cla_12bit port map (sum3(12 downto 1), pp5, '0', sum4);
	sum(4) <= sum4(0);
		U5 : cla_11bit port map (sum4(11 downto 1), pp6, '0', sum5);
	sum(5) <= sum5(0);
		U6 : cla_10bit port map (sum5(10 downto 1), pp7, '0', sum6);
	sum(6) <= sum6(0);
		U7 : cla_9bit port map (sum6(9 downto 1), pp8, '0', sum(15 downto 7));
end adder_radix2_arch;
