/*  Funcao : trapezio_dados.sce
    Descricao : Script para calcular a integral definida de uma funcao a partir de dados tabulados usando a regra do trapezio.

    --------------------------------------------------------------------------------------------------------------------------------

    Entradas:
    - X: vetor com os valores dos pontos tabulados (x_i)
    - Y: vetor com os valores das imagens nos pontos tabulados (f(x_i))
    Integral_exata: valor exato da integral, para calcular o erro percentual

    Saídas: apenas impressão dos resultados
*/

function Trapezio_Dados(X, Y, integral_exata)
    num_pontos = length(X)
    h = X(2) - X(1)

    printf("\n>> INTEGRAL DEFINIDA POR TRAPÉZIOS A PARTIR DE DADOS TABULADOS:\n")
    printf("\n   Intervalo de %g a %g com %d pontos igualmente espaçados\n", X(1), X(num_pontos), num_pontos)
    printf("   Fórmula: I ~ (h/2) * [f(x0) + 2*Σ f(xk) + f(xn)]\n")
    
    //------------------------------------------------------------------
    somatorio = sum(Y(2:num_pontos-1))
    integral_numerica = (h/2) * (Y(1) + 2*somatorio + Y(num_pontos))
    //------------------------------------------------------------------

    printf("   h = %f\n", h)
    printf("   Integral aproximada: %f\n", integral_numerica)
    
    erro_percentual = abs((integral_exata - integral_numerica) / integral_exata) * 100
    printf("   Erro relativo percentual: %.6f %%\n", erro_percentual)

    printf("\n********************************************************************\n")
endfunction