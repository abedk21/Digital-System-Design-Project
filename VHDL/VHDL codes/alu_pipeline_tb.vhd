library ieee;
use ieee.std_logic_1164.all;
entity alu_pipeline_tb is
end alu_pipeline_tb;
architecture alu_pipeline_tb_arch of alu_pipeline_tb is
	component alu_pipeline_16bit
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
	--clear <= '1' after 15 ns, '0' after 20 ns;
        --clear <= '1' after 100 ns, '0' after 110 ns;
	load <= '1' after 5 ns, '0' after 7 ns;
		UUT : alu_pipeline_16bit port map (at, bt, load, clk, clear, end_flag, zt);
	at <= "1010011001001101" after 20 ns, "0001101111100011" after 40 ns, "1101010100001111" after 60 ns, "1111111010001010" after 80 ns, "0100100001111111" after 100 ns, "0111001010101101" after 120 ns, "1110001010100101" after 140 ns, "0000011010101100" after 160 ns, "0010110001110010" after 180 ns;
	bt <= "1001111000110001" after 20 ns, "0001110001010101" after 40 ns, "1111111010011101" after 60 ns, "1111111000100000" after 80 ns, "0100100001111111" after 100 ns, "0000000000000000" after 120 ns, "1111111111111111" after 140 ns, "1010001000000111" after 160 ns, "0000101010010011" after 180 ns;
end alu_pipeline_tb_arch;




