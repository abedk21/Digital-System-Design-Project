library ieee;
use ieee.std_logic_1164.all;
entity multiplier_16bit is
  port (
	    a  : in std_logic_vector(15 downto 0);
	    b  : in std_logic_vector(15 downto 0);
	    cin : in std_logic;
	    c   : out std_logic_vector(31 downto 0)
    );
end multiplier_16bit;
architecture multiplier_16bit_arch of multiplier_16bit is
component ppg_16bit is
	port 
	(
		ctrl : in std_logic_vector (2 downto 0);
	    m : in std_logic_vector(15 downto 0);
	    ppg_out : out std_logic_vector(16 downto 0)
	);
end component ppg_16bit;
component adder_16bit is
	port 
	(
		cin : in std_logic;
	    pp1  : in std_logic_vector(31 downto 0);
	    pp2  : in std_logic_vector(29 downto 0);
	    pp3  : in std_logic_vector(27 downto 0);
	    pp4  : in std_logic_vector(25 downto 0);
	    pp5  : in std_logic_vector(23 downto 0);
	    pp6  : in std_logic_vector(21 downto 0);
	    pp7  : in std_logic_vector(19 downto 0);
	    pp8  : in std_logic_vector(17 downto 0);
	    sum   : out std_logic_vector(31 downto 0)
	);
end component adder_16bit;
signal inbits1 : std_logic_vector(2 downto 0);
signal ppg0_out : std_logic_vector(31 downto 0);
signal ppg1_out : std_logic_vector(29 downto 0);
signal ppg2_out : std_logic_vector(27 downto 0);
signal ppg3_out : std_logic_vector(25 downto 0);
signal ppg4_out : std_logic_vector(23 downto 0);
signal ppg5_out : std_logic_vector(21 downto 0);
signal ppg6_out : std_logic_vector(19 downto 0);
signal ppg7_out : std_logic_vector(17 downto 0);
begin
	inbits1(0) <= '0';
	inbits1(2 downto 1) <= b(1 downto 0);
	PP0: ppg_16bit port map (inbits1, a, ppg0_out(16 downto 0));
	ppg0_out(31 downto 17) <= (others => ppg0_out(16));

	PP1: ppg_16bit port map (b(3 downto 1), a, ppg1_out(16 downto 0));
	ppg1_out(29 downto 17) <= (others => ppg1_out(16));

	PP2: ppg_16bit port map (b(5 downto 3), a, ppg2_out(16 downto 0));
	ppg2_out(27 downto 17) <= (others => ppg2_out(16));

	PP3: ppg_16bit port map (b(7 downto 5), a, ppg3_out(16 downto 0));
	ppg3_out(25 downto 17) <= (others => ppg3_out(16));

	PP4: ppg_16bit port map (b(9 downto 7), a, ppg4_out(16 downto 0));
	ppg4_out(23 downto 17) <= (others => ppg4_out(16));

	PP5: ppg_16bit port map (b(11 downto 9), a, ppg5_out(16 downto 0));
	ppg5_out(21 downto 17) <= (others => ppg5_out(16));

	PP6: ppg_16bit port map (b(13 downto 11), a, ppg6_out(16 downto 0));
	ppg6_out(19 downto 17) <= (others => ppg6_out(16));

	PP7: ppg_16bit port map (b(15 downto 13), a, ppg7_out(16 downto 0));
	ppg7_out(17) <= ppg7_out(16);

	A1: adder_16bit port map (cin, ppg0_out, ppg1_out, ppg2_out, ppg3_out, ppg4_out, ppg5_out, ppg6_out, ppg7_out, c);
end multiplier_16bit_arch;
