// Met. direto de solução de sistemas lineares usando fatoração LU
// O met. de fatoração LU é uma técnica numérica para resolver sistemas lineares, 
//onde a matriz A é decomposta em uma matriz triangular inferior (L) e uma matriz triangular superior
clear();
printf("\n********** Fatoracao LU **********\n");
printf(" Geracao de matrizes triangulares inferior e superior\n\n");
printf("*********Dados de entrada - Matriz A e Vetor B **********\n");

A = [3, 2, 4; 1, 1, 2; 4, 3, -2];
B = [1; 2; 3];
T = A;

printf("\n .....Entrada - Matriz A (original).....:");
disp(A);
printf("\n .....Entrada - Matriz B (original).....:");
disp(B);

printf("\n********** Fatoracao LU **********:\n");
n = length(B);
L = zeros(n, n);
U = zeros(n, n);

//A diagonal de U é unitaria por Crout
for j = 1:n
    U(j, j) = 1;
end

for j = 1:n
    for i = j:n
        SomaLU = 0;
        for k = 1:j-1
            SomaLU = SomaLU + L(i, k)*U(k, j);
        end
        L(i, j) = A(i, j) - SomaLU;
    end
    //verificar se o pivo é nulo
        if L(j, j) == 0 then
            error("\n Erro: surgiu pivô nulo durante a fatoração LU\n");
        end
    //calculo da linha j de U
    for i = j+1:n
        SomaLU = 0;
        for k = 1:j-1
            SomaLU = SomaLU + L(j, k)*U(k, i);
        end
        U(j, i) = (A(j, i) - SomaLU)/L(j, j);
    end
end

printf("\n .....Matriz L (triangular inferior).....:");
disp(L);
printf("\n .....Matriz U (triangular superior).....:");
disp(U);


printf("\n********** Substituicao progressiva **********:\n");
//resolucao de LY = B por substituicao progressiva
Y = zeros(n, 1);
if L(1, 1) == 0 then
    error("\n Erro: surgiu pivô nulo durante a substituição progressiva\n");
end
Y(1) = B(1)/L(1, 1);
for i = 2:n
    SomaLY = 0;
    for j = 1:i-1
        SomaLY = SomaLY + L(i, j)*Y(j);
    end
    if L(i, i) == 0 then
        error("\n Erro: surgiu pivô nulo durante a substituição progressiva\n");
    end
    Y(i) = (B(i) - SomaLY)/L(i, i);
end

printf("\n .....Vetor Y (solucao de LY=B).....:");
disp(Y);

printf("\n********** Substituicao retroativa **********:\n");
//resolucao de UX = Y por substituicao retroativa
X = zeros(n, 1);

X(n) = Y(n);

for i = (n-1:-1:1)
    SomaUX = 0;
    for j = i+1:n
        SomaUX = SomaUX + U(i, j)*X(j);
    end
    if U(i, i) == 0 then
        error("\n Erro: surgiu pivô nulo durante a substituição retroativa\n");
    end
    X(i) = Y(i) - SomaUX;
end

printf("\n .....Vetor X (solucao de UX=Y).....:\n");
mprintf(" %.6f\n", [X]);
printf("\n ------------Verificacao do resultado se AX = B------------\n\n");
//Verificacao do resultado se AX = B
for i = (1:n)
    s = 0;
    for j = (1:n)
        s = s + T(i, j)*X(j);
        if (j < n) then
            printf("(%f*%.3f) + ", T(i, j), X(j));
        end
        if (j == n) then
            printf("(%.3f*%.3f) = ", T(i, j), X(j));
            printf("%.3f\n", s);
        end
    end
end

printf("\n********** Fim da Decomposicao LU-Crout **********\n");
