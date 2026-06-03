/*
Funcao : lagrange_3o_caso
objetivo : aproximar a 1a derivada usando o polinomio de lagrange (3o caso).

ENTRADAS:
   X : vetor dos valores dos nos
   Y : vetor com os valores das imagens
   k : indice do ponto onde sera calculada a derivada
   derivada_1a_exata : valor exato da 1a derivada (para erro percentual)

SAIDA:
   apenas impressao de resultados e erros
*/

function Lagrange_3o_Caso(X, Y, k, derivada_1a_exata)
    h1 = abs(X(k-2) - X(k-1))
    h2 = abs(X(k-1) - X(k))
    h = h1 + h2
    derivada_numerica = (3*Y(k) - 4*Y(k-1) + Y(k-2)) / h
    
    printf("\n   Cálculo da derivada de 1a ordem em x = %g pelo Método de Lagrange - 3o caso:\n", X(k))
    printf("   Aproximação: (3 * f(xk) - 4*f(xk-1) + f(xk - 2)) / h\n")
    printf("   Computando: (3 * %f - 4*%f + %f) / %f\n", Y(k), Y(k-1), Y(k - 2), h)
    printf("   Resultado: %f\n", derivada_numerica)
    
    Imprimir_Erro(derivada_1a_exata, derivada_numerica)
endfunction