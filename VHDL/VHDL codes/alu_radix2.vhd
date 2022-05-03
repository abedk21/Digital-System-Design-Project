library ieee;
use ieee.std_logic_1164.all;
entity alu_radix2 is
    port (
        a                : in  std_logic_vector(7 downto 0);
        b                : in  std_logic_vector(7 downto 0);
        load, clk, clear : in  std_logic;
        end_flag         : out std_logic;
        z                : out std_logic_vector(15 downto 0)
    );
end alu_radix2;
architecture alu_radix2_arch of alu_radix2 is
    component multiplier_radix2
        port
        (
            a   : in  std_logic_vector(7 downto 0);
            b   : in  std_logic_vector(7 downto 0);
            c   : out std_logic_vector(15 downto 0)
        );
    end component;
    component incrementer_14bit
        port (
                cin     : in  std_logic;
                inc_in  : in  std_logic_vector (13 downto 0);
                inc_out : out std_logic_vector (13 downto 0)
        );
	end component;
    component twoscompgen
        port (
                enable : in std_logic;
                a : in std_logic_vector(7 downto 0);
                r : out std_logic_vector(7 downto 0)
        );
end component;
    component control_unit
        port (
            load, clk, clear : in  std_logic;
            en1              : out std_logic;
            en2              : out std_logic;
            end_flag         : out std_logic
        );
    end component;
    component reg8
        port (
            clk, reset, en : in  std_logic;
            d              : in  std_logic_vector(7 downto 0);
            q              : out std_logic_vector(7 downto 0)
        );
    end component;
    component reg16
        port (
            clk, reset, en : in  std_logic;
            d              : in  std_logic_vector(15 downto 0);
            q              : out std_logic_vector(15 downto 0)
        );
    end component;
    signal en1, en2 : std_logic;
    signal mult_out : std_logic_vector (15 downto 0);
    signal rega_out : std_logic_vector (7 downto 0);
    signal regb_out : std_logic_vector (7 downto 0);
    signal a_signed : std_logic_vector (7 downto 0);
    signal b_signed : std_logic_vector (7 downto 0);
    signal inc_out : std_logic_vector (13 downto 0);
    signal z_temp   : std_logic_vector (15 downto 0);
begin
        CU   : control_unit port map (load, clk, clear, en1, en2, end_flag);
        REGA : reg8 port map (clk, clear, en1, a, rega_out);
        REGB : reg8 port map (clk, clear, en1, b, regb_out);
        SIGNA : twoscompgen port map ('1', rega_out, a_signed);
        SIGNB : twoscompgen port map ('1', regb_out, b_signed);
        MULT : multiplier_radix2 port map (a_signed, b_signed, mult_out);
        INC: incrementer_14bit port map ('1', mult_out(15 downto 2), inc_out);
        z_temp(13 downto 0) <= inc_out;
        z_temp(15 downto 14) <= (others => inc_out(13));
        REGZ : reg16 port map (clk, clear, en2, z_temp, z);
end alu_radix2_arch;


