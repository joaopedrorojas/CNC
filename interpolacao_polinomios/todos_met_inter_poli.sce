clear(); clf();

caminho = get_absolute_file_path("todos_met_inter_poli.sce"); // caminho relativo para os arquivos de funcoes

//carregamento das funcoes modularizadas
exec(caminho + "01_gauss.sce", -1);
exec(caminho + "02_vander_matriz.sce", -1);
exec(caminho + "03_lagrange_poly.sce", -1);
exec(caminho + "04_dif_divididas.sce", -1);
exec(caminho + "05_newton_poly.sce", -1);
exec(caminho + "06_avaliar_polinomio.sce", -1);
exec(caminho + "07_plotar_interpolador.sce", -1);


printf("\n");
printf("************************************************************\n");
printf("*                >>> INICIO DO PROGRAMA <<<                *\n");
printf("*            >>> Interpolacao por Lagrange <<<             *\n");
printf("************************************************************\n\n");


// [1] entrada de dados

X_global = [1, 2, 4, 8]
Y_global = [200, 110, 65, 40]
//para busca
pontos_globais = [3, 6]

X = X_global
Y = Y_global

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
pontos = pontos_globais
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

printf("\n\n================================================================================================\n\n");

printf("************************************************************\n");
printf("*                >>> INICIO DO PROGRAMA <<<                *\n");
printf("*             >>> Interpolacao por Newton <<<              *\n");
printf("************************************************************\n\n");

X = X_global
Y = Y_global

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

pontos = pontos_globais
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

printf("\n\n================================================================================================\n\n");

printf("************************************************************\n");
printf("*                >>> INICIO DO PROGRAMA <<<                *\n");
printf("*       >>> Interpolacao por Sist. de Equações <<<         *\n");
printf("************************************************************\n\n");

X = X_global
Y = Y_global

n = length(X)

printf("\n[1] TABELA DE DADOS:\n")
for i = 1:n
	printf("   x = %.6f; f(x) = %.6f\n", X(i), Y(i))
end

// [2] montagem da matriz de Vandermonde
Vander = vander_matriz(X)

printf("\n[2] MATRIZ DE VANDERMONDE:")
disp(Vander)

// [3] resolucao do sistema linear via gauss
COEF = Gauss(Vander, Y)
printf("\n[3] COEFICIENTES DO POLINÔMIO:\n")

for i = 1:n
	mprintf("   a%d = %.6f\n", i-1, COEF(i))
end

// [4] Construcao do polinomio interpolador
Pol = poly(COEF, 'x', 'c')

printf("\n[4] POLINÔMIO INTERPOLADOR DE VANDERMONDE: \n")
disp(Pol)

// [5] avaliacao do polinomio em um ponto especifico
// definicao dos pontos e valores reais (podem ser vetores ou escalares)
pontos = pontos_globais
valores_ref = [%nan, %nan]

for i = 1:length(pontos)
    ponto_i = pontos(i)
    valor_ref_i = valores_ref(i)

    if isnan(valor_ref_i) then
        [valor_aprox, erro_percentual] = avaliar_polinomio(Pol, ponto_i)
        printf("\n[5.%d] Valor aproximado: p_n(%.2f) = %.6f\n", i, ponto_i, valor_aprox)
        printf("[5.%d] Erro percentual: valor de referencia não disponível\n", i)
    else
        [valor_aprox, erro_percentual] = avaliar_polinomio(Pol, ponto_i, valor_ref_i)
        printf("\n[5.%d] Valor aproximado: p_n(%.2f) = %.6f\n", i, ponto_i, valor_aprox)
        printf("[5.%d] Erro percentual: %.4f%%\n", i, erro_percentual)
    end
end

//[6] grafico do polinomio interpolador e dos pontos de dados
plotar_interpolador(X, Y, COEF, pontos)

printf("\n***** FIM DE INTERPOLAÇÃO POR SISTEMA DE EQUAÇÕES *****\n")