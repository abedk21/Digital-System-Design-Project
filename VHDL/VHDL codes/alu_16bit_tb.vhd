library ieee;
use ieee.std_logic_1164.all;
entity alu_16bit_tb is
end alu_16bit_tb;
architecture alu_16bit_tb_arch of alu_16bit_tb is
        component alu_16bit
                port
                (
                        a                : in  std_logic_vector(15 downto 0);
                        b                : in  std_logic_vector(15 downto 0);
                        load, clk, clear : in  std_logic;
                        end_flag         : out std_logic;
                        z                : out std_logic_vector(31 downto 0)
                );
        end component;
        signal clk      : std_logic                      := '0';
        signal clear    : std_logic                      := '0';
        signal load     : std_logic                      := '0';
        signal at       : std_logic_vector (15 downto 0) := "1011000011101011";
        signal bt       : std_logic_vector (15 downto 0) := "0111011000001100";
        signal zt       : std_logic_vector (31 downto 0);
        signal end_flag : std_logic;
begin
        clk <= not clk after 10 ns;
        --clear <= '1' after 15 ns, '0' after 20 ns, '1' after 100 ns, '0' after 105 ns, '1' after 220 ns, '0' after 225 ns;
        load <= '1' after 5 ns, '0' after 7 ns, '1' after 45 ns, '0' after 47 ns, '1' after 85 ns, '0' after 87 ns, '1' after 125 ns, '0' after 127 ns, '1' after 165 ns, '0' after 167 ns, '1' after 205 ns, '0' after 207 ns, '1' after 245 ns, '0' after 247 ns, '1' after 285 ns, '0' after 287 ns, '1' after 325 ns, '0' after 327 ns, '1' after 365 ns, '0' after 367 ns;
                UUT : alu_16bit port map (at, bt, load, clk, clear, end_flag, zt);
        at <= "1010011001001101" after 40 ns, "0100100110100101" after 80 ns, "0010011011010010" after 120 ns, "1111000101001010" after 160 ns, "0000010011110101" after 200 ns, "1011001001000011" after 240 ns, "1111100010001100" after 280 ns, "1111111111111111" after 320 ns, "0000000000000000" after 360 ns;
        bt <= "1001111000110001" after 40 ns, "0100010000100010" after 80 ns, "1110010000100011" after 120 ns, "1111000101001010" after 160 ns, "0101000111110000" after 200 ns, "1010000100001010" after 240 ns, "1111000110010101" after 280 ns, "1111111100000011" after 320 ns, "0001110011001100" after 360 ns;
end alu_16bit_tb_arch;



