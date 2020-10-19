%sExataSED Calcular solucao exata do SED
%   [u,v] = solucaoSEDexata(strF,strG,a,b,n,u0,v0) Solucao exata do SED que
%   inclui f e g
%   resolu��o de um SED (ordem 2)
%   u'= f(t,u,v), v'=g(t,u,v), t=[a, b], u(a)=u0 e v(a)=v0  
%
%INPUT:
%   strF,strG - fun��es do 2.� membro das Equa��es Diferenciais (em string)
%   [a, b] - extremos do intervalo da vari�vel independente t
%   n - n�mero de subintervalos ou itera��es do m�todo
%   u0, v0 - condi��es iniciais t=a -> u=u0 e v=v0
%
%OUTPUT: 
%   [u,v] - vector das solu��es exatas
%
%   04/05/2020 - Carlos Pais .: a2010017171@isec.pt
%   04/05/2020 - Jos� Almeida .: a2019129077@isec.pt
%   04/05/2020 - Pedro Rodrigues .: a2019136525@isec.pt
%%

function [u,v] = sExataSED(strF,strG,a,u0,v0)

    try
        syms u(t) v(t)

        f = subs(str2sym(strF));
        g = subs(str2sym(strG));

        cond1 = u(a)==u0;
        cond2 = v(a)==v0;
        conds = [cond1, cond2];

        ode1 = diff(u,t) == f;
        ode2 = diff(v,t) == g;
        odes = [ode1, ode2];

        [u(t), v(t)] = dsolve(odes,conds);
    catch naoLinear
        u = 0;
        v = 0;
        fprintf(1,'Identificador: %s\n',naoLinear.identifier);
        fprintf(1,'AVISO! N�o foi possivel calcular a solu��o exata. ');
        fprintf(1,'Provavelmente introduziu uma fun��o n�o-linear.\nMensagem: %s\n\n', naoLinear.message);
    end
end