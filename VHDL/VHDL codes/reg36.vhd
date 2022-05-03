library ieee;
use ieee.std_logic_1164.all;
entity reg36 is
	port (
		clk, reset, en : in  std_logic;
		d              : in  std_logic_vector(35 downto 0);
		q              : out std_logic_vector(35 downto 0)
	);
end reg36;
architecture reg36_arch of reg36 is
	signal q_reg  : std_logic_vector(35 downto 0) := (others => '0');
	signal q_next : std_logic_vector(35 downto 0);
begin
	process (clk, reset)
	begin
		if (reset = '1') then
			q_reg <= (others => '0');
		elsif (clk'event and clk = '1') then
			q_reg <= q_next;
		end if;
	end process;
	q_next <= d when en='1' else
		q_reg;
	q <= q_reg;
end reg36_arch;

