% NDerivacaoDFR Deriva��o Num�rica - F�rmula das Diferen�as Regressivas (2 pontos)
% Form�la das Diferen�as Regressivas (2 pontos)
% f'(x(i))=(f(x(i))-f(x(i-1))/h
% INPUT:  f - fun��o
%         [a, b] - intervalo de deriva��o
%         h - passo da discretiza��o
%         y - imagens x vs y
% OUTPUT: [x, y] - malha de pontos
%         dydx - derivada de f 
%
%   25/05/2020 - Carlos Pais .: a2010017171@isec.pt
%   25/05/2020 - Jos� Almeida .: a2019129077@isec.pt
%   25/05/2020 - Pedro Rodrigues .: a2019136525@isec.pt
%%

function [x,y,dydx] = NDerivacaoDFR(f,a,b,h,y)

x=a:h:b;                                % Aloca��o de mem�ria

n=length(x);                            % N�mero de pontos (tamanho do vetor de abcissas)

if nargin==4
    y=f(x);                             % y � a fun��o f(x)
end

dydx=zeros(1,n);                        % Aloca��o de mem�ria

dydx(1)=(y(2)-y(1))/h;                  % Derivada (aproximada) de f no ponto atual

for i=2:n
    dydx(i)=(y(i)-y(i-1))/h;            % Derivada (aproximada) de f no ponto atual
end
