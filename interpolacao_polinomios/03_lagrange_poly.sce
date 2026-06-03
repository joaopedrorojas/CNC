/*  entradas:
            X: vetor com as abscissas do nos de interpolacao (x_i)
            Y: vetor com os valorres da funcao no nos ( y_i = f(x_i))
    saidas:
            PolLagrange: polinomio interpolador completo ( objeto do tipo 'poly')
    observacoes:
            O polinomio interpolador obtido é p_n(x) = somatorio[L_i(x) * y_i], i = 0, ... , n-1
*/
function [PolLagrange, BaseLagrange] = lagrange_poly(X, Y)
    //inicializacoes
    n = length(X)
    x = poly(0, "x")
    PolLagrange = 0
    BaseLagrange = list()

    for i = 1:n
        Li = 1      //inicia o termo base L_i(x)
        for j = 1:n
            if j <> i then
                Li = Li * (x - X(j)) / (X(i) - X(j))    //produto para j<>i
            end
        end
        BaseLagrange(i) = Li
        PolLagrange = PolLagrange + Li * Y(i)
    end
endfunction