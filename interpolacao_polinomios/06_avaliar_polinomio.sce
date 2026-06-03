function [valor_aprox, erro_percentual] = avaliar_polinomio(POL, ponto, valor_ref)

    valor_aprox = horner(POL, ponto)

    erro_percentual = %nan * ones(valor_aprox)
    
    if argn(2) == 3 & typeof(valor_ref) == "constant" then

        //caso 1: valor ref é escalar (um unico valor de referencia)
        //exemplo: comparar varias aproximacoes com um mesmo valor real
        //neste casp, a operacao vetorizada é aplicada diretamente
        // a todos os elementos de valor_aprox
        if size(valor_ref, "*") == 1 then

            //o erro percentual relativoo so é definido se o valor de referencia for != de 0
            if valor_ref <> 0 then
                erro_percentual = abs((valor_aprox - valor_ref) ./ valor_ref) * 100
            end

        //caso 2: valor_ref ;e vetor
        //exemplo: cada aproximacao possui seu proprio valor real
        else
            //cria uma mascara logica indicando as posicoes onde
            // valor_ref é diferente de zero evitando divisao por zero
            idx = (valor_ref <> 0)

            //calcula o erro percentual apenas nas posicoes validas,
            // preservando NaN onde valor_ref = 0
            erro_percentual(idx) = abs((valor_aprox(idx) - valor_ref(idx)) ./ valor_ref(idx)) * 100;
        end
    end
endfunction