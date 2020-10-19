%MENUEXCEL Pede metodo(s) a representar e representa-os
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
%   10/04/2020 - Carlos Pais .: a2010017171@isec.pt
%   11/04/2020 - Jos� Almeida .: a2019129077@isec.pt
%   09/04/2020 - Pedro Rodrigues .: a2019136525@isec.pt
%%

function menuExcel(strF, f, a, b, n, y0)

listaOpcoes = {'M�todo de Euler',...
             'Metodo de Euler Melhorado',...
             'M�todo de Runge-Kutta (ordem 2)',...
             'M�todo de Runge-Kutta (ordem 4)',...
             'M�todo usando ODE45',...
             'M�todo do Ponto M�dio'};
         
escolha = listdlg('ListString',listaOpcoes,'ListSize',[350 100],'Name','Cria��o de Ficheiro Excel','PromptString','Escolha um ou varios m�todos...',...
                  'OKString','Continuar','CancelString','Voltar');
              
if isempty(escolha) % s� executa o resto do codigo se a escolha tiver sido feita (para evitar problemas com o bot�o Voltar)
    return
end

[header, tabela] = fazerTabela(escolha, strF, f, a, b, n, y0);              % Chama a fun��o 'fazerTabela' e coloca os valores num array

filename = 'MetodosNumericos.xlsx';                                         % A vari�vel 'filename' fica associada ao ficheiro pdf

if exist(filename, 'file')                              % Verifica se o ficheiro 'MetodosNumericos.xlsx' existe
    delete(filename);                                   % se existir apaga-o
end

xlswrite(filename,header,'Sheet1','B2');                                    % Escreve o cabe�alho no ficheiro excel a partir da c�lula B2
xlswrite(filename,tabela,'Sheet1','B3');                                    % Escreve os valores da tabela no ficheiro excel a partir da c�lula B3
winopen(filename);                                                          % Abre o ficheiro excel