-- Version: 1.1
-- Date: --/11/2024
-- Owners: Gabriel D. Maruschi
--			  Vitor Alexandre Garcia Vaz

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_arith.ALL;
USE ieee.std_logic_unsigned.ALL;

ENTITY DE10_LITE_RegFile IS
    PORT (
        SW : IN STD_LOGIC_VECTOR(9 DOWNTO 0);
        KEY : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
        LEDR : OUT STD_LOGIC_VECTOR(9 DOWNTO 0)
    );
END DE10_LITE_RegFile;


ARCHITECTURE estrutural OF DE10_LITE_RegFile IS

BEGIN
    RegBank: entity work.regbank

        GENERIC MAP (
            M => 8,
            X => 4
        )

        PORT MAP (
            CLK => KEY(0),
            EN => KEY(1),
            WE3 => SW(2),
            WD3 => SW(9 DOWNTO 6),
            A1 => SW(2 DOWNTO 0),
            A2 => SW(5 DOWNTO 3),
            A3 => SW(8 DOWNTO 6),
            RD1 => LEDR(3 DOWNTO 0),
            RD2 => LEDR(7 DOWNTO 4)
        );

END estrutural;