/*
Funcao : lagrange_2o_caso
objetivo : aproximar a 1a derivada usando o polinomio de lagrange (2o caso).

ENTRADAS:
   X : vetor dos valores dos nos
   Y : vetor com os valores das imagens
   k : indice do ponto onde sera calculada a derivada
   derivada_1a_exata : valor exato da 1a derivada (para erro percentual)

SAIDA:
   apenas impressao de resultados e erros
*/

function Lagrange_2o_Caso(X, Y, k, derivada_1a_exata)
    h1 = abs(X(k+1) - X(k))
    h2 = abs(X(k) - X(k-1))
    h = h1 + h2
    derivada_numerica = (Y(k+1) - Y(k-1)) / h
    
    printf("\n   Cálculo da derivada de 1a ordem em x = %g pelo Método de Lagrange - 2o caso (centrado):\n", X(k))
    printf("   Aproximação: (f(xk+1) - f(xk-1)) / h\n")
    printf("   Computando: (%f - %f) / %f\n", Y(k+1), Y(k-1), h)
    printf("   Resultado: %f\n", derivada_numerica)
    
    Imprimir_Erro(derivada_1a_exata, derivada_numerica)
endfunction