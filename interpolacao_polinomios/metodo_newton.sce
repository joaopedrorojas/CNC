clear(); clf();

printf("\n");
printf("\t\t############################################################\n");
printf("\t\t#                                                          #\n");
printf("\t\t#                >>> INICIO DO PROGRAMA <<<                #\n");
printf("\t\t#                                                          #\n");
printf("\t\t#              >>> Interpolacao por Newton <<<             #\n");
printf("\t\t#                                                          #\n");
printf("\t\t############################################################\n\n\n");

caminho = get_absolute_file_path("metodo_newton.sce"); // caminho relativo para os arquivos de funcoes

//carregamento das funcoes modularizadas

exec(caminho + "05_newton_poly.sce", -1);
exec(caminho + "04_dif_divididas.sce", -1);
exec(caminho + "06_avaliar_polinomio.sce", -1);
exec(caminho + "07_plotar_interpolador.sce", -1);

// [1] entrada de dados

X = [-1, 0, 2]
Y = [4, 1, -1]

n = length(X)

printf("\n[1] TABELA DE DADOS:\n")
for i = 1:n
	printf("   x = %.6f; f(x) = %.6f\n", X(i), Y(i))
end

// [2] calculo dos coeficientes via diferencas divididas
coef = dif_divididas(X, Y)
printf("\n[2] COEFICIENTES DAS DIFERENÇAS DIVIDIDAS:\n")
disp(coef);

// [3] construcao do polinomio de newton
PolNewton = newton_poly(X, coef)
printf("\n[3] CONSTRUÇÃO DO POLINÔMIO DE NEWTON:\n")
disp(PolNewton)

pontos = [-0.5, 0.5]
valores_ref = [%nan, %nan]

// [4] avaliacao do polinomio em pontos especificos
for i = 1:length(pontos)
    ponto_i = pontos(i)
    valor_ref_i = valores_ref(i)

    if isnan(valor_ref_i) then
        [valor_aprox, erro_percentual] = avaliar_polinomio(PolNewton, ponto_i)
        printf("\n[4.%d] VALOR APROXIMADO: p(%.2f) = %.6f\n", i, ponto_i, valor_aprox)
        printf("\n[4.%d] ERRO PERCENTUAL: Valor de referência não disponível\n", i)
    else
        [valor_aprox, erro_percentual] = avaliar_polinomio(PolNewton, ponto_i, valor_ref_i)
        printf("\n[5.%d] VALOR APROXIMADO: p(%.2f) = %.6f\n", i, ponto_i, valor_aprox)
        printf("\n[5.%d] ERRO PERCENTUAL: %.4f%%\n", i, erro_percentual)
    end
end

// [5] grafico do polinomio interpolador
plotar_interpolador(X, Y, PolNewton, pontos)

printf("\n******** FIM DE INTERPOLAÇÃO POR NEWTON ********\n")