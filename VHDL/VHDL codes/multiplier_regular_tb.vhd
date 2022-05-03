library ieee;
use ieee.std_logic_1164.all;
entity multiplier_regular_tb is
end multiplier_regular_tb;
architecture multiplier_regular_tb_arch of multiplier_regular_tb is
component multiplier_regular
  port (
	    a  : in std_logic_vector(7 downto 0);
	    b  : in std_logic_vector(7 downto 0);
	    c   : out std_logic_vector(15 downto 0)
    );
end component;
signal at, bt : std_logic_vector(7 downto 0);
signal ct : std_logic_vector(15 downto 0);
begin
UUT: multiplier_regular port map(at, bt, ct);
 at <= "10011111";
 bt <= "11010010";
end multiplier_regular_tb_arch;

