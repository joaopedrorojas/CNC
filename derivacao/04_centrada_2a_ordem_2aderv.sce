/* Funcao centrada 2a ordem
 objetivo : aproximar a 2a derivada usando a formula centrada de 2a ordem.
 ENTRADAS:
    X : vetor dos valores dos nos
    Y : vetor com os valores das imagens
    k : indice do ponto onde sera calculada a derivada
    derivada_2a_exata : valor exato da 2a derivada (para erro percentual)
    derivada_4a_exata : valor exato da 4a derivada (para erro de truncamento)
SAIDA:
    apenas impressao de resultados e erros
 */
function Centrada_2a_Ordem_2a(X, Y, k, derivada_2a_exata, derivada_4a_exata)
    h1 = abs(X(k+1) - X(k))
    h2 = abs(X(k) - X(k-1))
    h_prod = h1 * h2
    derivada_numerica = (Y(k+1) - 2*Y(k) + Y(k-1)) / h_prod
    
    printf("\n   Cálculo da derivada de 2a ordem em x = %g pela fórmula Centrada de 2a Ordem:\n", X(k))
    printf("   Aproximação: (f(xk+1) - 2*f(xk) + f(xk-1)) / (h1 * h2)\n")
    printf("   Computando: (%f - 2*%f + %f) / %f\n", Y(k+1), Y(k), Y(k-1), h_prod)
    printf("   Resultado: %f\n", derivada_numerica)
    
    Imprimir_Erro(derivada_2a_exata, derivada_numerica)
    Erro_Truncamento_C22(h_prod, derivada_4a_exata)
endfunction