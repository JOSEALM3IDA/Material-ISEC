#include <stdio.h>

void main()
{
    float nota1,nota2,media; //Declara��o das vari�veis

    printf("Indique a nota do teste 1:");
    scanf("%f",&nota1); //Especifica��o de formato (%f) em percentagem; Endere�o de mem�ria (&), que seria nota1
    printf("Indique a nota do teste 2:");
    scanf("%f",&nota2);

    media=(nota1+nota2)/2;

    printf("Media = %.2f\n",media);
}
