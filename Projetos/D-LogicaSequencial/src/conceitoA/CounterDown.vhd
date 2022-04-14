-- Elementos de Sistemas
-- CounterDown.vhd

library ieee;
use ieee.std_logic_1164.all;

entity CounterDown is
	port(
		clock:  in std_logic;
		q:      out std_logic_vector(2 downto 0) :=(others => '0')
	);
end entity;

architecture arch of CounterDown is
Component FLipFLopT is
		port(
		clock:  in std_logic;
		t:      in std_logic;
		q: out std_logic := '0';
		notq:   out std_logic := '1'
	);
	end Component;
	signal t,qout1, qout2,qout3: std_logic;

begin
	t <= '1';
	t1 : FLipFLopT port map(
	t => t,
	clock => clock,
	q => qout1
	);
	t2 : FLipFLopT port map(
	t => t,
	clock => qout1,
	q => qout2
	);
	t3 : FLipFLopT port map(
	t => t,
	clock => qout2,
	q => qout3
	);

	q(0) <= qout1;
	q(1) <= qout2;
	q(2) <= qout3;

end architecture;
