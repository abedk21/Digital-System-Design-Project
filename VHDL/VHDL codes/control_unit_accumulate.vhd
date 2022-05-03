library ieee;
use ieee.std_logic_1164.all;
entity control_unit_accumulate is
        port (
                load, clk, clear : in std_logic;
                en1 : out std_logic;
                en2 : out std_logic;
                en3 : out std_logic;
                end_flag : out std_logic
        );
end control_unit_accumulate;
architecture control_unit_accumulate_arch of control_unit_accumulate is
component counter
	port (
		clk, reset, en : in std_logic;
		max_pulse : out std_logic;
		q : out std_logic_vector (3 downto 0)
		);
end component;
signal reset1 : std_logic;
signal reset2 : std_logic;
signal load_en : std_logic;
signal output_en : std_logic;
signal end_state : std_logic;
signal max : std_logic;
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
            end if;
            if (max = '1') then
            	end_state <= '1';
            	output_en <= '0';
          	else
        	  end_state <= '0';
            end if;
        end if;
    end process;

    COUNT: counter port map (clk, clear, load_en, max);
    end_flag <= '1' when end_state = '1' else '0';
    reset1 <=  max or clear;
    reset2 <= clear;
	en1 <= '1' when load_en = '1' else '0';
	en2 <= '1' when output_en = '1' else '0';
	en3 <= '1' when (max = '1' and end_state /= '1') else '0';
end control_unit_accumulate_arch;







