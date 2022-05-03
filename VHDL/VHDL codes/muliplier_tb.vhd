library ieee;
use ieee.std_logic_1164.all;
entity multiplier_tb is
end multiplier_tb;
architecture multiplier_tb_arch of multiplier_tb is
component multiplier
  port (
	    a  : in std_logic_vector(7 downto 0);
	    b  : in std_logic_vector(7 downto 0);
	    c   : out std_logic_vector(15 downto 0)
    );
end component;
signal at, bt : std_logic_vector(7 downto 0);
signal ct : std_logic_vector(15 downto 0);
begin
UUT: multiplier port map(at, bt, ct);
 at <= "10110010";
 bt <= "01111110";
end multiplier_tb_arch;
