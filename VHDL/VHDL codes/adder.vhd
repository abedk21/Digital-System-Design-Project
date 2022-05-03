library ieee;
use ieee.std_logic_1164.all;
entity adder is
        port (
                cin : in  std_logic;
                pp1 : in  std_logic_vector(15 downto 0);
                pp2 : in  std_logic_vector(13 downto 0);
                pp3 : in  std_logic_vector(11 downto 0);
                pp4 : in  std_logic_vector(9 downto 0);
                sum : out std_logic_vector(15 downto 0)
        );
end adder;
architecture adder_arch of adder is
        component cla_14bit is
                port
                (
                        a    : in  std_logic_vector(13 downto 0);
                        b    : in  std_logic_vector(13 downto 0);
                        cin  : in  std_logic;
                        sum  : out std_logic_vector(13 downto 0);
                        cout : out std_logic
                );
        end component;
        component cla_12bit is
                port
                (
                        a    : in  std_logic_vector(11 downto 0);
                        b    : in  std_logic_vector(11 downto 0);
                        cin  : in  std_logic;
                        sum  : out std_logic_vector(11 downto 0);
                        cout : out std_logic
                );
        end component;
        component cla_10bit is
                port
                (
                        a    : in  std_logic_vector(9 downto 0);
                        b    : in  std_logic_vector(9 downto 0);
                        cin  : in  std_logic;
                        sum  : out std_logic_vector(9 downto 0);
                        cout : out std_logic
                );
        end component;
        signal sum1 : std_logic_vector(13 downto 0);
        signal sum2 : std_logic_vector(11 downto 0);
begin
                sum(1 downto 0) <= pp1(1 downto 0);
                U1 : cla_14bit port map (pp1(15 downto 2), pp2, cin, sum1);
        sum(3 downto 2) <= sum1(1 downto 0);
                U2 : cla_12bit port map (sum1(13 downto 2), pp3, '0', sum2);
        sum(5 downto 4) <= sum2(1 downto 0);
                U3 : cla_10bit port map (sum2(11 downto 2), pp4, '0', sum(15 downto 6));
end adder_arch;