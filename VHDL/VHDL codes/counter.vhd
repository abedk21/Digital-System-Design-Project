library ieee;
use ieee.std_logic_1164.all;
entity counter is
	port (
		clk, reset, en : in  std_logic;
		max_pulse      : out std_logic;
		q              : out std_logic_vector (3 downto 0)
	);
end counter;
architecture counter_arch of counter is
	component incrementer_4bit
		port (
			cin     : in  std_logic;
			inc_in  : in  std_logic_vector(3 downto 0);
			inc_out : out std_logic_vector(3 downto 0)
		);
	end component;
	signal r_reg  : std_logic_vector (3 downto 0) := "0000";
	signal r_next : std_logic_vector (3 downto 0);
begin
	process (clk, reset)
	begin
		if (reset = '1') then
			r_reg <= (others => '0');
		elsif (clk'event and clk='1') then
			r_reg <= r_next;
		end if;
	end process;

		INC : incrementer_4bit port map (en, r_reg, r_next);
	q         <= r_reg;
	max_pulse <= '1' when r_reg="1011" else '0';
end counter_arch;


