library ieee;
use ieee.std_logic_1164.all;
entity reg8 is
        port (
                clk, reset, en: in std_logic;
                d: in std_logic_vector(7 downto 0);
                q: out std_logic_vector(7 downto 0)
        );
end reg8;
architecture reg8_arch of reg8 is
signal q_reg : std_logic_vector(7 downto 0);
signal q_next : std_logic_vector(7 downto 0);
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
end reg8_arch;