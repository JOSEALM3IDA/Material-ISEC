%N_RK4SED  M�todo N�merico para resolver um SED: Runge-Kutta de ordem 4
%   [t,u,v] = N_RK4SED(f,g,a,b,n,u0,v0) M�todo num�rico para a
%   resolu��o de um SED (ordem 2)
%   u'= f(t,u,v), v'=g(t,u,v), t=[a, b], u(a)=u0 e v(a)=v0  
%
%INPUT:
%   f, g - fun��es do 2.� membro das Equa��es Diferenciais
%   [a, b] - extremos do intervalo da vari�vel independente t
%   n - n�mero de subintervalos ou itera��es do m�todo
%   u0, v0 - condi��es iniciais t=a -> u=u0 e v=v0
%
%OUTPUT: 
%   [t,u,v] - vector das solu��es aproxima��es e da discretiza��o de t
%
%   04/05/2020 - Carlos Pais .: a2010017171@isec.pt
%   04/05/2020 - Jos� Almeida .: a2019129077@isec.pt
%   04/05/2020 - Pedro Rodrigues .: a2019136525@isec.pt
%%

function [t,u,v] = N_RK4SED(f,g,a,b,n,u0,v0)
    h = (b-a)/n;                                                    % Valor de cada subintervalo (passo)
    
    t = a:h:b;                                                      % Aloca��o de mem�ria
    u = zeros(1, n+1);                                              % Aloca��o de mem�ria
    v = zeros(1, n+1);                                              % Aloca��o de mem�ria
    
    u(1) = u0;                                                      % O primeiro valor de y � sempre y0
    v(1) = v0;                                                      % O primeiro valor de y � sempre y0
    
    for i=1:n                                                       % O n�mero de itera��es vai ser igual a n
        uK1 = h*f(t(i), u(i), v(i));                                % Inclina��o no in�cio do intervalo
        vK1 = h*g(t(i), u(i), v(i));                                % Inclina��o no in�cio do intervalo
        
        uK2 = h*f(t(i) + h/2, u(i) + 0.5*uK1, v(i) + 0.5*vK1);      % Inclina��o no ponto m�dio do intervalo
        vK2 = h*g(t(i) + h/2, u(i) + 0.5*uK1, v(i) + 0.5*vK1);      % Inclina��o no ponto m�dio do intervalo
        
        uK3 = h*f(t(i) + h/2, u(i) + 0.5*uK2, v(i) + 0.5* vK2);     % Inclina��o (novamente) no ponto m�dio do intervalo
        vK3 = h*g(t(i) + h/2, u(i) + 0.5*uK2, v(i) + 0.5* vK2);     % Inclina��o (novamente) no ponto m�dio do intervalo
        
        uK4 = h*f(t(i+1), u(i) + uK3, v(i) + vK3);                  % Inclina��o no final do intervalo
        vK4 = h*g(t(i+1), u(i) + uK3, v(i) + vK3);                  % Inclina��o no final do intervalo
        
        uK = (uK1 + 2*uK2 + 2*uK3 + uK4)/6;                         % C�lculo da m�dia ponderada das inclina��es
        vK = (vK1 + 2*vK2 + 2*vK3 + vK4)/6;                         % C�lculo da m�dia ponderada das inclina��es
        
        u(i + 1) = u(i) + uK;                                       % Aproxima��o do m�todo de RK4 para a i�sima itera��o
        v(i + 1) = v(i) + vK;                                       % Aproxima��o do m�todo de RK4 para a i�sima itera��o
    end
end
