library ieee;
use ieee.std_logic_1164.all;
entity ppg_radix2 is
        port (
                ctrl    : in  std_logic_vector (1 downto 0);
                m       : in  std_logic_vector(7 downto 0);
                ppg_out : out std_logic_vector(7 downto 0)
        );
end ppg_radix2;
architecture ppg_radix2_arch of ppg_radix2 is
        component decoder_radix2
                port
                (
                        sel : in  std_logic_vector (1 downto 0);
                        x   : out std_logic_vector (1 downto 0)
                );
        end component;
        component twoscompgen
                port
                (
                        enable : in  std_logic;
                        a      : in  std_logic_vector(7 downto 0);
                        r      : out std_logic_vector(7 downto 0)
                );
        end component;
        signal decoder_out     : std_logic_vector (1 downto 0);
        signal twoscompgen_out : std_logic_vector (7 downto 0);
begin
                U1 : decoder_radix2 port map (ctrl, decoder_out);
                U2 : twoscompgen port map (decoder_out(0), m, twoscompgen_out);
                ppg_out <= "00000000" when decoder_out(1) = '1' else twoscompgen_out;
end ppg_radix2_arch;

