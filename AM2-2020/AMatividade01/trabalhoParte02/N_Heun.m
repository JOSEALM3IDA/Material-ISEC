%NHeun  M�todo N�merico para resolver um PVI: Heun (Euler melhorado)
%   y = NHeun(f,a,b,n,y0) M�todo num�rico para a resolu��o de um PVI
%
%INPUT:
%   f - Fun��o da equa��o diferencial, em t e y
%   a - Limite esquerdo do intervalo
%   b - Limite direito do intervalo
%   n - Numero de sub-intervalos
%   y0 - Valor (condi��o) Inicial do PVI
%
%OUTPUT: 
%   y - vector das solu��es aproximadas
%
%   08/04/2020 - Carlos Pais .: a2010017171@isec.pt
%   08/04/2020 - Jos� Almeida .: a2019129077@isec.pt
%   08/04/2020 - Pedro Rodrigues .: a2019136525@isec.pt
%%

function y = N_Heun(f,a,b,n,y0)
    h = (b-a)/n;                     % Tamanho de cada subintervalo (passo)
    
    t = a:h:b;                       % Aloca��o de mem�ria - vetor das abcissas
    y = zeros(1, n+1);               % Aloca��o de mem�ria - vetor das ordenadas
    
   
    y(1) = y0;                       % O primeiro valor de y � sempre y0 (condi��o inicial do pvi)
    
    for i=1:n                        % O n�mero de itera��es vai ser igual a n
        k1 = f(t(i),y(i));           % Inclina��o no in�cio do intervalo
        k2 = f(t(i+1), y(i) + k1*h); % Inclina��o no fim do intervalo
        k = 0.5*(k1+k2);             % C�lculo da m�dia das inclina��es
        y(i+1)=y(i)+h*k;             % Pr�ximo valor aproximado da solu��o do problema original
    end
end