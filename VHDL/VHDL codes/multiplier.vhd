library ieee;
use ieee.std_logic_1164.all;
entity multiplier is
        port (
                a   : in  std_logic_vector(7 downto 0);
                b   : in  std_logic_vector(7 downto 0);
                cin : in  std_logic;
                c   : out std_logic_vector(15 downto 0)
        );
end multiplier;
architecture multiplier_arch of multiplier is
        component ppg is
                port
                (
                        ctrl    : in  std_logic_vector (2 downto 0);
                        m       : in  std_logic_vector(7 downto 0);
                        ppg_out : out std_logic_vector(8 downto 0)
                );
        end component ppg;
        component adder is
                port
                (
                        cin : in  std_logic;
                        pp1 : in  std_logic_vector(15 downto 0);
                        pp2 : in  std_logic_vector(13 downto 0);
                        pp3 : in  std_logic_vector(11 downto 0);
                        pp4 : in  std_logic_vector(9 downto 0);
                        sum : out std_logic_vector(15 downto 0)
                );
        end component adder;
        signal inbits1  : std_logic_vector(2 downto 0);
        signal ppg0_out : std_logic_vector(15 downto 0);
        signal ppg1_out : std_logic_vector(13 downto 0);
        signal ppg2_out : std_logic_vector(11 downto 0);
        signal ppg3_out : std_logic_vector(9 downto 0);
begin
        inbits1(0)          <= '0';
        inbits1(2 downto 1) <= b(1 downto 0);
                PP0 : ppg port map (inbits1, a, ppg0_out(8 downto 0));
        ppg0_out(15 downto 9) <= (others => ppg0_out(8));

                PP1 : ppg port map (b(3 downto 1), a, ppg1_out(8 downto 0));
        ppg1_out(13 downto 9) <= (others => ppg1_out(8));

                PP2 : ppg port map (b(5 downto 3), a, ppg2_out(8 downto 0));
        ppg2_out(11 downto 9) <= (others => ppg2_out(8));

                PP3 : ppg port map (b(7 downto 5), a, ppg3_out(8 downto 0));
        ppg3_out(9) <= ppg3_out(8);

                A1 : adder port map (cin, ppg0_out, ppg1_out, ppg2_out, ppg3_out, c);
end multiplier_arch;