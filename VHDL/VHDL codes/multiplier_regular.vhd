library ieee;
use ieee.std_logic_1164.all;
entity multiplier_regular is
        port (
                a   : in  std_logic_vector(7 downto 0);
                b   : in  std_logic_vector(7 downto 0);
                c   : out std_logic_vector(15 downto 0)
        );
end multiplier_regular;
architecture multiplier_regular_arch of multiplier_regular is
        component full_adder is
                port
                (
				a : in std_logic;
				b : in std_logic;
				cin : in std_logic;
				s : out std_logic;
				cout : out std_logic
                );
        end component;
        signal a1, b1 : std_logic_vector(15 downto 0);
        signal ppg0_temp, ppg1_temp, ppg2_temp, ppg3_temp, ppg4_temp, ppg5_temp, ppg6_temp, ppg7_temp, ppg8_temp, ppg9_temp, ppg10_temp, ppg11_temp, ppg12_temp, ppg13_temp, ppg14_temp, ppg15_temp : std_logic_vector(15 downto 0);
        signal ppg0 : std_logic_vector(31 downto 0);
        signal ppg1 : std_logic_vector(30 downto 0);
        signal ppg2 : std_logic_vector(29 downto 0);
        signal ppg3 : std_logic_vector(28 downto 0);
        signal ppg4 : std_logic_vector(27 downto 0);
        signal ppg5 : std_logic_vector(26 downto 0);
        signal ppg6 : std_logic_vector(25 downto 0);
        signal ppg7 : std_logic_vector(24 downto 0);
        signal ppg8 : std_logic_vector(23 downto 0);
        signal ppg9 : std_logic_vector(22 downto 0);
        signal ppg10 : std_logic_vector(21 downto 0);
        signal ppg11 : std_logic_vector(20 downto 0);
        signal ppg12 : std_logic_vector(19 downto 0);
        signal ppg13 : std_logic_vector(18 downto 0);
        signal ppg14 : std_logic_vector(17 downto 0);
        signal ppg15 : std_logic_vector(16 downto 0);
        signal ppg0_t : std_logic_vector(30 downto 0);
       	signal sum1 : std_logic_vector(30 downto 0);
       	signal sum1_temp : std_logic_vector(29 downto 0);
       	signal sum2 : std_logic_vector(29 downto 0);
       	signal sum2_temp : std_logic_vector(28 downto 0);
       	signal sum3 : std_logic_vector(28 downto 0);
       	signal sum3_temp : std_logic_vector(27 downto 0);
       	signal sum4 : std_logic_vector(27 downto 0);
       	signal sum4_temp : std_logic_vector(26 downto 0);
       	signal sum5 : std_logic_vector(26 downto 0);
       	signal sum5_temp : std_logic_vector(25 downto 0);
       	signal sum6 : std_logic_vector(25 downto 0);
       	signal sum6_temp : std_logic_vector(24 downto 0);
       	signal sum7 : std_logic_vector(24 downto 0);
       	signal sum7_temp : std_logic_vector(23 downto 0);
       	signal sum8 : std_logic_vector(23 downto 0);
       	signal sum8_temp : std_logic_vector(22 downto 0);
       	signal sum9 : std_logic_vector(22 downto 0);
       	signal sum9_temp : std_logic_vector(21 downto 0);
       	signal sum10 : std_logic_vector(21 downto 0);
       	signal sum10_temp : std_logic_vector(20 downto 0);
       	signal sum11 : std_logic_vector(20 downto 0);
       	signal sum11_temp : std_logic_vector(19 downto 0);
       	signal sum12 : std_logic_vector(19 downto 0);
       	signal sum12_temp : std_logic_vector(18 downto 0);
       	signal sum13 : std_logic_vector(18 downto 0);
       	signal sum13_temp : std_logic_vector(17 downto 0);
       	signal sum14 : std_logic_vector(17 downto 0);
       	signal sum14_temp : std_logic_vector(16 downto 0);
       	signal sum15 : std_logic_vector(16 downto 0);
       	signal c1 : std_logic_vector (31 downto 0);
       	signal c2 : std_logic_vector (30 downto 0);
       	signal c3 : std_logic_vector (29 downto 0);
       	signal c4 : std_logic_vector (28 downto 0);
       	signal c5 : std_logic_vector (27 downto 0);
       	signal c6 : std_logic_vector (26 downto 0);
       	signal c7 : std_logic_vector (25 downto 0);
       	signal c8 : std_logic_vector (24 downto 0);
       	signal c9 : std_logic_vector (23 downto 0);
       	signal c10 : std_logic_vector (22 downto 0);
       	signal c11 : std_logic_vector (21 downto 0);
       	signal c12 : std_logic_vector (20 downto 0);
       	signal c13 : std_logic_vector (19 downto 0);
       	signal c14 : std_logic_vector (18 downto 0);
       	signal c15 : std_logic_vector (17 downto 0);
       	signal product : std_logic_vector(15 downto 0);
