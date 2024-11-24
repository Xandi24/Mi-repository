-- Version: 1.1
-- Date: --/11/2024
-- Owners: Gabriel D. Maruschi
--			  Vitor Alexandre Garcia Vaz

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_arith.ALL;
USE ieee.std_logic_unsigned.ALL;

ENTITY mux81 is
    GENERIC (
        n   : integer :=4 -- número de bits das entradas e da saída
    );

    PORT (
        INPUT0  : IN STD_LOGIC_VECTOR (n-1 downto 0);
        INPUT1  : IN STD_LOGIC_VECTOR (n-1 downto 0);
        INPUT2  : IN STD_LOGIC_VECTOR (n-1 downto 0);
        INPUT3  : IN STD_LOGIC_VECTOR (n-1 downto 0);
        INPUT4  : IN STD_LOGIC_VECTOR (n-1 downto 0);
        INPUT5  : IN STD_LOGIC_VECTOR (n-1 downto 0);
        INPUT6  : IN STD_LOGIC_VECTOR (n-1 downto 0);
        INPUT7  : IN STD_LOGIC_VECTOR (n-1 downto 0);
        S       : IN STD_LOGIC_VECTOR (2 downto 0);
        R       : OUT STD_LOGIC_VECTOR (n-1 downto 0)
    );
end mux81;


ARCHITECTURE mux81_module OF mux81 IS

    signal aux  : STD_LOGIC_VECTOR (n-1 downto 0);

BEGIN

	with S select
	aux <= 	INPUT0 when "000",
            INPUT1 when "001",
            INPUT2 when "010",
            INPUT3 when "011",
            INPUT4 when "100",
            INPUT5 when "101",
            INPUT6 when "110",
            INPUT7 when "111";
            
    R <= aux;

END mux81_module;