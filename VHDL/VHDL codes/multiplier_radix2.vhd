library ieee;
use ieee.std_logic_1164.all;
entity multiplier_radix2 is
        port (
                a   : in  std_logic_vector(7 downto 0);
                b   : in  std_logic_vector(7 downto 0);
                c   : out std_logic_vector(15 downto 0)
        );
end multiplier_radix2;
architecture multiplier_radix2_arch of multiplier_radix2 is
        component ppg_radix2 is
                port
                (
                        ctrl    : in  std_logic_vector (1 downto 0);
                        m       : in  std_logic_vector(7 downto 0);
                        ppg_out : out std_logic_vector(7 downto 0)
                );
        end component ppg_radix2;
        component adder_radix2 is
                port
                (
                        cin : in  std_logic;
                        pp1 : in  std_logic_vector(15 downto 0);
                        pp2 : in  std_logic_vector(14 downto 0);
                        pp3 : in  std_logic_vector(13 downto 0);
                        pp4 : in  std_logic_vector(12 downto 0);
                        pp5 : in  std_logic_vector(11 downto 0);
                        pp6 : in  std_logic_vector(10 downto 0);
                        pp7 : in  std_logic_vector(9 downto 0);
                        pp8 : in  std_logic_vector(8 downto 0);
                        sum : out std_logic_vector(15 downto 0)
                );
        end component adder_radix2;
        signal inbits1  : std_logic_vector(1 downto 0);
        signal ppg0_out : std_logic_vector(15 downto 0);
        signal ppg1_out : std_logic_vector(14 downto 0);
        signal ppg2_out : std_logic_vector(13 downto 0);
        signal ppg3_out : std_logic_vector(12 downto 0);
        signal ppg4_out : std_logic_vector(11 downto 0);
        signal ppg5_out : std_logic_vector(10 downto 0);
        signal ppg6_out : std_logic_vector(9 downto 0);
        signal ppg7_out : std_logic_vector(8 downto 0);
begin
        inbits1(0)          <= '0';
        inbits1(1) <= b(0);
                PP0 : ppg_radix2 port map (inbits1, a, ppg0_out(7 downto 0));
        ppg0_out(15 downto 8) <= (others => ppg0_out(7));

                PP1 : ppg_radix2 port map (b(1 downto 0), a, ppg1_out(7 downto 0));
        ppg1_out(14 downto 8) <= (others => ppg1_out(7));

                PP2 : ppg_radix2 port map (b(2 downto 1), a, ppg2_out(7 downto 0));
        ppg2_out(13 downto 8) <= (others => ppg2_out(7));

                PP3 : ppg_radix2 port map (b(3 downto 2), a, ppg3_out(7 downto 0));
        ppg3_out(12 downto 8) <= (others => ppg3_out(7));

                PP4 : ppg_radix2 port map (b(4 downto 3), a, ppg4_out(7 downto 0));
        ppg4_out(11 downto 8) <= (others => ppg4_out(7));

                PP5 : ppg_radix2 port map (b(5 downto 4), a, ppg5_out(7 downto 0));
        ppg5_out(10 downto 8) <= (others => ppg5_out(7));

                PP6 : ppg_radix2 port map (b(6 downto 5), a, ppg6_out(7 downto 0));
        ppg6_out(9 downto 8) <= (others => ppg6_out(7));

                PP7 : ppg_radix2 port map (b(7 downto 6), a, ppg7_out(7 downto 0));
        ppg7_out(8) <= ppg7_out(7);

                A1 : adder_radix2 port map ('0', ppg0_out, ppg1_out, ppg2_out, ppg3_out, ppg4_out, ppg5_out, ppg6_out, ppg7_out, c);
end multiplier_radix2_arch;
