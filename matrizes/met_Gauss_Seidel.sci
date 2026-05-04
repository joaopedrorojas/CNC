clear();

printf("\n*** MÉTODO ITERATIVO: GAUSS-SEIDEL ***\n")

printf("Resolucao iterativa do sistema linear A*X = B usando o método de Gauss-Seidel.\n")

/*
A = [4.0, 2.0, -0.3, 0.8;
     0.6, 3.2, -1.8, 0.4;
     0.1, 0.2, 1.0, 0.3;
     0.3, -0.8, -0.3, -0.9];
B = [4.4; 10.0; 4.0; 7.5];
*/

A = [0.1, 0.2, 1.0, 0.3;
     0.3, -0.8, -0.3, -0.9;
     4.0, 2.0, -0.3, 0.8;
     0.6, 3.2, -1.8, 0.4];
B = [4.0; 7.5; 4.4; 10.0];



printf("**********Dados de entrada Matriz A e Vetor B:***********\n");
printf("\n Matriz A(original):\n");
disp(A);
printf("\n Vetor B(original):\n");
disp(B);

n = length(B);
Nmax = 100
epsilon = 1.0e-6
X0 = [0; 0; 0; 0];
X = X0
T = A;

//Verificação de pivos na diagonal principal
for i = 1:n
    if T(i,i) == 0 then
        error("Pivô nulo encontrado na diagonal principal. Método falha.\n\n");
    end
end

printf("\n*********Processo Iterativo ************\n");
convergiu = %f;

for k = 1:Nmax
    X = X0;
    for i = 1:n
        S1 = 0;
        for j = 1:i-1
            S1 = S1 + A(i,j) * X(j);
        end
        S2 = 0;
        for j = i+1:n
            S2 = S2 + A(i,j) * X0(j);
        end
        X(i) = (B(i) - S1 - S2) / A(i,i);
    end
    erro = max(abs(X - X0));
    if erro < epsilon then
        convergiu = %t;
        break;
    end
    X0 = X;
end


printf("\n Número de iterações: %d\n", k);
printf( "\n Erro final: %.6e\n", erro);
if convergiu then
    printf("\n O método convergiu para a solução aproximada.\n");
else
    printf("\n O método não convergiu dentro do número máximo de iterações.\n");
end

printf("\n Vetor solução aproximada:\n");
mprintf(" %.6f\n", X);

printf("\n Verificação dos resultados (A*X = B):\n");
for i = 1:n
    s = 0
    for j = 1:n
        s = s + T(i,j) * X(j)
        if j < n then
            printf(" (%.3f*%.3f) +", T(i,j), X(j))
        end
        if j == n then
            printf(" (%.3f*%.3f) = ", T(i,j), X(j))
            printf("%.3f\n", s)
        end
    end
end

printf("\n***** ENCERRAMENTO DO GAUSS-SEIDEL *****\n")
