library ieee;
use ieee.std_logic_1164.all;
entity multiplier_radix2_tb is
end multiplier_radix2_tb;
architecture multiplier_radix2_tb_arch of multiplier_radix2_tb is
component multiplier_radix2
  port (
	    a  : in std_logic_vector(7 downto 0);
	    b  : in std_logic_vector(7 downto 0);
	    c   : out std_logic_vector(15 downto 0)
    );
end component;
signal at, bt : std_logic_vector(7 downto 0);
signal ct : std_logic_vector(15 downto 0);
begin
UUT: multiplier_radix2 port map(at, bt, ct);
 at <= "10010111";
 bt <= "11000010";
end multiplier_radix2_tb_arch;


