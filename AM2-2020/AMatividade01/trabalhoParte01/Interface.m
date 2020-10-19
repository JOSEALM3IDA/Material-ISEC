% INTERFACE
% Problema de Valor Inicial
% M�todos Num�ricos para aproxima��es a solu��es de EDO
% Atividade 01 - Parte 1 
%
%   07/04/2020 - Carlos Pais .: a2010017171@isec.pt
%   07/04/2020 - Jos� Almeida .: a2019129077@isec.pt
%   07/04/2020 - Pedro Rodrigues .: a2019136525@isec.pt
%%

clear all
close all
clc
inserido = 0;

while ~inserido
    
menuPVI = menu('M�todos Num�ricos para PVI',...
             'Inserir Dados do PVI',...
             'Solu��o Exata',...
             'Solu��es Aproximadas',...
             'Tabela e Gr�ficos de Resultados',...
             'Ficheiro Excel',...
             'Voltar ao Menu Inicial',...
             'Sair');

     switch menuPVI
         case 1  % caso o utilizador pretenda introduzir dados
            [strF, f, a, b, n, y0] = pedirDados();
            inserido = 1;
         case 6  %caso o utilizador pretenda regressar ao menu inicial
             Atividade01_MNEDO();
             return;
         case {0, 7} % caso o utilizador clicar na cruz ou na op�ao Sair
             sair = questdlg('Tem a certeza que deseja sair?', 'Sair?', 'Sim', 'N�o', 'Sim');
             if strcmp(sair, 'Sim')
                 return;
             end
         otherwise
             errordlg('Insira primeiro os dados do PVI!', 'ERRO', 'modal');
     end
end


while 1
    h = (b-a)/n; % Passo - tamanho de cada sub-intervalo
    
    menuPVI = menu('M�todos Num�ricos para PVI',...
             'Inserir Dados do PVI',...
             'Solu��o Exata',...
             'Solu��es Aproximadas',...
             'Tabela e Gr�ficos de Resultados',...
             'Ficheiro Excel',...
             'Voltar ao Menu Inicial',...
             'Sair');
         
     switch menuPVI
         case 1 % caso o utilizador pretenda reintroduzir dados
            [strF, f, a, b, n, y0] = pedirDados();
            
         case 2 % Apresentar solu��o exata
             sExata = dsolve(['Dy=', strF], ['y(',num2str(a),')=',num2str(y0)]);
             g = @(t) eval(vectorize(char(sExata)));
             t=a:h:b;
             yExata = g(t);
             disp('----------Solu��o exata do PVI----------')
             yExata'
             
         case 3 % Abrir sub-menu dos M�todos
             auxiliar = menuMetodos(f, a, b, n, y0);
             if auxiliar
                 return;
             end
             
         case 4 % Plot dos graficos pretendidos 
             menuGraficos(strF, f, a, b, n, y0);
             
         case 5 % Ficheiro Excel com as op�oes pretendidas
             menuExcel(strF, f, a, b, n, y0);
         
         case 6
             Atividade01_MNEDO();
             return;
         case {0, 7} % caso o utilizador clicar na cruz ou na op�ao Sair
             sair = questdlg('Tem a certeza que deseja sair?', 'Sair?', 'Sim', 'N�o', 'Sim');
             if strcmp(sair, 'Sim')
                 return;
             end
         otherwise
             errordlg('Op��o desconhecida', 'ERRO', 'modal'); % apenas serve de controlo a eventuais erros
     end
            
end

