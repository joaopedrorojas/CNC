clear(); clf();

printf("\n");
printf("\t\t############################################################\n");
printf("\t\t#                                                          #\n");
printf("\t\t#                >>> INICIO DO PROGRAMA <<<                #\n");
printf("\t\t#                                                          #\n");
printf("\t\t############################################################\n\n\n");

/* entradas: 
     mat_vander: matriz dos coeficientes (vandermonde)
     vetor Y: vetor dos termos independentes
   saida:
     COEF: vetor solucao do sistema linear (coeficientes do polinomio interpolador)
*/

function [COEF] = Gauss(mat_vander, vetor_y)
     n = length(vetor_y);
     COEF = zeros(n, 1); //inicializa o vetor solucao
     U = mat_vander;     //copia a matriz para preservar a original
     b = vetor_y;        // copia o vetor independente

     //[0] diagnostico de condicionamento numerico
     cond_number = cond(U);
     if cond_number > 1e10 then
          warning("Matriz mal condicionada: cond(U) = " + msprintf("%.2e", cond_number) + ". Resultados podem ser imprecisos.");
     end

     //[1] etapa de eliminacao de gauss (triangularizacao)
for k = 1:n-1
     if abs(U(k, k)) < %eps then
          error("Pivo nulo ou muito pequeno encontrado na linha " + string(k) + ". O sistema pode ser singular ou mal condicionado.");
     end
     for i = k+1:n
          m = U(i, k) / U(k, k); // fator de eliminacao
          U(i, k) = 0; // elemento abaixo do pivô se torna zero
          for j = k+1:n
               U(i, j) = U(i, j) - m * U(k, j); // atualiza os elementos restantes da linha
          end
          b(i) = b(i) - m * b(k); // atualiza o termo independente
     end
end

// [2] etapa de substituicao retroativa
for k = n:-1:1
     soma = 0;
     for j = k+1:n
          soma = soma + COEF(j) * U(k, j); // soma dos termos já resolvidos
     end
     if abs(U(k, k)) < %eps then
          error("Divisão por zero ou número muito pequeno na substituição retroativa \n");
     end
     COEF(k) = (vetor_Y(k) - soma) / mat_vander(k, k)
end
endfunction