/*  Funcao : Simpson_1_3_Dados
    Objetivo: calcular a integral de uma função usando a regra de Simpson 1/3,
              a partir de um conjunto de pontos tabulados (X, Y) e comparar com o valor exato da integral.

    --------------------------------------------------------------------------------------------------------------------------------

    Entradas:
    - X: vetor com os valores dos pontos tabulados (x_i)
    - Y: vetor com os valores das imagens nos pontos tabulados (f(x_i))
    Integral_exata: valor exato da integral, para calcular o erro percentual

    Saídas: apenas impressão dos resultados
*/

function Simpson_1_3_Dados(X, Y, integral_exata)
    num_pontos = length(X)
    h = X(2) - X(1)

    printf("\n>> INTEGRAL DEFINIDA POR SIMPSON 1/3 A PARTIR DE DADOS TABULADOS:\n")
    printf("\n   Intervalo de %g a %g com %d pontos igualmente espaçados\n", X(1), X(num_pontos), num_pontos)
    printf("   Fórmula: I ~ (h/3) * [f(x0) + 4*Σ impares + 2*Σ pares + f(xn)]\n")
    
    //------------------------------------------------------------------
    somatorio_pares = sum(Y(3:2:num_pontos-1))
    somatorio_impares = sum(Y(2:2:num_pontos-1))
    //------------------------------------------------------------------

    integral_numerica = (h/3) * (Y(1) + 4*somatorio_impares + 2*somatorio_pares + Y(num_pontos))

    printf("   h = %f\n", h)
    printf("   Integral aproximada: %f\n", integral_numerica)
    
    erro_percentual = abs((integral_exata - integral_numerica) / integral_exata) * 100
    printf("   Erro relativo percentual: %.6f %%\n", erro_percentual)
    
    printf("\n********************************************************************\n")
endfunction