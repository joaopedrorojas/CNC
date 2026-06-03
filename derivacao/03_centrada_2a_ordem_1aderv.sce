/* Funcao centrada 2a ordem
 objetivo : aproximar a 1a derivada usando a formula centrada de 2a ordem.
 ENTRADAS:
    X : vetor dos valores dos nos
    Y : vetor com os valores das imagens
    k : indice do ponto onde sera calculada a derivada

SAIDA:
    apenas impressao de resultados e erros
 */
function Centrada_2a_Ordem_1a(X, Y, k, derivada_1a_exata, derivada_3a_exata)
    h1 = abs(X(k+1) - X(k))
    h2 = abs(X(k) - X(k-1))
    h = h1 + h2
    derivada_numerica = (Y(k+1) - Y(k-1)) / h
    
    printf("\n   Cálculo da derivada de 1a ordem em x = %g pela fórmula Centrada de 2a Ordem:\n", X(k))
    printf("   Aproximação: (f(xk+1) - f(xk-1)) / (h1 + h2)\n")
    printf("   Computando: (%f - %f) / %f\n", Y(k+1), Y(k-1), h)
    printf("   Resultado: %f\n", derivada_numerica)
    
    Imprimir_Erro(derivada_1a_exata, derivada_numerica)
    Erro_Truncamento_C21(h/2, derivada_3a_exata)
endfunction