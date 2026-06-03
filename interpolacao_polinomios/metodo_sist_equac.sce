clear(); clf();

printf("\n");
printf("\t\t############################################################\n");
printf("\t\t#                                                          #\n");
printf("\t\t#                >>> INICIO DO PROGRAMA <<<                #\n");
printf("\t\t#                                                          #\n");
printf("\t\t#          >>> Interpolacao por sist de equac <<<          #\n");
printf("\t\t#                                                          #\n");
printf("\t\t############################################################\n\n\n");

// Gauss                    // resolucao de sistema linear por elim. de gauss
// vander_matriz            // geracao da matriz de vandermonde
// avaliar_polinomio       // avaliacao do polinomio em um ponto
// plotar_interpolador      // geracao do grafico com pontos e polinomios

caminho = get_absolute_file_path("metodo_sist_equac.sce"); // caminho relativo para os arquivos de funcoes

//carregamento das funcoes modularizadas
exec(caminho + "01_gauss.sce", -1);
exec(caminho + "02_vander_matriz.sce", -1);
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
pontos = [0.5]
valores_ref = [%nan]

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