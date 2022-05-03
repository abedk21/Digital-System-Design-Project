library ieee;
use ieee.std_logic_1164.all;
entity alu_accumulate is
	port (
		a                : in  std_logic_vector(15 downto 0);
		b                : in  std_logic_vector(15 downto 0);
		load, clk, clear : in  std_logic;
		end_flag         : out std_logic;
		z                : out std_logic_vector(35 downto 0)
	);
end alu_accumulate;
architecture alu_accumulate_arch of alu_accumulate is
	component multiplier_16bit
		port
		(
			a   : in  std_logic_vector(15 downto 0);
			b   : in  std_logic_vector(15 downto 0);
			cin : in  std_logic;
			c   : out std_logic_vector(31 downto 0)
		);
	end component;
	component twoscompgen_16bit
		port (
			enable : in  std_logic;
			a      : in  std_logic_vector(15 downto 0);
			r      : out std_logic_vector(15 downto 0)
		);
	end component;
	component control_unit_accumulate
		port (
			load, clk, clear : in  std_logic;
			en1              : out std_logic;
			en2              : out std_logic;
                        en3              : out std_logic;
			end_flag         : out std_logic
		);
	end component;
	component reg16
		port (
			clk, reset, en : in  std_logic;
			d              : in  std_logic_vector(15 downto 0);
			q              : out std_logic_vector(15 downto 0)
		);
	end component;
	component reg36
		port (
			clk, reset, en : in  std_logic;
			d              : in  std_logic_vector(35 downto 0);
			q              : out std_logic_vector(35 downto 0)
		);
	end component;
	component adder_accumulate is
		port
		(
			cin : in  std_logic;
			a   : in  std_logic_vector(35 downto 0);
			b   : in  std_logic_vector(35 downto 0);
			sum : out std_logic_vector(35 downto 0)
		);
	end component;
	component incrementer_34bit
		port (
			cin     : in  std_logic;
			inc_in  : in  std_logic_vector(33 downto 0);
			inc_out : out std_logic_vector(33 downto 0)
		);
	end component;
	signal en1, en2, en3 : std_logic;
	signal mult_out            : std_logic_vector (31 downto 0);
	signal mult_temp           : std_logic_vector (35 downto 0);
	signal rega_out            : std_logic_vector (15 downto 0);
	signal regb_out            : std_logic_vector (15 downto 0);
	signal a_signed            : std_logic_vector (15 downto 0);
	signal b_signed            : std_logic_vector (15 downto 0);
	signal regc_out            : std_logic_vector (35 downto 0);
        signal regz_out            : std_logic_vector (35 downto 0);
	signal z_inc               : std_logic_vector (33 downto 0);
	signal z_temp              : std_logic_vector (35 downto 0);
	signal sum                 : std_logic_vector (35 downto 0);
begin
		CU    : control_unit_accumulate port map (load, clk, clear, en1, en2, en3, end_flag);
		REGA  : reg16 port map (clk, clear, en1, a, rega_out);
		REGB  : reg16 port map (clk, clear, en1, b, regb_out);
		SIGNA : twoscompgen_16bit port map ('1', rega_out, a_signed);
		SIGNB : twoscompgen_16bit port map ('1', regb_out, b_signed);
		MULT  : multiplier_16bit port map (a_signed, b_signed, '0', mult_out);
	mult_temp (31 downto 0)  <= mult_out;
	mult_temp (35 downto 32) <= (others => mult_out(31));
		ADD  : adder_accumulate port map ('0', mult_temp, regc_out, sum);
		REGC : reg36 port map (clk, clear, en2, sum, regc_out);
		INC  : incrementer_34bit port map(en3, regc_out(35 downto 2), z_inc);
	z_temp(33 downto 0)  <= z_inc;
	z_temp(35 downto 34) <= (others => z_inc(33));
        REGZ : reg36 port map (clk, clear, en3, z_temp, regz_out);
	z                    <= regz_out;
end alu_accumulate_arch;




