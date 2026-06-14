clear();

// DEFINIR DERIVADAS COM https://www.derivative-calculator.net/


// DIFERENCIAÇÃO NUMÉRICA - MÓDULO COMPLETO

printf("\n");
printf("\t\t############################################################\n");
printf("\t\t#                                                          #\n");
printf("\t\t#     >>> DIFERENCIAÇÃO NUMÉRICA - MÓDULO COMPLETO <<<     #\n");
printf("\t\t#                                                          #\n");
printf("\t\t############################################################\n\n\n");

caminho = get_absolute_file_path("Diferenciacao_Completo.sce");

exec(caminho + "01_progressiva_1a_ordem.sce", -1)
exec(caminho + "02_regressiva_1a_ordem.sce", -1)
exec(caminho + "03_centrada_2a_ordem_1aderv.sce", -1)
exec(caminho + "04_centrada_2a_ordem_2aderv.sce", -1)
exec(caminho + "05_lagrange_1o_caso.sce", -1)
exec(caminho + "06_lagrange_2o_caso.sce", -1)
exec(caminho + "07_lagrange_3o_caso.sce", -1)
exec(caminho + "08_imprimir_erro.sce", -1)
exec(caminho + "09_erro_truncamento.sce", -1)

/*
X = [4.6, 4.8, 5.0, 5.2, 5.4];
Y = [16.191545, 18.059177, 20.205379, 22.622727, 25.296178]
*/

/*
X = [1.6, 1.8, 2.0, 2.2, 2.4]
Y = [0.955512, 1.029619, 1.098612, 1.163151, 1.223775]
*/

/*
X = [1.6, 1.8, 2.0, 2.2, 2.4];
Y = [3.244909, 3.583519, 3.953032, 4.356755, 4.798624];
*/

X = [16, 18, 20, 22, 24];
Y = [28.332133, 29.444390, 30.445225, 31.354944, 32.188758]

/*
deff('y = f(x)', 'y = x^2 + 5*sin(x)')

deff('y = f_linha(x)', 'y = 2*x + 5*cos(x)')           // 1a derivada exata
deff('y = f_2linha(x)', 'y = 2 - 5*sin(x)')            // 2a derivada exata
deff('y = f_3linha(x)', 'y = -5*cos(x)')               // 3a derivada exata
deff('y = f_4linha(x)', 'y = 5*sin(x)')                // 4a derivada exata
*/
/*
deff('y = f(x)', 'y = log(x + 1)')

deff('y = f_linha(x)', 'y = 1/(x+1)')           // 1a derivada exata
deff('y = f_2linha(x)', 'y = -1/(x+1)^2')       // 2a derivada exata
deff('y = f_3linha(x)', 'y = 2/(x+1)^3')        // 3a derivada exata
deff('y = f_4linha(x)', 'y = -6/(x+1)^4')       // 4a derivada exata
*/
/*
deff('y = f(x)', 'y = sqrt(x^3 + 9)')

deff('y = f_linha(x)', 'y = 3*x^2 / (2*sqrt(x^3 + 9))')
deff('y = f_2linha(x)', 'y = 3*x*(x^3 + 36) / (4*(x^3 + 9)^(3/2))')
deff('y = f_3linha(x)', 'y = (9*x^6 + 432*x^3 - 972) / (8*(x^3 + 9)^(5/2))')
deff('y = f_4linha(x)', 'y = (-27*x^9 - 1944*x^6 + 17496*x^3 + 78732) / (16*(x^3 + 9)^(7/2))')
*/

deff('y = f(x)', 'y = 10 * log(x + 1)')

deff('y = f_linha(x)', 'y = 10 / (x + 1)')           // 1a derivada exata
deff('y = f_2linha(x)', 'y = -10 / (x + 1)^2')       // 2a derivada exata
deff('y = f_3linha(x)', 'y = 20 / (x + 1)^3')        // 3a derivada exata
deff('y = f_4linha(x)', 'y = -60 / (x + 1)^4')       // 4a derivada exata

k = 3   //indice do ponto a ser avaliado

//valor a ser avaliado
x = X(k)



// Calcula os valores das derivadas EXATAS no ponto x
derivada_1a_exata = f_linha(x)
derivada_2a_exata = f_2linha(x)
derivada_3a_exata = f_3linha(x)
derivada_4a_exata = f_4linha(x)

// execução dos métodos

printf("\n>> Progressiva de 1a Ordem:")
Progressiva_1a_Ordem(X, Y, k, derivada_1a_exata, derivada_2a_exata)

printf("\n***************************************************************************************\n")

printf("\n>> Regressiva de 1a Ordem:")
Regressiva_1a_Ordem(X, Y, k, derivada_1a_exata, derivada_2a_exata)

printf("\n***************************************************************************************\n")

printf("\n>> Centrada de 2a Ordem (1a derivada):")
Centrada_2a_Ordem_1a(X, Y, k, derivada_1a_exata, derivada_3a_exata)

printf("\n***************************************************************************************\n")

printf("\n>> Centrada de 2a Ordem (2a derivada):")
Centrada_2a_Ordem_2a(X, Y, k, derivada_2a_exata, derivada_4a_exata)

printf("\n***************************************************************************************\n")

printf("\n>> Lagrange - 1o Caso:")
Lagrange_1o_Caso(X, Y, k, derivada_1a_exata)

printf("\n***************************************************************************************\n")

printf("\n>> Lagrange - 2o Caso:")
Lagrange_2o_Caso(X, Y, k, derivada_1a_exata)

printf("\n***************************************************************************************\n")

printf("\n>> Lagrange - 3o Caso:")
Lagrange_3o_Caso(X, Y, k, derivada_1a_exata)

printf("\n\n%.6f\n", derivada_1a_exata)
printf("%.6f\n", derivada_2a_exata)
printf("%.6f\n", derivada_3a_exata)
printf("%.6f\n", derivada_4a_exata)

printf("\n\n***** FIM DIFERENCIAÇÃO NUMÉRICA *****\n")