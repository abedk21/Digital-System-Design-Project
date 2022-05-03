library ieee;
use ieee.std_logic_1164.all;
entity adder_16bit is
        port (
                cin : in  std_logic;
                pp1 : in  std_logic_vector(31 downto 0);
                pp2 : in  std_logic_vector(29 downto 0);
                pp3 : in  std_logic_vector(27 downto 0);
                pp4 : in  std_logic_vector(25 downto 0);
                pp5 : in  std_logic_vector(23 downto 0);
                pp6 : in  std_logic_vector(21 downto 0);
                pp7 : in  std_logic_vector(19 downto 0);
                pp8 : in  std_logic_vector(17 downto 0);
                sum : out std_logic_vector(31 downto 0)
        );
end adder_16bit;
architecture adder_16bit_arch of adder_16bit is
        component cla_30bit is
                port
                (
                        a    : in  std_logic_vector(29 downto 0);
                        b    : in  std_logic_vector(29 downto 0);
                        cin  : in  std_logic;
                        sum  : out std_logic_vector(29 downto 0);
                        cout : out std_logic
                );
        end component cla_30bit;
        component cla_28bit is
                port
                (
                        a    : in  std_logic_vector(27 downto 0);
                        b    : in  std_logic_vector(27 downto 0);
                        cin  : in  std_logic;
                        sum  : out std_logic_vector(27 downto 0);
                        cout : out std_logic
                );
        end component cla_28bit;
        component cla_26bit is
                port
                (
                        a    : in  std_logic_vector(25 downto 0);
                        b    : in  std_logic_vector(25 downto 0);
                        cin  : in  std_logic;
                        sum  : out std_logic_vector(25 downto 0);
                        cout : out std_logic
                );
        end component cla_26bit;
        component cla_24bit is
                port
                (
                        a    : in  std_logic_vector(23 downto 0);
                        b    : in  std_logic_vector(23 downto 0);
                        cin  : in  std_logic;
                        sum  : out std_logic_vector(23 downto 0);
                        cout : out std_logic
                );
        end component cla_24bit;
        component cla_22bit is
                port
                (
                        a    : in  std_logic_vector(21 downto 0);
                        b    : in  std_logic_vector(21 downto 0);
                        cin  : in  std_logic;
                        sum  : out std_logic_vector(21 downto 0);
                        cout : out std_logic
                );
        end component cla_22bit;
        component cla_20bit is
                port
                (
                        a    : in  std_logic_vector(19 downto 0);
                        b    : in  std_logic_vector(19 downto 0);
                        cin  : in  std_logic;
                        sum  : out std_logic_vector(19 downto 0);
                        cout : out std_logic
                );
        end component cla_20bit;
        component cla_18bit is
                port
                (
                        a    : in  std_logic_vector(17 downto 0);
                        b    : in  std_logic_vector(17 downto 0);
                        cin  : in  std_logic;
                        sum  : out std_logic_vector(17 downto 0);
                        cout : out std_logic
                );
        end component cla_18bit;
        signal sum1 : std_logic_vector(29 downto 0);
        signal sum2 : std_logic_vector(27 downto 0);
        signal sum3 : std_logic_vector(25 downto 0);
        signal sum4 : std_logic_vector(23 downto 0);
        signal sum5 : std_logic_vector(21 downto 0);
        signal sum6 : std_logic_vector(19 downto 0);
begin
        sum(1 downto 0) <= pp1(1 downto 0);
                U1 : cla_30bit port map (pp1(31 downto 2), pp2, cin, sum1);
        sum(3 downto 2) <= sum1(1 downto 0);
                U2 : cla_28bit port map (sum1(29 downto 2), pp3, '0', sum2);
        sum(5 downto 4) <= sum2(1 downto 0);
                U3 : cla_26bit port map (sum2(27 downto 2), pp4, '0', sum3);
        sum(7 downto 6) <= sum3(1 downto 0);
                U4 : cla_24bit port map (sum3(25 downto 2), pp5, '0', sum4);
        sum(9 downto 8) <= sum4(1 downto 0);
                U5 : cla_22bit port map (sum4(23 downto 2), pp6, '0', sum5);
        sum(11 downto 10) <= sum5(1 downto 0);
                U6 : cla_20bit port map (sum5(21 downto 2), pp7, '0', sum6);
        sum(13 downto 12) <= sum6(1 downto 0);
                U7 : cla_18bit port map (sum6(19 downto 2), pp8, '0', sum(31 downto 14));
end adder_16bit_arch;
