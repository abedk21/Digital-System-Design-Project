library ieee;
use ieee.std_logic_1164.all;
entity ppg is
	port (
		ctrl    : in  std_logic_vector (2 downto 0);
		m       : in  std_logic_vector(7 downto 0);
		ppg_out : out std_logic_vector(8 downto 0)
	);
end ppg;
architecture ppg_arch of ppg is
	component decoder
		port
		(
			sel : in  std_logic_vector (2 downto 0);
			x   : out std_logic_vector (2 downto 0)
		);
	end component;
	component twoscompgen
		port
		(
			enable : in  std_logic;
			a      : in  std_logic_vector(7 downto 0);
			r      : out std_logic_vector(7 downto 0)
		);
	end component;
	component shifter
		port
		(
			ctrl      : in  std_logic_vector (1 downto 0);
			shift_in  : in  std_Logic_vector (7 downto 0);
			shift_out : out std_logic_vector (8 downto 0)
		);
	end component;
	signal decoder_out     : std_logic_vector (2 downto 0);
	signal twoscompgen_out : std_logic_vector (7 downto 0);
begin
		U1 : decoder port map (ctrl, decoder_out);
		U2 : twoscompgen port map (decoder_out(0), m, twoscompgen_out);
		U3 : shifter port map (decoder_out(2 downto 1), twoscompgen_out, ppg_out);
end ppg_arch;
