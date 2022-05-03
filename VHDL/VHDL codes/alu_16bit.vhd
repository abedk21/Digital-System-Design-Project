library ieee;
use ieee.std_logic_1164.all;
entity alu_16bit is
        port (
                a                : in  std_logic_vector(15 downto 0);
                b                : in  std_logic_vector(15 downto 0);
                load, clk, clear : in  std_logic;
                end_flag         : out std_logic;
                z                : out std_logic_vector(31 downto 0)
        );
end alu_16bit;
architecture alu_16bit_arch of alu_16bit is
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
                enable : in std_logic;
                a : in std_logic_vector(15 downto 0);
                r : out std_logic_vector(15 downto 0)
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
        component reg16
                port (
                        clk, reset, en : in  std_logic;
                        d              : in  std_logic_vector(15 downto 0);
                        q              : out std_logic_vector(15 downto 0)
                );
        end component;
        component reg32
                port (
                        clk, reset, en : in  std_logic;
                        d              : in  std_logic_vector(31 downto 0);
                        q              : out std_logic_vector(31 downto 0)
                );
        end component;
        signal en1, en2 : std_logic;
        signal mult_out : std_logic_vector (31 downto 0);
        signal rega_out : std_logic_vector (15 downto 0);
        signal regb_out : std_logic_vector (15 downto 0);
        signal a_signed : std_logic_vector (15 downto 0);
        signal b_signed : std_logic_vector (15 downto 0);
        signal z_temp   : std_logic_vector (31 downto 0);
begin
                CU   : control_unit port map (load, clk, clear, en1, en2, end_flag);
                REGA : reg16 port map (clk, clear, en1, a, rega_out);
                REGB : reg16 port map (clk, clear, en1, b, regb_out);
                SIGNA : twoscompgen_16bit port map ('1', rega_out, a_signed);
                SIGNB : twoscompgen_16bit port map ('1', regb_out, b_signed);
                MULT : multiplier_16bit port map (a_signed, b_signed, en2, mult_out);
        z_temp(29 downto 0)  <= mult_out(31 downto 2);
        z_temp(31 downto 30) <= (others => mult_out(31));
                REGZ : reg32 port map (clk, clear, en2, z_temp, z);
end alu_16bit_arch;


