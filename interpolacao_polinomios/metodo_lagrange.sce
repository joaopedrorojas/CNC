clear(); clf();

printf("\n");
printf("\t\t############################################################\n");
printf("\t\t#                                                          #\n");
printf("\t\t#                >>> INICIO DO PROGRAMA <<<                #\n");
printf("\t\t#                                                          #\n");
printf("\t\t#            >>> Interpolacao por Lagrange <<<             #\n");
printf("\t\t#                                                          #\n");
printf("\t\t############################################################\n\n\n");

caminho = get_absolute_file_path("metodo_lagrange.sce"); // caminho relativo para os arquivos de funcoes

//carregamento das funcoes modularizadas

exec(caminho + "03_lagrange_poly.sce", -1);
exec(caminho + "06_avaliar_polinomio.sce", -1);
exec(caminho + "07_plotar_interpolador.sce", -1);

// [1] entrada de dados

X = [100, 200, 400, 800]
Y = [30.5, 45.0, 70.2, 120.0]

n = length(X)

printf("\n[1] TABELA DE DADOS:\n")
for i = 1:n
	printf("   x = %.6f; f(x) = %.6f\n", X(i), Y(i))
end

// [2] calculo do polinomio de lagrange
[PolLagrange, BaseLagrange] = lagrange_poly(X, Y)

printf("\n[2] POLINÔMIOS DE BASE DE LAGRANGE:\n")
for i = 1:n
    pol_str = pol2str(BaseLagrange(i))
    printf("   L_%d(x) = %s\n", i-1, pol_str)
end

// [3] exibicao do polinomio interpolador
pontos = [300, 600]
valores_ref = [%nan, %nan]

printf("\n[3] POLINÔMIO INTERPOLADOR POR LAGRANGE:")
disp(PolLagrange)

// [4] avaliacao do polinomio em pontos especificos
for i = 1:length(pontos)
    ponto_i = pontos(i)
    valor_ref_i = valores_ref(i)

    if isnan(valor_ref_i) then
        [valor_aprox, erro_percentual] = avaliar_polinomio(PolLagrange, ponto_i)
        printf("\n[4.%d] VALOR APROXIMADO: p(%.2f) = %.6f\n", i, ponto_i, valor_aprox)
        printf("\n[4.%d] ERRO PERCENTUAL: Valor de referência não disponível\n", i)
    else
        [valor_aprox, erro_percentual] = avaliar_polinomio(PolLagrange, ponto_i, valor_ref_i)
        printf("\n[5.%d] VALOR APROXIMADO: p(%.2f) = %.6f\n", i, ponto_i, valor_aprox)
        printf("\n[5.%d] ERRO PERCENTUAL: %.4f%%\n", i, erro_percentual)
    end
end

plotar_interpolador(X, Y, PolLagrange, pontos)

printf("\n******** FIM DE INTERPOLAÇÃO POR LAGRANGE ********\n")