// AJUSTES FUNCIONAIS BASICOS - INVERSOS, DIRETOS E LINEARES
/////////////////////////////////////////////////////////////

// Estescript ajusta modelos funcionais simples:
//      [1] Inversamente proporcional    -> T(x) = a / x
//      [2] Inverso com intercpto        -> T(x) = a / x + b
//      [3] Direto proporcional          -> T(x) = a * x
//      [4] Linear (afim)                -> T(x) = a * x + b

//ENTRADA DE DADOS: vetor X e Y
// Ajuste por MQM direto ou transformado

printf("\n***** AJUSTE FUNCIONAL: Inverso, Direto e Linear *****\n")

//=================== ENTRADA DE DADOS ===================
X = [10, 20, 50, 100];
Y = [900, 450, 180, 90];

//=================== MENU DE MODELOS ===================
printf("\n[1] Modelos disponíveis para ajuste:\n")
printf("    [1] Inversamente proporcional:     T(x) = a / x\n")
printf("    [2] Inverso com intercpto:         T(x) = a / x + b\n")
printf("    [3] Direto proporcional:           T(x) = a * x\n")
printf("    [4] Linear (afim):                 T(x) = a * x + b\n")


printf("\nEscolha o modelo de ajuste (1, 2, 3 ou 4): ")
modo = input("\nEscolha o modelo de ajuste (1, 2, 3 ou 4): ")
printf("----------------------------------------------------------------------\n")

// ========================== PONTOS A AVALIAR ==========================
pontos = [30, 75]

// ========================== AJUSTE POR MQM ==========================
select modo
    case 1 then
        // [1] Inversamente proporcional: T(x) = a / x
        // Transformação linear: Y = a * (1/x)
        Z = 1 ./ X; // vetor de abscissas transformado
        a = sum(Z .* Y) / sum(Z.^2); // coeficiente a
        Y_pred = a ./ X; // valores preditos pelo modelo
        Y_pontos = a ./ pontos; // valores preditos nos pontos de interesse
        modelo_str = "T(x) = a / x";
        printf("[Modelo 1] Inversamente proporcional: T(x) = %.3f / x\n", a);

    case 2 then
        // [2] Inverso com intercpto: T(x) = a / x + b
        // Transformação linear: Y = a * (1/x) + b
        Z = 1 ./ X; // vetor de abscissas transformado
        A = [Z', ones(length(Z), 1)]; // matriz de design para regressão linear
        coef = A \ Y'; // resolução do sistema para obter a e b
        a = coef(1);
        b = coef(2);
        Y_pred = a ./ X + b; // valores preditos pelo modelo
        Y_pontos = a ./ pontos + b; // valores preditos nos pontos de interesse
        modelo_str = "T(x) = a / x + b";
        printf("[Modelo 2] Inverso com intercepto: T(x) = %.3f / x + %.3f\n", a, b);

    case 3 then
        // [3] Direto proporcional: T(x) = a * x
        a = sum(X .* Y) / sum(X.^2); // coeficiente a
        Y_pred = a .* X; // valores preditos pelo modelo
        Y_pontos = a .* pontos; // valores preditos nos pontos de interesse
        modelo_str = "T(x) = a * x";
        printf("[Modelo 3] Direto proporcional: T(x) = %.3f * x\n", a);

    case 4 then
        // [4] Linear (afim): T(x) = a * x + b
        A = [X', ones(length(X), 1)]; // matriz de design para regressão linear
        coef = A \ Y'; // resolução do sistema para obter a e b
        a = coef(1);
        b = coef(2);
        Y_pred = a .* X + b; // valores preditos pelo modelo
        Y_pontos = a .* pontos + b; // valores preditos nos pontos de interesse
        modelo_str = "T(x) = a * x + b";
        printf("[Modelo 4] Linear (afim): T(x) = %.3f * x + %.3f\n", a, b);

    else
        error("Opção inválida. Escolha 1, 2, 3 ou 4.");
end

// ========================== AVALIACAO DE QUALIDADE ===========================
SS_tot = sum((Y - mean(Y)).^2); // Soma total dos quadrados
SS_res = sum((Y - Y_pred).^2); // Soma dos quadrados dos resíduos
R2 = 1 - SS_res / SS_tot; // Coeficiente de determinação

printf("\n[Coef. de Determinação R^2]: %.6f\n", R2);
for i = 1:length(pontos)
    printf("[Predicao %d] T(%.1f) = %.3f segundos\n", i, pontos(i), Y_pontos(i));
end

// ========================== PLOTAGEM DO AJUSTE ===========================
dx = (max(X) - min(X)) * 0.05; // margem de 5% para os limites do gráfico
xx = linspace(min(X) - dx, max(X) + dx, 300); // pontos para traçar a curva suavemente
select modo
    case 1 then yy = a ./ xx; // valores do modelo 1
    case 2 then yy = a ./ xx + b; // valores do modelo 2
    case 3 then yy = a .* xx; // valores do modelo 3
    case 4 then yy = a .* xx + b; // valores do modelo 4
end
/////////////////////////////////////////////////////////////////////////

//      [Grafico] Dados observados (pontos) e curva de ajuste do modelo selecionado

plot(X, Y, 'ro')
select modo
    case 1 then
        estilo = "b-"   //azul - inversamente proporcional
    case 2 then
        estilo = "r-"   //vermelho - inverso com intercepto
    case 3 then
        estilo = "m-"   //magenta - direto proporcional
    case 4 then
        estilo = "k-"   //preto - linear (afim)
    else
        estilo = "g-"   //verde - caso de erro (não deveria ocorrer)
end

plot(xx, yy, estilo, "LineWidth", 3);
legendas = ["Dados observados", modelo_str];
legend(legendas, "in_upper_right");
xtitle("Ajuste do Modelo: " + modelo_str, "x", "T(x)");
xgrid();

ax = gca();
ax.font_size = 4;
ax.title.font_size = 4;
ax.x_label.font_size = 4;
ax.y_label.font_size = 4;

lg = findobj("type", "legend");
if ~isempty(lg) then
    lg.font_size = 3;
end

printf("\n******** FIM DO AJUSTE FUNCIONAL ********\n")