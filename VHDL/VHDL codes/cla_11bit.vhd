library ieee;
use ieee.std_logic_1164.all;
entity cla_11bit is
        port (
                a    : in  std_logic_vector(10 downto 0);
                b    : in  std_logic_vector(10 downto 0);
                cin  : in  std_logic;
                sum  : out std_logic_vector(10 downto 0);
                cout : out std_logic
        );
end cla_11bit;
architecture cla_11bit_arch of cla_11bit is
        component full_adder is
                port
                (
                        a    : in  std_logic;
                        b    : in  std_logic;
                        cin  : in  std_logic;
                        s    : out std_logic;
                        cout : out std_logic
                );
        end component full_adder;
        signal g : std_logic_vector(10 downto 0);
        signal p : std_logic_vector(10 downto 0);
        signal c : std_logic_vector(11 downto 0);
begin

        G1 : for i in 0 to 10 generate
                        FA : full_adder port map(a(i), b(i), c(i), sum(i));
        end generate G1;

        -- generate bits:  G(i)=A(i)B(i)
        G2 : for i in 0 to 10 generate
                g(i) <= a(i) and b(i);
        end generate G2;

        -- propagate bits: P(i)=A(i)+B(i)
        G3 : for i in 0 to 10 generate
                p(i) <= a(i) or b(i);
        end generate G3;

        -- carry bits
        c(0) <= cin;
        G4 : for i in 0 to 10 generate
                c(i+1) <= g(i) or (p(i) and c(i));
        end generate G4;
        cout <= c(11);
end cla_11bit_arch;

