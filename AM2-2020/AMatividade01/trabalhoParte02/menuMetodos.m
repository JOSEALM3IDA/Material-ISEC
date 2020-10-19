%MENUGRAFICOS Pede m�todo a utilizar e devolve o vetor das solu��es
% 
%INPUT (Informa��o de um PVI): 
%   f - Fun��o da equa��o diferencial, em x e y
%   a - Limite esquerdo do intervalo
%   b - Limite direito do intervalo
%   n - Numero de sub-intervalos
%   y0 - Valor Inicial do PVI
%
%OUTPUT: 
%   auxiliar - Usada quando o utilizador decide fechar o programa
%
%   07/04/2020 - Carlos Pais .: a2010017171@isec.pt
%   07/04/2020 - Jos� Almeida .: a2019129077@isec.pt
%   07/04/2020 - Pedro Rodrigues .: a2019136525@isec.pt
%%

function auxiliar = menuMetodos(f, a, b, n, y0)

    auxiliar = 0;
    
    while 1
        escolha = menu('M�todos Num�ricos para PVI',...
                     'M�todo de Euler',...
                     'Metodo de Euler Melhorado',...
                     'M�todo de Runge-Kutta (ordem 2)',...
                     'M�todo de Runge-Kutta (ordem 4)',...
                     'M�todo usando ODE45',...
                     'M�todo do Ponto M�dio',...
                     'Voltar');
         switch escolha
             case 0 % caso o utilizador clique na cruz
                 sair = questdlg('Tem a certeza que deseja sair?', 'Sair?', 'Sim', 'N�o', 'Sim');
                 if strcmp(sair, 'Sim')
                     auxiliar = 1;
                     return;
                 end

             case 1 % M�todo de Euler
                 disp('----------Solu��o usando o M�todo de Euler----------')
                 y = N_Euler(f, a, b, n, y0);
                 y'

             case 2 % M�todo de Euler Melhorado / M�todo de Heun
                 disp('----------Solu��o usando o M�todo de Euler Melhorado (Heun)----------')
                 y = N_Heun(f, a, b, n, y0);
                 y'

             case 3 % M�todo de Runge-Kutta de ordem 2
                 disp('----------Solu��o usando o M�todo de Runge-Kutta de ordem 2----------')
                 y = N_RK2(f, a, b, n, y0);
                 y'

             case 4 % M�todo de Runge-Kutta de ordem 4
                 disp('----------Solu��o usando o M�todo de Runge-Kutta de ordem 4----------')
                 y = N_RK4(f, a, b, n, y0);
                 y'

             case 5 % M�todo usando ODE45 do MATLab
                 disp('----------Solu��o usando a fun��o ODE45 do MATLAB----------')
                 y = N_ODE45(f, a, b, n, y0);
                 y'
                 

             case 6 % M�todo do Ponto M�dio (midpoint method)
                 disp('----------Solu��o usando o M�todo do Ponto M�dio----------')
                 y = N_PM(f, a, b, n, y0);
                 y'

             case 7 % caso o utilizador pretenda voltar atr�s
                 return;

             otherwise
                 errordlg('Op��o desconhecida', 'ERRO', 'modal');
         end
     end