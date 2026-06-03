//=====================================================================================
// Função: plotar ajuste polinomial (REGRESSAO POLINOMIAL)
// Objetivo: Gerar o gráfico do polinômio interpolador ajustado por minimos quadrados aos pontos (X, Y)
// Entradas:
//      X: vetor de abscissas dos pontos interpolados (xi)
//      Y: vetor de ordenadas dos pontos interpolados (yi)
//      POL_AJUSTE: polinomio ajustado por minimos quadrados


function plotar_ajuste_polinomial(X, Y, Pol_ajuste, ORDEM)


    dx = (max(X) - min(X)) * 0.05; // margem de 5% para os limites do gráfico
    xx = linspace(min(X) - dx, max(X) + dx, 300); // pontos para traçar a curva suavemente
    yy = horner(Pol_ajuste, xx); // avalia o polinômio ajustado nos pontos xx

    //cores da funcao
    if ORDEM == 1 then
        cor_ajuste = "red";
    elseif ORDEM == 2 then
        cor_ajuste = "cyan";
    else 
        cor_ajuste = "blue";
    end

    plot2d(xx, yy, style = [color(cor_ajuste)]);
    h =gce();
    h.children.thickness = 4;
    plot2d(X, Y, -4);

    // Título e rótulos genéricos (ajustáveis no futuro)
    titulo = "Curva de ajuste polinomial - MQM"
    rotulo_x = "Dados observados, X(i)"
    rotulo_y = "Valores resultantes, Y(i)"
    
    xgrid();

    // Título e eixos
    xtitle(titulo, rotulo_x, rotulo_y);

    // legenda - ordem precisa respeitar a chamada ao 'plot()'
    /*
    "in_upper_right" // canto superior direito
    "in_upper_left" // canto superior esquerdo
    "in_lower_right" // canto inferior direito
    "in_lower_left" // canto inferior esquerdo
    */

    // Legenda - ordem precisa respeitar a chamada ao 'plot()'
    legend(["Curva ajustada", "Dados observados"], "in_lower_right");

    // Ajustes visuais (melhor legibilidade)
    ax = gca();
    ax.font_size = 4;
    ax.title.font_size = 4.5;
    ax.x_label.font_size = 4.5;
    ax.y_label.font_size = 4.5;

    lg = findobj("type", "legend");
    if ~isempty(lg) then
        lg.font_size = 3;
    end
endfunction