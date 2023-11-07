--------------------------------------------------------------------------------
-- RELOGIO DE XADREZ
-- Author - Fernando Moraes - 25/out/2023
-- Revision - Iaçanã Ianiski Weber - 30/out/2023
--------------------------------------------------------------------------------
library IEEE;
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
library work;

entity relogio_xadrez is
    port( 
        -- COMPLETAR DE ACORDO COM A ESPECIFICACAO
        clk             :   in std_logic;    -- Entrada do Clock
        rst             :   in std_logic;    -- Entrada Reset
        btn_start_p1    :   in std_logic; -- Botão do P1 para contar o tempo do P2
        btn_start_p2    :   in std_logic; -- Botão do P2 para contar o tempo do P2
        
        player1_time    :   out std_logic_vector(7 downto 0); -- Saída do tempo do jogador 1
        player2_time    :   out std_logic_vector(7 downto 0); -- Saída do tempo do jogador 2

        game_over       :   out std_logic -- Saída para indicar o fim do jogo
    );
end relogio_xadrez;

architecture relogio_xadrez of relogio_xadrez is
    -- DECLARACAO DOS ESTADOS
    type states is (p1_turn, p2_turn, go);
    -- ADICIONE AQUI OS SINAIS INTERNOS NECESSARIOS
    signal EA, PE : states;
    signal player1_count    :   std_logic_vector(7 downto 0)    :=  "00000000";
    signal player2_count    :   std_logic_vector(7 downto0)     :=  "00000000";
    signal go_flag          :   std_logic   :=  '0';

    signal btn_start_p1_r   :   std_logic   :=  '0';
    signal btn_start_p2_r   :   std_logic   :=  '0'; 
    
begin

    -- INSTANCIACAO DOS CONTADORES
    contador1 : entity work.temporizador port map (
        clk => clk,
        rst => rst,
        count => player1_count
    );

    contador2 : entity work.temporizador port map (
        clk => clk.
        rst => rst,
        count => player2_count
    );

    -- PROCESSO DE TROCA DE ESTADOS
    process (clk, rst)
    begin
        -- COMPLETAR COM O PROCESSO DE TROCA DE ESTAD
        if rst = '1' then
            EA <= p1_turn;
            PE <= p1_turn;
            go_flag <= '0';
        elsif rising_edge(clk) then
            if go_flag = '0' then
                -- Adicione a lógica para a troca de estados aqui! (COMMENT GPT)
                case EA is
                    when p1_turn =>
                        if btn_start_p2_r = '1' then
                            PE <= p2_turn;
                            btn_start_p1_r <=   '0'; -- Reseta botão do P1
                        elsif
                            -- CONTA TEMPO PLAYER 1
                        end if;
                    when p2_turn =>
                        if btn_start_p1_r = '1' then
                            PE <= p1_turn;
                            btn_start_p2_r <= '0'; -- Reseta botão do P2
                        elsif
                            -- CONTA TEMPO PLAYER 2
                    when others =>
                        -- Não faz nada para o estado de go (game over) (COMMENT GPT)
                end case;
            end if;
        end if;
    end process;

    -- PROCESSO PARA DEFINIR O PROXIMO ESTADO
    process (EA, PE, btn_start_p1, btn_start_p2) --<<< Nao esqueca de adicionar os sinais da lista de sensitividade
    begin
        if go_flag = '0' then
            case EA is
                --COMPLETAR O CASE PARA CADA UM DOS ESTADOS DA SUA MAQUINA
                when p1_turn =>
                    if btn_start_p1 = '1' then
                        PE <= p2_turn;
                        btn_start_p1_r <= '1';
                    elsif
                        -- CONTA TEMPO PLAYER 1
                    end if;
                when p2_turn =>
                    if btn_start_p2 = '1' then
                        PE <= p1_turn;
                        btn_start_p2_r <= '1';
                    elsif
                        -- CONTA TEMPO PLAYER 2
                    end if;
                -- Adiciona um when para ver quem ganhou se o tempo chegou em 0? (p/ sLukas)
                when others
                    -- Nao faz nada para o estado de go (game over)
            end case;
        end if;
    end process;



    -- Lógica para verificar se o tempo de um dos jogadores acabou para indicar o fim do jogo

    process
    begin
        if player1_count = "00000000" or player2_count = "00000000" then
            go_flag <= '1';
        end if;
    end process;

    
    -- ATRIBUICAO COMBINACIONAL DOS SINAIS INTERNOS E SAIDAS - Dica: faca uma maquina de Moore, desta forma os sinais dependem apenas do estado atual!!

    process
    begin
        player1_time <= player1_count;
        player2_time <= player2_count;
        go <= go_flag;
    end process;
    

end relogio_xadrez;