begin
a1(7 downto 0) <= a;
a1(15 downto 8) <= (others => a(7));
b1(7 downto 0) <= b;
b1(15 downto 8) <= (others => b(7));
ppg0_temp <= a1 when b1(0) = '1' else (others => '0');
ppg1_temp <= a1 when b1(1) = '1' else (others => '0');
ppg2_temp <= a1 when b1(2) = '1' else (others => '0');
ppg3_temp <= a1 when b1(3) = '1' else (others => '0');
ppg4_temp <= a1 when b1(4) = '1' else (others => '0');
ppg5_temp <= a1 when b1(5) = '1' else (others => '0');
ppg6_temp <= a1 when b1(6) = '1' else (others => '0');
ppg7_temp <= a1 when b1(7) = '1' else (others => '0');
ppg8_temp <= a1 when b1(8) = '1' else (others => '0');
ppg9_temp <= a1 when b1(9) = '1' else (others => '0');
ppg10_temp <= a1 when b1(10) = '1' else (others => '0');
ppg11_temp <= a1 when b1(11) = '1' else (others => '0');
ppg12_temp <= a1 when b1(12) = '1' else (others => '0');
ppg13_temp <= a1 when b1(13) = '1' else (others => '0');
ppg14_temp <= a1 when b1(14) = '1' else (others => '0');
ppg15_temp <= a1 when b1(15) = '1' else (others => '0');
ppg0(15 downto 0) <= ppg0_temp;
ppg0(31 downto 16) <= (others => ppg0_temp(15));
ppg1(15 downto 0) <= ppg1_temp;
ppg1(30 downto 16) <= (others => ppg1_temp(15));
ppg2(15 downto 0) <= ppg2_temp;
ppg2(29 downto 16) <= (others => ppg2_temp(15));
ppg3(15 downto 0) <= ppg3_temp;
ppg3(28 downto 16) <= (others => ppg3_temp(15));
ppg4(15 downto 0) <= ppg4_temp;
ppg4(27 downto 16) <= (others => ppg4_temp(15));
ppg5(15 downto 0) <= ppg5_temp;
ppg5(26 downto 16) <= (others => ppg5_temp(15));
ppg6(15 downto 0) <= ppg6_temp;
ppg6(25 downto 16) <= (others => ppg6_temp(15));
ppg7(15 downto 0) <= ppg7_temp;
ppg7(24 downto 16) <= (others => ppg7_temp(15));
ppg8(15 downto 0) <= ppg8_temp;
ppg8(23 downto 16) <= (others => ppg8_temp(15));
ppg9(15 downto 0) <= ppg9_temp;
ppg9(22 downto 16) <= (others => ppg9_temp(15));
ppg10(15 downto 0) <= ppg10_temp;
ppg10(21 downto 16) <= (others => ppg10_temp(15));
ppg11(15 downto 0) <= ppg11_temp;
ppg11(20 downto 16) <= (others => ppg11_temp(15));
ppg12(15 downto 0) <= ppg12_temp;
ppg12(19 downto 16) <= (others => ppg12_temp(15));
ppg13(15 downto 0) <= ppg13_temp;
ppg13(18 downto 16) <= (others => ppg13_temp(15));
ppg14(15 downto 0) <= ppg14_temp;
ppg14(17 downto 16) <= (others => ppg14_temp(15));
ppg15(15 downto 0) <= ppg15_temp;
ppg15(16) <= ppg15_temp(15);
c1(0) <= '0';
c2(0) <= '0';
c3(0) <= '0';
c4(0) <= '0';
c5(0) <= '0';
c6(0) <= '0';
c7(0) <= '0';
c8(0) <= '0';
c9(0) <= '0';
c10(0) <= '0';
c11(0) <= '0';
c12(0) <= '0';
c13(0) <= '0';
c14(0) <= '0';
c15(0) <= '0';
ppg0_t <= ppg0(31 downto 1);
ADD1 : for i in 0 to 30 generate
	U1: full_adder port map (ppg0_t(i), ppg1(i), c1(i), sum1(i), c1(i+1));
