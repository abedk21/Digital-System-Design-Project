library ieee;
use ieee.std_logic_1164.all;
entity shifter_16bit is
	port
	(
		ctrl      : in  std_logic_vector (1 downto 0);
		shift_in  : in  std_Logic_vector (15 downto 0);
		shift_out : out std_logic_vector (16 downto 0)
	);
end shifter_16bit;
architecture shifter_16bit_arch of shifter_16bit is
	component mux_2to1
		port
		(
			sel     : in  std_logic;
			mux_in1 : in  std_logic;
			mux_in2 : in  std_logic;
			c       : out std_logic
		);
	end component;
	signal temp   : std_logic_vector (16 downto 0);
	signal out1   : std_logic_vector (16 downto 0);
	signal shift1 : std_logic_vector (16 downto 0);
begin
	temp(15 downto 0)    <= shift_in;
	temp(16)             <= shift_in(15);
	shift1(0)            <= '0';
	shift1 (16 downto 1) <= shift_in (15 downto 0);
	MUX : for i in 0 to 16 generate
			U1 : mux_2to1 port map (ctrl(0), temp(i), '0', out1(i));
			U2 : mux_2to1 port map (ctrl(1), shift1(i), out1(i), shift_out(i));
	end generate MUX;
end shifter_16bit_arch;

