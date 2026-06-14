//https://www.wolframalpha.com/widgets/view.jsp?id=9951be8e8e72897baea23b49e96829d9
// SE INTEGRAL EXATA NÃO É DADA: jogar no link amigo ali em cima e resolver
// SE A FUNÇÃO NÃO É DADA: interpolar o polinômio usando os dados da tabela

clear();
printf("************************************************************\n");
printf("*                >>> INICIO DO PROGRAMA <<<                *\n");
printf("*            >>> Interpolacao por Lagrange <<<             *\n");
printf("************************************************************\n");

caminho = get_absolute_file_path("INTEGRACAO_COMPLETO.sce"); // caminho relativo para os arquivos de funcoes

exec(caminho + "01_trapezio_dados.sce", -1)
exec(caminho + "02_simpson_1_3_dados.sce", -1)
exec(caminho + "03_simpson_3_8_dados.sce", -1)
exec(caminho + "04_trapezio_funcoes.sce", -1)

// Dados para problemas com tabelas:
X = [0, 2, 4, 6]
Y = [1, 9, -65, 217]

// Dados para problemas com função
deff('y=f(x)', 'y = 1 + 97.5*x - 65*x^2 + 9.125*x^3');
x0 = 0.0
xn = 6.0
integral_exata = 37.5 //integral aproximada via math
// integral_exata = intg(x0, xn, f) // integral exata via scilab, mas tem que ser calculada depois de definir a função

// PROBLEMA 1 DO TRABALHO!!!!!
//X = [0,1,2,3,4,5,6]
//Y = [5.04,5.93,12.08,26.01,44.91,70.21,100.87]
//integral_exata = 210
//deff('y=f(x)', 'y = 3*x^2 - 2*x + 5')
//x0 = 0.0; xn = 6.0; n = 1000

// PROBLEMA 2 DO TRABALHO!!!!!
//X = [0,1,2,3,4,5,6]
//Y = [0.01,0.69,1.09,1.40,1.60,1.79,1.95]
//integral_exata = 7.6214
//deff('y=f(x)', 'y = log(x+1)')
//x0 = 0.0; xn = 6.0; n = 1000

// PROBLEMA 3 DO TRABALHO!!!!!
//X = [0,0.1667,0.3333,0.5,0.6667,0.8333,1]
//Y = [0,0.515,0.866,1,0.866,0.515,0.01]
//integral_exata = 0.63662
//deff('y=f(x)', 'y = sin(%pi*x)')
//x0 = 0.0; xn = 1.0; n = 1000

// PROBLEMA 4 DO TRABALHO!!!!!
//X = [0,1,2,3,4,5,6]
//Y = [1,0.49,0.2,0.099,0.06,0.038,0.027]
//integral_exata = 1.405647
//deff('y=f(x)', 'y = 1/(1 + x^2)')
//x0 = 0.0; xn = 6.0; n = 1000

// PROBLEMA 5 DO TRABALHO!!!!!
// não tem solução analitica, erros relativos 300%, só o último método da certo
//X = [0,1,2,3,4,5,6]
//Y = [1,0.44,-0.23,-0.47,-0.24,0.13,0.27]
//integral_exata = 0.0557713
//deff('y=f(x)', 'y = exp(-0.2*x)*cos(x)')
//x0 = 0.0; xn = 6.0; n = 1000

// Execução dos métodos com dados tabulados + funcao

printf("\n>> Método do Trapézio Generalizado (dados tabulados):")
Trapezio_Dados(X, Y, integral_exata)

printf("\n>> Método de Simpson 1/3 Generalizado (dados tabulados):")
Simpson_1_3_Dados(X, Y, integral_exata)

printf("\n>> Método de Simpson 3/8 Generalizado (dados tabulados):")
Simpson_3_8_Dados(X, Y, integral_exata)

//------------------------------------------------------------------------------

n = 1000 // número de subintervalos para o método do trapézio com função dada, quanto maior, mais precisa a aproximação
printf("\n>> Método do Trapézio Generalizado (função):")
Trapezio_Funcao(f, x0, xn, n, integral_exata)

printf("\n***** FIM INTEGRAÇÃO NUMÉRICA *****\n")