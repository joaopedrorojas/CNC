printf("\n***** AJUSTE POLINOMIAL - MQM - MINIMOS QUADRADOS *****\n")

caminho = get_absolute_file_path("08_ajuste_polinomial_MQM.sce");
exec(caminho + "plotar_ajuste_polinomial.sce", -1);

// [1] entrada dos dados
// Opção 1: Ler dados de arquivo CSV 

/*
arquivo_csv = caminho + "teste.csv";  // Caminho do arquivo CSV na mesma pasta do script
dados = csvRead(arquivo_csv);

// Validação: verificar se o arquivo tem exatamente 2 colunas
if size(dados, 2) == 2 then
    X = dados(:, 1);  // Primeira coluna para X
    Y = dados(:, 2);  // Segunda coluna para Y
    printf("\n[INFO] Dados carregados do arquivo CSV: %s\n", arquivo_csv);
else
    printf("\n[ERRO] O arquivo CSV deve ter exatamente 2 colunas (X, Y). Colunas encontradas: %d\n", size(dados, 2));
    abort;
end
*/

// Opção 2: Dados inseridos manualmente (descomente para usar)


X = [1.3, 3.4, 5.1, 6.8, 8.0]
Y = [2.0, 5.2, 3.8, 6.1, 5.8]


/*
X = [-1, -0.75, -0.5, -0.25, 0, 0.25, 0.5, 0.75, 1]
Y = [2.1, 1.3, 1.1, 0.2, 0, 0.5, 0.6, 1.5, 2.2]
*/

/*
X = [-1, -0.75, -0.6, -0.5, -0.3, 0, 0.2, 0.4, 0.5, 0.7, 1]
Y = [2.05, 1.153, 0.45, 0.4, 0.5, 0, 0.2, 0.6, 0.512, 1.2, 2.05]
*/

/*
X = [1, 2, 4, 8]
Y = [200, 110, 65, 30]
*/

// Configuração da plotagem do gráfico
num_de_plotagens = 3;

// [2] impressão dos dados e do polinômio de ajuste

printf("\n[1] TABELA DE DADOS UTILIZADA NO AJUSTE:\n\n")
for i = 1:length(X)
    printf("   x(%d) = %10.6f   y(%d) = %10.6f\n", i, X(i), i, Y(i))
end

// [3.1] funcao: ajuste polinomial por minimos quadrados (MQM)

function [Pol_ajuste, SSR, R2] = ajuste_polinomial_MQM(X, Y, ordem)
    n = length(X);
    grau = ordem + 1;
    aux = 0;

    for i = 1:grau
        for j = 1:grau
            for k = 1:n
                aux = aux + X(k).^((i-1) + (j-1))
            end
            A(i,j) = aux;
            aux = 0;
        end
    end    
    format("v", 9);
    printf("\n[2] Matriz do sistema normal: \n");
    disp(A);

    // [3.2] Construcao do vetor dos termos independentes (B)
    aux = 0;
    for i = 1:grau
        for k = 1:n
            aux = aux + X(k).^(i-1) * Y(k)
        end
        B(i) = aux;
        aux = 0;
    end
    printf("\n[3] VETOR DOS TERMOS INDEPENDENTES (B):")
    disp(B)

    // [3.3] Resolucao do sistema linear A * M = B para obter os coeficientes do polinomio de ajuste

    M = A \ B
    printf("\n[4] COEFICIENTES DO POLINÔMIO DE AJUSTE\n");
    disp(M);

    // [3.4] Construcao do polinomio ajustado
    Pol_ajuste = poly(M, "x", "c");
    printf("\n[5] POLINÔMIO AJUSTADO POR MQM:\n");
    disp(Pol_ajuste);

    // [3.5] Avaliacao da qualidade do ajuste:
    [SSR, R2] = calcular_desvios(X, Y, Pol_ajuste);
endfunction

// [4] Funcao: calculo dos desvios e do coeficiente R^2
function [SSR, R2] = calcular_desvios(X, Y, polinomio)
    n = length(X);
    Ybar = sum(Y) / n; // media dos valores observados
    SSR = 0;
    SST = 0;

    for i = 1:n
        ajuste = horner(polinomio, X(i));

        res_i = (Y(i) - ajuste)^2;
        SSR = SSR + res_i;
        
        sst_i = (Y(i) - Ybar)^2;
        SST = SST + sst_i;
    end
    R2 = 1 - SSR/SST;

    printf("\n[6] QUALIDADE DO AJUSTE:\n");
    // printf("   Soma dos quadrados dos resíduos (SSR): %.6f\n", SSR);
    printf("   Coeficiente de determinação R^2: %.6f\n", R2);
endfunction

// [5] Escolha do grau do polinômio de ajuste e execução do ajuste
ORDEM = 1;

for(i = 1:num_de_plotagens)
    printf("\n[7] GRAU DO POLINÔMIO DE AJUSTE: %d\n", ORDEM);

    // [6] Execução do ajuste polinomial por MQM
    [Pol_ajuste, SSR, R2] = ajuste_polinomial_MQM(X, Y, ORDEM);
    
    // [7] Impressão dos resultados e gráfico do ajuste
    plotar_ajuste_polinomial(X, Y, Pol_ajuste, ORDEM);
    
    printf("\n******** FIM DO AJUSTE POLINOMIAL POR MQM ********\n")
    ORDEM = ORDEM + 1;
end