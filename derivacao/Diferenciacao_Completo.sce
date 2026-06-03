clear();

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

X = [1.8, 1.9, 2.0, 2.1, 2.2]
Y = [10.889365, 12.703199, 14.778112, 17.148957, 19.855030]
k = 3   //indice do ponto a ser avaliado


//derivadas exatas no ponto de interesse da funcao = x * exp(x)  ou x * e^x
x = 2.0
derivada_1a_exata = (x+1)*exp(x)  // 22.167168
derivada_2a_exata = (x+2)*exp(x)  // 29.556224
derivada_3a_exata = (x+3)*exp(x)  // 36.945270
derivada_4a_exata = (x+4)*exp(x)  // 44.334337

// execução dos métodos

printf("\n>> Progressiva de 1a Ordem:")
Progressiva_1a_Ordem(X, Y, k, derivada_1a_exata, derivada_2a_exata)

printf("\n\n***************************************************************************************\n")

printf("\n\n\n>> Regressiva de 1a Ordem:")
Regressiva_1a_Ordem(X, Y, k, derivada_1a_exata, derivada_2a_exata)

printf("\n\n***************************************************************************************\n")

printf("\n\n\n>> Centrada de 2a Ordem (1a derivada):")
Centrada_2a_Ordem_1a(X, Y, k, derivada_1a_exata, derivada_3a_exata)

printf("\n\n***************************************************************************************\n")

printf("\n\n\n>> Centrada de 2a Ordem (2a derivada):")
Centrada_2a_Ordem_2a(X, Y, k, derivada_2a_exata, derivada_4a_exata)

printf("\n\n***************************************************************************************\n")

printf("\n\n\n>> Lagrange - 1o Caso:")
Lagrange_1o_Caso(X, Y, k, derivada_1a_exata)

printf("\n\n***************************************************************************************\n")

printf("\n\n\n>> Lagrange - 2o Caso:")
Lagrange_2o_Caso(X, Y, k, derivada_1a_exata)

printf("\n\n***************************************************************************************\n")

printf("\n\n\n>> Lagrange - 3o Caso:")
Lagrange_3o_Caso(X, Y, k, derivada_1a_exata)

printf("\n\n***** FIM DIFERENCIAÇÃO NUMÉRICA *****\n")