function plotar_interpolador(X, Y, COEF)

    if typeof(COEF) == "polynomial" then
        COEF = coeff(COEF)
    end

    Pol = poly(COEF, 'x', 'c')

    x_min = min(X)
    x_max = max(X)
    delta = (x_max - x_min) * 0.05
    xx = linspace(x_min - delta, x_max + delta, 300)
    yy = horner(Pol, xx)
    yy_interp = horner(Pol, pontos_interp)

    titulo = "Polinômio Interpolador: p_n(x)"
    rotulo_x = "vetor X"
    rotulo_y = "vetor Y"

    clf()
    plot(X, Y, 'ro', xx, yy, 'b', pontos_interp, yy_interp, 'rs', 'LineWidth', 3.5)
    xgrid()
    xtitle(titulo, rotulo_x, rotulo_y)

    legend(["Dados", "p_n(x)", "Pontos de Interpolação"], "in_upper_left")

    a = gca()
    a.title.font_size = 4.5
    a.x_label.font_size = 4.5
    a.y_label.font_size = 4.5
    a.x_location = "origin"; // Coloca o eixo Y no zero
    a.y_location = "origin"; // Coloca o eixo X no zero
endfunction