%FAZERTABELA Faz a tabela com os m�todos pretendidos
% 
%INPUT (Informa��o de um PVI + vetor com informa�ao dos metodos selecionados): 
%   escolha - Vetor com informa��o dos m�todos pretendidos
%   strF - Fun��o em x e y em formato string
%   f - Fun��o da equa��o diferencial, em x e y
%   a - Limite esquerdo do intervalo
%   b - Limite direito do intervalo
%   n - Numero de sub-intervalos
%   y0 - Valor Inicial do PVI
%
%OUTPUT: 
%   header - Header da tabela com os m�todos pretendidos
%   tabela - Tabela preenchida com os m�todos pretendidos
%
%   11/04/2020 - Carlos Pais .: a2010017171@isec.pt
%   11/04/2020 - Jos� Almeida .: a2019129077@isec.pt
%   11/04/2020 - Pedro Rodrigues .: a2019136525@isec.pt
%%

function [header, tabela] = fazerTabela(escolha, strF, f, a, b, n, y0)

i = 3;                                                     % inicializa��o da vari�vel i que vai ser utilizada para incrementar a posi��o na tabela

tamanho = length(escolha);

tabela = zeros(n+1, tamanho*2 + 2);                        % aloca�ao de memoria de uma matriz de zeros

try
    header = strings(1, tamanho*2 + 2);                        % inicializa��o de um vetor vazio de caracteres
catch armenio
    disp('Aviso: aloca��o do "header" imposs�vel. A fun�ao strings() s� foi implementada na vers�o r2016b! Isto poder� reduzir a velocidade do programa');
end
h = (b-a)/n;                                            % Calcula o passo (h)
t = a:h:b;                                              % Aloca��o de mem�ria
header{1} = 'x';                                        % Coloca um 'x' na posi��o 1 do header
tabela(:,1) = t';                                       

sExata = dsolve(['Dy=', strF], ['y(',num2str(a),')=',num2str(y0)]);
g = @(t) eval(vectorize(char(sExata)));
y = g(t);
header{2} = 'Exata';
tabela(:,2) = y';

for k = 1:tamanho                                       % ciclo de 1 at� ao n�mero de op��es escolhidas no menu
    index = escolha(k);                                 % index recebe a op��o escolhida
    switch index                                        % Switch que verifica qual/quais as op��es escolhidas no menu
        case 1 % ('----------Solu��o usando o M�todo de Euler----------')
            y = N_Euler(f, a, b, n, y0);              % y recebe o valor do resultado do m�todo de Euler                                       
            header{i} = 'Euler';                        % Caso for selecionado o m�todo de Euler, adiciona-o ao Cabe�alho
            tabela(:,i) = y';                           % na posi��o de i vai copiar todo o array de y (:) para a tabela

        case 2 % ('----------Solu��o usando o M�todo de Euler Melhorado (Heun)----------')
            y = N_Heun(f, a, b, n, y0);                  % y recebe o valor do resultado do m�todo de Heun
            header{i} = 'Heun';                         % Caso for selecionado o m�todo de Heun, adiciona-o ao Cabe�alho
            tabela(:,i) = y';                           % na posi��o de i vai copiar todo o array de y (:) para a tabela

        case 3 % ('----------Solu��o usando o M�todo de Runge-Kutta de ordem 2----------')
            y = N_RK2(f, a, b, n, y0);                   % y recebe o valor do resultado do m�todo RK2
            header{i} = 'RK2';                          % Caso for selecionado o m�todo de RK2, adiciona-o ao Cabe�alho
            tabela(:,i) = y';                           % na posi��o de i vai copiar todo o array de y (:) para a tabela

        case 4 %('----------Solu��o usando o M�todo de Runge-Kutta de ordem 4----------')
            y = N_RK4(f, a, b, n, y0);                   % y recebe o valor do resultado do m�todo RK4
            header{i} = 'RK4';                          % Caso for selecionado o m�todo de RK4, adiciona-o ao Cabe�alho
            tabela(:,i) = y';                           % na posi��o de i vai copiar todo o array de y (:) para a tabela

        case 5 % ('----------Solu��o usando a fun��o ODE45 do MATLAB----------')
            y = N_ODE45(f, a, b, n, y0);                % y recebe o valor do resultado do m�todo ODE45
            header{i} = 'ODE45';                        % Caso for selecionado o m�todo de ODE45, adiciona-o ao Cabe�alho
            tabela(:,i) = y;                            % na posi��o de i vai copiar todo o array de y (:) para a tabela

        case 6 % ('----------Solu��o usando o M�todo do Ponto M�dio----------')
            y = N_PM(f, a, b, n, y0);                    % y recebe o valor do resultado do m�todo Mid Point
            header{i} = 'MidPoint';                     % Caso for selecionado o m�todo de Mid Point, adiciona-o ao Cabe�alho
            tabela(:,i) = y';                            % na posi��o de i vai copiar todo o array de y (:) para a tabela
        otherwise
            errordlg('Op��o desconhecida', 'ERRO', 'modal');
    end
    i=i+1;                                              % incrementa a posi��o do array tabela
end

while(i <= tamanho*2+2)
    header{i} = append('Erro ',header{i - tamanho});              % Popular o header dos erros
    
    tabela(:,i) = abs(tabela(:,i-tamanho) - tabela(:,2));         % Popular as colunas dos erros
    
    i = i+1;
end




