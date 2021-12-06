library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;


entity tb_bayer_sp is
end entity tb_bayer_sp;

architecture sim of tb_bayer_sp is
	signal Clk, Reset, X: STD_LOGIC := '0';
	signal S_0, S_1, S_2 : STD_LOGIC;

begin

DUT: entity work.bayer_sp(rtl)
	port map (Clk, Reset, X,
		S_0 => S_0,
		S_1 => S_1,
		S_2 => S_2);

Clk_gen: process
begin
	while Now < 100 ns loop
		Clk <= '0';
      wait for 5 ns;
      Clk <= '1';
      wait for 5 ns;
	end loop;
   wait;
end process Clk_gen;

	Stim: process
	begin
		Reset <= '1';
		X <= '0';
		wait until falling_edge(Clk);
		
		Reset <= '0';
		X <= '0';
		wait until falling_edge(Clk);
		
		X <= '1';
		wait until rising_edge(Clk);
		
		X <= '0';
		wait until falling_edge(Clk);
		
		X <= '1';
		wait until rising_edge(Clk);
		
		X <= '0';
		wait until falling_edge(Clk);
		
		X <= '1';
		wait until rising_edge(Clk);

		X <= '0';
		wait until falling_edge(Clk);

		X <= '1';
		wait until rising_edge(Clk);

		X <= '0';
		wait until falling_edge(Clk);

		X <= '1';
		wait until rising_edge(Clk);

		X <= '0';
		wait until falling_edge(Clk);

		X <= '1';
		wait until rising_edge(Clk);

		X <= '0';
		wait until falling_edge(Clk);

		X <= '1';
		wait until rising_edge(Clk);

		X <= '0';
		wait until falling_edge(Clk);

		X <= '1';
		wait until rising_edge(Clk);
		wait;
	end process Stim;
end architecture;