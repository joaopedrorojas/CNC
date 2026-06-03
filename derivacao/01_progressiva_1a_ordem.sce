/* Funcao progressiva 1a ordem
 objetivo : aproximar a 1a derivada usando a formula da diferencas finitas
            progressiva de 1a orde
 ENTRADAS:
    X : vetor dos valores dos nos
    Y : vetor com os valores das imagens
    k : indice do ponto onde sera calculada a derivada

SAIDA:
    apenas impressao de resultados e erros
 */
function Progressiva_1a_Ordem(X, Y, k, derivada_1a_exata, derivada_2a_exata)
    h = abs(X(k+1) - X(k))
    derivada_numerica = (Y(k+1) - Y(k)) / h
    
    printf("\n   Cálculo da derivada de 1a ordem em x = %g pela fórmula Progressiva de 1a Ordem:\n", X(k))
    printf("   Aproximação: (f(xk+1) - f(xk)) / h\n")
    printf("   Computando: (%f - %f) / %f\n", Y(k+1), Y(k), h)
    printf("   Resultado: %f\n", derivada_numerica)
    
    Imprimir_Erro(derivada_1a_exata, derivada_numerica)
    Erro_Truncamento_P(h, derivada_2a_exata)
endfunction