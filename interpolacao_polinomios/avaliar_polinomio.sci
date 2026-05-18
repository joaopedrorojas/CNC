function [valor_aprox, erro_percentual] = avaliar_polinomio(POL, ponto, valor_ref)
    valor_aprox = horner(POL, ponto)
    
    if argn(2) == 3 && typeof(valor_ref) == "constant" then
        erro_percentual = abs((valor_aprox - valor_ref) ./ valor_ref) * 100
    else
        erro_percentual = %nan * ones(valor_aprox);
    end
endfunction