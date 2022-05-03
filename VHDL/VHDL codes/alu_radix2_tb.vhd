library ieee;
use ieee.std_logic_1164.all;
entity alu_radix2_tb is
end alu_radix2_tb;
architecture alu_radix2_tb_arch of alu_radix2_tb is
        component alu_radix2
                port
                (
                        a                : in  std_logic_vector(7 downto 0);
                        b                : in  std_logic_vector(7 downto 0);
                        load, clk, clear : in  std_logic;
                        end_flag         : out std_logic;
                        z                : out std_logic_vector(15 downto 0)
                );
        end component;
        signal clk      : std_logic                     := '0';
        signal clear    : std_logic                     := '0';
        signal load     : std_logic                     := '0';
        signal at       : std_logic_vector (7 downto 0) := "10001110";
        signal bt       : std_logic_vector (7 downto 0) := "00001101";
        signal zt       : std_logic_vector (15 downto 0);
        signal end_flag : std_logic;
begin
        clk <= not clk after 10 ns;
        --clear <= '1' after 15 ns, '0' after 20 ns, '1' after 100 ns, '0' after 105 ns, '1' after 220 ns, '0' after 225 ns;
        load <= '1' after 5 ns, '0' after 7 ns, '1' after 45 ns, '0' after 47 ns, '1' after 85 ns, '0' after 87 ns, '1' after 125 ns, '0' after 127 ns, '1' after 165 ns, '0' after 167 ns, '1' after 205 ns, '0' after 207 ns, '1' after 245 ns, '0' after 247 ns, '1' after 285 ns, '0' after 287 ns, '1' after 325 ns, '0' after 327 ns, '1' after 365 ns, '0' after 367 ns;
                UUT : alu_radix2 port map (at, bt, load, clk, clear, end_flag, zt);
        at <= "11111111" after 40 ns, "01001001" after 80 ns, "00001101" after 120 ns, "11110010" after 160 ns, "00000101" after 200 ns, "10100011" after 240 ns, "11111100" after 280 ns, "01000111" after 320 ns, "01011101" after 360 ns;
        bt <= "11111111" after 40 ns, "11100101" after 80 ns, "00010101" after 120 ns, "10101000" after 160 ns, "11100011" after 200 ns, "00111011" after 240 ns, "00000000" after 280 ns, "01010001" after 320 ns, "10101011" after 360 ns;
end alu_radix2_tb_arch;