end generate ADD1;
sum1_temp <= sum1(30 downto 1);
ADD2 : for i in 0 to 29 generate
	U2: full_adder port map (sum1_temp(i), ppg2(i), c2(i), sum2(i), c2(i+1));
end generate ADD2;
sum2_temp <= sum2(29 downto 1);
ADD3 : for i in 0 to 28 generate
	U3: full_adder port map (sum2_temp(i), ppg3(i), c3(i), sum3(i), c3(i+1));
end generate ADD3;
sum3_temp <= sum3(28 downto 1);
ADD4 : for i in 0 to 27 generate
	U4: full_adder port map (sum3_temp(i), ppg4(i), c4(i), sum4(i), c4(i+1));
end generate ADD4;
sum4_temp <= sum4(27 downto 1);
ADD5 : for i in 0 to 26 generate
	U5: full_adder port map (sum4_temp(i), ppg5(i), c5(i), sum5(i), c5(i+1));
end generate ADD5;
sum5_temp <= sum5(26 downto 1);
ADD6 : for i in 0 to 25 generate
	U6: full_adder port map (sum5_temp(i), ppg6(i), c6(i), sum6(i), c6(i+1));
end generate ADD6;
sum6_temp <= sum6(25 downto 1);
ADD7 : for i in 0 to 24 generate
	U7: full_adder port map (sum6_temp(i), ppg7(i), c7(i), sum7(i), c7(i+1));
end generate ADD7;
sum7_temp <= sum7(24 downto 1);
ADD8 : for i in 0 to 23 generate
	U8: full_adder port map (sum7_temp(i), ppg8(i), c8(i), sum8(i), c8(i+1));
end generate ADD8;
sum8_temp <= sum8(23 downto 1);
ADD9 : for i in 0 to 22 generate
	U9: full_adder port map (sum8_temp(i), ppg9(i), c9(i), sum9(i), c9(i+1));
end generate ADD9;
sum9_temp <= sum9(22 downto 1);
ADD10 : for i in 0 to 21 generate
	U10: full_adder port map (sum9_temp(i), ppg10(i), c10(i), sum10(i), c10(i+1));
end generate ADD10;
sum10_temp <= sum10(21 downto 1);
ADD11 : for i in 0 to 20 generate
	U11: full_adder port map (sum10_temp(i), ppg11(i), c11(i), sum11(i), c11(i+1));
end generate ADD11;
sum11_temp <= sum11(20 downto 1);
ADD12 : for i in 0 to 19 generate
	U12: full_adder port map (sum11_temp(i), ppg12(i), c12(i), sum12(i), c12(i+1));
end generate ADD12;
sum12_temp <= sum12(19 downto 1);
ADD13 : for i in 0 to 18 generate
	U13: full_adder port map (sum12_temp(i), ppg13(i), c13(i), sum13(i), c13(i+1));
end generate ADD13;
sum13_temp <= sum13(18 downto 1);
ADD14 : for i in 0 to 17 generate
	U14: full_adder port map (sum13_temp(i), ppg14(i), c14(i), sum14(i), c14(i+1));
end generate ADD14;
sum14_temp <= sum14(17 downto 1);
ADD15 : for i in 0 to 16 generate
	U15: full_adder port map (sum14_temp(i), ppg15(i), c15(i), sum15(i), c15(i+1));
end generate ADD15;
product <= sum15(0) & sum14(0) & sum13(0) & sum12(0) & sum11(0) & sum10(0) & sum9(0) & sum8(0) & sum7(0) & sum6(0) & sum5(0) & sum4(0) & sum3(0) & sum2(0) & sum1(0) & ppg0(0);
c <= product;
end multiplier_regular_arch;
