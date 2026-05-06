clear();   // limpa variaveis
//**************************************************************************

//Mét. Bissecção para encontrar raízes de funções


printf("\n\n*********** Aproximação de raízes de funções usando o método da bissecção ***********\n\n")


//deff('y = f(x)', 'y = exp(-x)-sin(x)')
//deff('y = f1(x)', 'y = -exp(-x)-cos(x)')
deff('y = f(x)', 'y = 7*(2 - 0.9^x) - 10')
deff('y = f1(x)', 'y = -7*(0.9^x) * log(0.9)')
//deff('y = f(x)', 'y = x^3 - 9*x + 3')
//deff('y = f1(x)', 'y = 3*x^2 - 9')


ak_global = 4
bk_global = 6
chute_inicial = 5

printf("\n\n** Isolamento de raízes pelo TVI **\n\n")

// define a função f(x)
//deff('y = f(x)', 'y = 5 - 20*(exp(-0.2*x) - exp(-0.75*x))')

a = 0; // início do intervalo de busca
b = 10; // fim do intervalo de busca
passo = 1; // tamanho do subintervalo

printf("Intervalos que podem conter raízes:\n")
for x = a:passo:(b-passo)
    fa = f(x);
    fb = f(x+passo);
    if fa * fb < 0 then
        printf("[%f, %f]\n\n", x, x+passo)
    end
end


ak = ak_global
bk = bk_global

epsilon1 = 1e-6
epsilon2 = 1e-6
k = 0
nmax = 100
xm = 1 * (ak + bk)

printf("  k  |  xm  |  abs(bk - ak)  |  f(xm)  \n")
 while (k < nmax) & (abs(bk - ak) > epsilon1) & (abs(f(xm)) > epsilon2) 
  xm = 0.5 * (ak + bk)
  k = k + 1
printf(" %2i | %10.6f | %10.6f | %10.6f \n", k, xm, abs(bk - ak), f(xm))
  if (f(ak) * f(xm) < 0) then
    bk = xm
  else
    ak = xm
  end
end

printf("\nRaiz aproximada pelo método da bissecção: %10.6f\n", xm)
printf("Numero de iteracoes: %i\n\n\n\n", k)


//**************************************************************************

//Mét. Falsa Posição para encontrar raízes de funções


printf("*********** Aproximação de raízes de funções usando o método da falsa posição ***********\n\n")


ak = ak_global
bk = bk_global

k = 0
Xk = ak - (f(ak) * (bk - ak) / (f(bk) - f(ak)))

printf("  k  |  xm  |  abs(bk - ak)  |  f(xm)  \n")
 while (k < nmax) & (abs(bk - ak) > epsilon1) & (abs(f(Xk)) > epsilon2) 
  Xk = ak - (f(ak) * (bk - ak) / (f(bk) - f(ak)))
  k = k + 1
printf(" %2i | %10.6f | %10.6f | %10.6f \n", k, Xk, abs(bk - ak), f(Xk))
  if (f(ak) * f(Xk) < 0) then
    bk = Xk
  else
    ak = Xk
  end
end

printf("\nRaiz aproximada pelo método da falsa posição: %10.6f\n", Xk)
printf("Numero de iteracoes: %i\n\n\n\n", k)


//**************************************************************************


printf("*********** Aproximação de raízes de funções usando o método de Newton-Raphson ***********\n\n")


x_anterior = chute_inicial

k = 0

x_atual = x_anterior - (f(x_anterior) / f1(x_anterior))

printf("  k  |  x_anterior  |  abs(x1 - x0)  |  f(x_anterior)  \n")
 while (k < nmax) & (abs(x_atual - x_anterior) > epsilon1) & (abs(f(x_anterior)) > epsilon2) 
  x_anterior = x_atual
  x_atual = x_anterior - (f(x_anterior) / f1(x_anterior))
  k = k + 1
printf(" %2i | %10.6f | %10.6f | %10.6f \n", k, x_anterior, abs(x_atual - x_anterior), f(x_anterior))

  end

printf("\nRaiz aproximada pelo método de Newton-Raphson: %10.6f\n", x_atual)
printf("Numero de iteracoes: %i\n\n\n\n", k)

//**************************************************************************

//Mét. de Secante para encontrar raízes de funções


printf("*********** Aproximação de raízes de funções usando o método de Secante ***********\n\n")


x_anterior0 = ak_global
x_anterior1 = bk_global

k = 0

x_atual = x_anterior1 - (f(x_anterior1) * (x_anterior1 - x_anterior0) / (f(x_anterior1) - f(x_anterior0))) 

printf("  k  |  Xk  |  abs(Xk - Xk-1)  |  f(Xk)  \n")
 while (k < nmax) & (abs(x_atual - x_anterior1) > epsilon1) & (abs(f(x_atual)) > epsilon2) 
  x_anterior0 = x_anterior1
  x_anterior1 = x_atual
  x_atual = x_anterior1 - (f(x_anterior1) * (x_anterior1 - x_anterior0) / (f(x_anterior1) - f(x_anterior0))) 
  k = k + 1
printf(" %2i | %10.6f | %10.6f | %10.6f \n", k, x_anterior1, abs(x_anterior1 - x_anterior0), f(x_anterior0))

  end

printf("\nRaiz aproximada pelo método de Secante: %10.6f\n", x_atual)
printf("Numero de iteracoes: %i\n\n\n\n", k)


//**************************************************************************

x = 0: 0.01 : 10
y = 7*(2 - 0.9^x) - 10
clf();

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
