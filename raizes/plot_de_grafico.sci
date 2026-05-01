//plot de grafico

clear();clf() // limpa variaveis

printf("*********** Método da bissecção para encontrar raízes de funções ***********\n\n")
printf("*********** Exemplo com a função padrão ***********\n\n")

x = -0.5 : 0.01 : 1
//y = x.^2 + log(x)
y = x.^2 + log(x);

plot2d(x,y)
h = gce()
line_handle = h.children
line_handle.thickness = 4
line_handle.line_mode = 1
line_handle.foreground = color('green')

xtitle("Localizacao das raizes: grafico da função")
a = gca(); // Captura os eixos atuais
a.x_location = "origin"; // Coloca o eixo Y no zero
a.y_location = "origin"; // Coloca o eixo X no zero
a.title.font_size = 4

xgrid(1)
