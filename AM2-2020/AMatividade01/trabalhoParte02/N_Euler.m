%NEULER_v2  M�todo N�merico para resolver um PVI: Euler (com memory alloc)
%   y = NEuler(f,a,b,n,y0) M�todo num�rico para a resolu��o de um PVI 
%
%INPUT:
%   f - Fun��o da equa��o diferencial, em t e y
%   a - Limite esquerdo do intervalo
%   b - Limite direito do intervalo
%   n - Numero de sub-intervalos
%   y0 - Valor (condi��o) Inicial do PVI
%
%OUTPUT: 
%   y - vetor das solu��es aproxima��es
%
%   03/03/2020 - Arm�nioCorreia .: armenioc@isec.pt 
%   07/04/2020 - Carlos Pais .: a2010017171@isec.pt
%   07/04/2020 - Jos� Almeida .: a2019129077@isec.pt
%   07/04/2020 - Pedro Rodrigues .: a2019136525@isec.pt
%%

function y = N_Euler(f,a,b,n,y0)
    h = (b-a)/n;                        % Tamanho de cada subintervalo (passo)
	
    t = a:h:b;                          % Aloca��o de mem�ria - vetor das abcissas
    y = zeros(1, n+1);                  % Aloca��o de mem�ria - vetor das ordenadas
	
    y(1) = y0;                          % O primeiro valor de y � sempre y0 (condi��o inicial do pvi)
    
    for i=1:n                           % O n�mero de itera��es vai ser igual a n
        y(i+1)=y(i)+h*f(t(i),y(i));     % Aproxima��o do m�todo de Euler para a i�sima itera��o
    end
end
