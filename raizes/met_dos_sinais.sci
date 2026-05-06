printf("\n\n** Isolamento de raízes pelo TVI **\n\n")

// define a função f(x)
deff('y = f(x)', 'y = 5 - 20*(exp(-0.2*x) - exp(-0.75*x))')

a = 0; // início do intervalo de busca
b = 10;  // fim do intervalo de busca
passo = 1; // tamanho do subintervalo

printf("Intervalos que podem conter raízes:\n")
for x = a:passo:(b-passo)
    fa = f(x);
    fb = f(x+passo);
    if fa * fb < 0 then
        printf("[%f, %f]\n", x, x+passo)
    end
end