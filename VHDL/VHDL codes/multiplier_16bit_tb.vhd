library ieee;
use ieee.std_logic_1164.all;
entity multiplier_16bit_tb is
end multiplier_16bit_tb;
architecture multiplier_16bit_tb_arch of multiplier_16bit_tb is
component multiplier_16bit
  port (
	    a  : in std_logic_vector(15 downto 0);
	    b  : in std_logic_vector(15 downto 0);
	    cin : in std_logic;
	    c   : out std_logic_vector(31 downto 0)
    );
end component;
signal at, bt : std_logic_vector(15 downto 0);
signal ct : std_logic_vector(31 downto 0);
begin
UUT: multiplier_16bit port map(at, bt, '1', ct);
 at <= "1011010011101011";
 bt <= "0111011010001100";
end multiplier_16bit_tb_arch;