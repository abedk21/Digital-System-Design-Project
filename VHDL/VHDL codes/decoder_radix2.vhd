library ieee;
use ieee.std_logic_1164.all;
entity decoder_radix2 is
        port (
                sel : in  std_logic_vector (1 downto 0);
                x   : out std_logic_vector (1 downto 0)
        );
end decoder_radix2;
architecture decoder_radix2_arch of decoder_radix2 is
begin
        with sel select
        x <=    "00" when "01",
                "01" when "10",
                "10" when others;
end decoder_radix2_arch;
