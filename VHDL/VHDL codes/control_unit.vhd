library ieee;
use ieee.std_logic_1164.all;
entity control_unit is
        port (
                load, clk, clear : in std_logic;
                en1 : out std_logic;
                en2 : out std_logic;
                end_flag : out std_logic
        );
end control_unit;
architecture control_unit_arch of control_unit is
signal load_en : std_logic;
signal output_en : std_logic;
signal reset1 : std_logic;
signal reset2 : std_logic;
begin
    process (load, reset1)
    begin
	        if (reset1 = '1') then
	            load_en <= '0';
			elsif (load'event and load = '0') then
                load_en <= '1';
            end if;
    end process;

	process (clk, reset2)
    begin
	        if (reset2 = '1') then
            	output_en <= '0';
			elsif (clk'event and clk = '1') then
				if (load_en = '1') then
					output_en <= '1';
				else
					output_en <= '0';
				end if;
            end if;
    end process;

    reset1 <= output_en or clear;
    reset2 <= clear;
	en1 <= '1' when (load_en = '1' and output_en /= '1') else '0';
	en2 <= '1' when output_en = '1' else '0';
	end_flag <= not output_en;
end control_unit_arch;

