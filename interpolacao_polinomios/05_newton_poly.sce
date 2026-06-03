/*
Objetivo:
    Contruir o polinomio interpolador de newton a partir
    dos coeficientes obtidos por diferencas divididas

Entradas:
    X : vetor com as abscissas dos pontos ( x_ 1, x_2, ..., x_n)
    coef : vetor com os coeficientes das diferencas divididas, 
    na ordem correta (coef(1) = a_0, coef(2) = a_1, ...)

Saida:
    P : polinomio interpolador completo ( objeto do tipo 'poly')

Observacao:
    O polinomio é construido na forma de Newton:
        P(x) = a_0 + a_1(x - x_0) + a_2(x - x_0)(x - x_ 1) + ...
*/
function P = newton_poly(X, coef)
    //inicializacao
    n = length(X)
    x = poly(0, "x")    //varizavel simbolica
    P = coef(1)         //termo constante (a_0)
    termo = 1           //acumulador do produto (x - x_0)(x - x_1) ...

    for i = 2:n
        termo = termo * (x - X(i - 1))
        P = P + coef(i) * termo
    end
endfunction