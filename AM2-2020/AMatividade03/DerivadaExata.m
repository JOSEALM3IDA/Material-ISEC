% DerivadaExata Deriva��o Anal�tica
% Deriva��o Anal�tica pela fun��o diff
% 
% INPUT:  strF - fun��o f em formato string
%
% OUTPUT: h - derivada exata da fun�ao f
% 
%   25/05/2020 - Carlos Pais .: a2010017171@isec.pt
%   25/05/2020 - Jos� Almeida .: a2019129077@isec.pt
%   25/05/2020 - Pedro Rodrigues .: a2019136525@isec.pt
%%

function f = DerivadaExata(strF)

syms x                                      % cria a vari�vel simb�lica x
h = @(x) eval(vectorize(strF));

f = matlabFunction(diff(h(x)));             % Calcula, atrav�s da fun��o diff, a derivada exata