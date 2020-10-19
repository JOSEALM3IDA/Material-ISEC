%MENUGRAFICOS Pede metodo(s) a representar e representa-os
% 
%INPUT (Informa��o de um PVI): 
%   strF - Fun��o em x e y em formato string
%   f - Fun��o da equa��o diferencial, em x e y
%   a - Limite esquerdo do intervalo
%   b - Limite direito do intervalo
%   n - Numero de sub-intervalos
%   y0 - Valor Inicial do PVI
%
%OUTPUT: 
%   Nada
%
%   09/04/2020 - Carlos Pais .: a2010017171@isec.pt
%   09/04/2020 - Jos� Almeida .: a2019129077@isec.pt
%   09/04/2020 - Pedro Rodrigues .: a2019136525@isec.pt
%%

function menuGraficos(strF, f, a, b, n, y0)

listaOpcoes = {'M�todo de Euler',...
             'Metodo de Euler Melhorado',...
             'M�todo de Runge-Kutta (ordem 2)',...
             'M�todo de Runge-Kutta (ordem 4)',...
             'M�todo usando ODE45',...
             'M�todo do Ponto M�dio'};
         
escolha = listdlg('ListString',listaOpcoes,'ListSize',[350 100],'Name','Tabela e Gr�ficos de Resultados','PromptString','Escolha um ou varios m�todos...',...
                  'OKString','Continuar','CancelString','Voltar');
              
if isempty(escolha) % s� executa o resto do codigo se a escolha tiver sido feita (para evitar problemas com o bot�o Voltar)
    return
end

[header, tabela] = fazerTabela(escolha, strF, f, a, b, n, y0);              % Chama a fun��o 'fazerTabela' e coloca os valores num array
tamanho = length(escolha);                                                  % tamanho recebe o tamanho de 'escolha'

fprintf('\n----------Tabela de Valores----------\n');
disp(header);                                                               % Mostra o cabe�alho
disp(tabela);                                                               % Mostra a tabela
fprintf('\nCarregue em qualquer tecla para avan�ar para o gr�fico...\n');
pause                                                                       % Pausa o progama at� o utilizador carregar numa tecla

h = (b-a)/n;                                                % Calcula o passo (h)
grid on                                                     % Mostra a grelha
t = a:h:b;                                                  % Aloca��o de mem�ria
plot(t, tabela(:,2), 'DisplayName', 'S.Exata');             % Mostra o gr�fico da Solu��o Exata
hold on                                                     % Neces�rio colocar para poderem aparecer mais valores no mesmo gr�fico

i = 3;                              % inicializa��o da vari�vel i que vai ser utilizada para incrementar a posi��o na tabela

for k = 1:tamanho                   % ciclo de 1 at� ao n�mero de op��es escolhidas no menu
    index = escolha(k);             % index recebe a op��o escolhida
    switch index                    % Switch que verifica qual/quais as op��es escolhidas no menu
        case 1 % ('----------Solu��o usando o M�todo de Euler----------')
            plot(t,tabela(:,i),'--ro','DisplayName','Euler')           % mostra o grafico do m�todo de Euler, com a linha a vermelho e com legenda 'Euler'

        case 2 % ('----------Solu��o usando o M�todo de Euler Melhorado (Heun)----------')
            plot(t,tabela(:,i),'--gx','DisplayName','Heun')
            
        case 3 % ('----------Solu��o usando o M�todo de Runge-Kutta de ordem 2----------')
            plot(t,tabela(:,i),'--b+','DisplayName','RK2')
           
        case 4 %('----------Solu��o usando o M�todo de Runge-Kutta de ordem 4----------')
            plot(t,tabela(:,i),'--c*','DisplayName','RK4')
   
        case 5 % ('----------Solu��o usando a fun��o ODE45 do MATLAB----------')
            plot(t,tabela(:,i),'--ms','DisplayName','ODE45')
   
        case 6 % ('----------Solu��o usando o M�todo do Ponto M�dio----------')
            plot(t,tabela(:,i),'--k^','DisplayName','MidPoint')

        otherwise
            errordlg('Op��o desconhecida', 'ERRO', 'modal');
    end
    i=i+1;
 end

title('Solu��o do PVI em modo gr�fico')             % titulo do gr�fico
legend show                                         % mostra a legenda dos m�todos escolhidos
grid on                                             % mostra as grelhas do gr�fico
hold off                                            % deve-se colocar quando n�o h� mais plots a fazer
shg;                                                % mostra o gr�fico