/*
Objetivo:
    calcular os coeficiente da interpolacao polinomial de Newton
    usando o metod0 das diferencas dividias

Entradas:
    X : vetor com as abscissas dos pontos (x_1, x_2, ..., x_n)
    Y : vetor com os valores da funcao nos pontos (f(x_1), ..., f(x_n))

Saida:
    coef : vetor com os coeficientes da forma newton
    correspondentes aos termos sucessivos do polinomio

Observacao:
    O vetor Y é reutizado para contruir a tabela de diferencas divididas
    e retorna como o vetor coef com os termos da forma de newton
*/
function coef = dif_divididas(X, Y)
    n = length(X)
    coef = Y        //1a coluna da tabela de diferencas divididas
    //construcao da tabela (diferencas superiores)
    for j = 2:n
        for i = n:-1:j
            coef(i) = (coef(i) - coef(i-1)) / (X(i) - X(i-j+1))
        end
    end
endfunction