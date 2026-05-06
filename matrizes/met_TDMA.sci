clear();

printf("*** MÉTODO DIRETO: THOMAS (TDMA) - SISTEMAS TRIDIAGONAIS ***\n");

a = [0; -1; -1; -1; -1]; //diagonal superior
b = [2; 2; 2; 2; 2];  //diagonal principal
c = [-1; -1; -1; -1; 0];  //diagonal inferior
d = [100; 0; 0; 0; 200];  //termos independente

ta = a;
tb = b;
tc = c;
td = d;


printf("\n Vetor a:\n");
for i = 1 : length(a)
    mprintf("%10.6f\n", a(i));
end

printf("\n Vetor b:\n");
for i = 1 : length(b)
    mprintf("%10.6f\n", b(i));
end

printf("\n Vetor c:\n");
for i = 1 : length(c)
    mprintf("%10.6f\n", c(i));
end

printf("\n Vetor d:\n");
for i = 1 : length(d)
    mprintf("%10.6f\n", d(i));
end

printf("\n**********************TRIANGULARIZACAO***************************\n");

n = length(b)
if b(1) == 0 then
    error("Pivô nulo encontrado na primeira linha. Método falha.");
end

c(1) = c(1) / b(1);
d(1) = d(1) / b(1);

for i = 2:n-1
    temp = b(i) - a(i) * c(i-1);
    if temp == 0 then
        error("Pivô nulo encontrado durante a triangulariacao");
    end
    c(i) = c(i) / temp;
    d(i) = (d(i) - a(i) * d(i-1)) / temp;
end

temp = b(n) - a(n) * c(n-1);

if temp == 0 then
    error("Pivô nulo encontrado na última linha. Método falha.");
end
d(n) = (d(n) - a(n) * d(n-1)) / temp;

printf("\n saida - vetor c modificado:\n");
for i = 1 : n
    mprintf("%10.6f\n", c(i));
end

printf("\n saida - vetor d modificado:\n");
for i = 1 : n
    mprintf("%10.6f\n", d(i));
end


printf("\n**********************RETROSUBSTITUICAO***************************\n");
//algoritmo de retrosubstituição
X = zeros(n,1);
X(n) = d(n);
for i = (n-1:-1:1)
    X(i) = d(i) - c(i) * X(i+1);
end

printf("\n Solução X do sistema:\n");
mprintf("  %.6f\n", X);

printf("\n ****************Verificação da solução se TX = d:***********\n\n");

for i = 1:n
    s = 0;
    if i > 1 then
        s = s + ta(i) * X(i-1);
        printf("  %.3f * %.3f +", ta(i), X(i-1));
    end

    s = s + tb(i) * X(i);
    if i < n then
        printf("(%.3f * %.3f) +", tb(i), X(i));
        s = s + tc(i) * X(i+1);
        printf("(%.3f * %.3f) =", tc(i), X(i+1));
    else
        printf("(%.3f * %.3f) =", tb(i), X(i));
    end
    printf(" %.3f\n", s);
end

printf("\n ********** TDMA FINALIZADO **********\n");
