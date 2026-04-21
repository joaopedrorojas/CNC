// 1. Definição da Função
// Você pode alterar a expressão dentro de 'y = ...'

clear();clf()

function y = x3 - 2*x - 5  
     
endfunction;

// 2. Parâmetros do Gráfico
x_min = -5;
x_max = 5;
x_vetor = linspace(x_min, x_max, 500);

// 3. Cálculo da Raiz
// O fsolve precisa de um "chute inicial" (0 neste caso)
raiz = fsolve(0, f);

// 4. Criação da Janela Gráfica
clf(); // Limpa janelas anteriores
plot(x_vetor, f(x_vetor), "b-", "linewidth", 2);

// 5. Formatação dos Eixos (Marcação X e Y)
xgrid(color("grey")); // Adiciona a grade
a = gca(); // Captura os eixos atuais
a.x_location = "origin"; // Coloca o eixo Y no zero
a.y_location = "origin"; // Coloca o eixo X no zero
xtitle("Gráfico da Função com Destaque na Raiz", "Eixo X", "Eixo Y");

// 6. Destaque da Raiz
// Plota um ponto vermelho sobre a raiz encontrada
plot(raiz, f(raiz), "ro", "markersize", 10, "markerfacecolor", "red");

// Adiciona um rótulo com o valor da raiz
message = "Raiz aprox: " + string(raiz);
xstring(raiz, 0.5, message); // Escreve o valor próximo ao ponto

printf("A raiz encontrada para a função é: %.4f\n", raiz);
