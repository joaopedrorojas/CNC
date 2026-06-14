/*  Funcao : Simpson_3_8_Dados
    Objetivo: calcular a integral de uma função usando a regra de Simpson 3/8,
              a partir de um conjunto de pontos tabulados (X, Y) e comparar com o valor exato da integral.

    --------------------------------------------------------------------------------------------------------------------------------

    Entradas:
    - X: vetor com os valores dos pontos tabulados (x_i)
    - Y: vetor com os valores das imagens nos pontos tabulados (f(x_i))
    Integral_exata: valor exato da integral, para calcular o erro percentual

    Saídas: apenas impressão dos resultados
*/

function Simpson_3_8_Dados(X, Y, integral_exata)
    num_pontos = length(X)
    h = X(2) - X(1)

    printf("\n>> INTEGRAL DEFINIDA POR SIMPSON 3/8 A PARTIR DE DADOS TABULADOS:\n")
    printf("\n   Intervalo de %g a %g com %d pontos igualmente espaçados\n", X(1), X(num_pontos), num_pontos)
    printf("   Fórmula: I ~ (3h/8) * [f(x0) + 3*Σ grupo1 + 2*Σ grupo2 + f(xn)]\n")
    
    //------------------------------------------------------------------
    somatorio1 = 0
    somatorio2 = 0

    // Grupo 1: 
    for i = 2:3:num_pontos-1
        somatorio1 = somatorio1 + Y(i) + Y(i+1)
    end

    // Grupo 2:
    for i = 4:3:num_pontos-1
        somatorio2 = somatorio2 + Y(i)
    end
    
    integral_numerica = (3*h/8) * (Y(1) + 3*somatorio1 + 2*somatorio2 + Y(num_pontos))
    printf("   h = %f\n", h)
    printf("   Integral aproximada: %f\n", integral_numerica)

    erro_percentual = abs((integral_exata - integral_numerica) / integral_exata) * 100
    printf("   Erro relativo percentual: %.6f %%\n", erro_percentual)
    
    printf("\n********************************************************************\n")
endfunction