#define _CRT_SECURE_NO_WARNINGS 1
#include <stdio.h>
#include <stdlib.h>
#include "algoritmo.h"
#include "utils.h"

// Preenche uma estrutura com os progenitores da próxima geração, de acordo com o resultados do torneio binario (tamanho de torneio: 2)
// Parâmetros de entrada: população actual (pop), estrutura com parâmetros (d) e população de pais a encher
void tournament(pchrom pop, struct info d, pchrom parents) {
	int i, x1, x2;

	// Realiza popsize torneios
	for (i = 0; i < d.popsize; i++) {
		x1 = random_l_h(0, d.popsize-1);
		do
			x2 = random_l_h(0, d.popsize-1);
		while (x1 == x2);
		if (pop[x1].fitness > pop[x2].fitness)		// Problema de maximizacao
			parents[i] = pop[x1];
		else
			parents[i] = pop[x2];
	}
}

// Operadores geneticos a usar na geração dos filhos
// Parâmetros de entrada: estrutura com os pais (parents), estrutura com parâmetros (d), estrutura que guardará os descendentes (offspring)
void genetic_operators(pchrom parents, struct info d, pchrom offspring, int mat[][2]) {
    // Recombinação com um ponto de corte
	crossover(parents, d, offspring);
	// Mutação binária
	mutation(offspring, d, mat);
}

// Preenche o vector descendentes com o resultado das operaçães de recombinação
// Parâmetros de entrada: estrutura com os pais (parents), estrutura com parâmetros (d), estrutura que guardará os descendentes (offspring)
void crossover(pchrom parents, struct info d, pchrom offspring) {
	int i, j, point;

	for (i = 0; i < d.popsize; i += 2) {
		if (rand_01() < d.pr) {
			point = random_l_h(0, d.numGenes-1);
			for (j = 0; j < point; j++) {
				offspring[i].p[j] = parents[i].p[j];
				offspring[i + 1].p[j] = parents[i + 1].p[j];
			}
			for (j = point; j < d.numGenes; j++) {
				offspring[i].p[j] = parents[i + 1].p[j];
				offspring[i + 1].p[j] = parents[i].p[j];
			}
		} else {
			offspring[i] = parents[i];
			offspring[i + 1] = parents[i + 1];
		}
	}
}

// Mutação binária com vários pontos de mutação
// Parâmetros de entrada: estrutura com os descendentes (offspring), estrutura com parâmetros (d) e matriz com dados do problema (mat)
void mutation(pchrom offspring, struct info d, int mat[][2]) {
	int i, j;
	int best_ratio_index, worst_ratio_index;

	for (i = 0; i < d.popsize; i++) {
		if (rand_01() < d.pm) {
		best_ratio_index = worst_ratio_index = -1;
		// 50% de hipoteses de adicionar o objeto de maior racio à mochila
			if (rand_01() < 0.5) {
				for (j = 0; j < d.numGenes; j++)
					if (offspring[i].p[j] == 0 && (best_ratio_index == -1 || mat[j][1] / (float)mat[j][0] > mat[best_ratio_index][1] / (float)mat[best_ratio_index][0]))
						best_ratio_index = j;
				
				offspring[i].p[best_ratio_index] = 1;
			} else { // restante chance para remover o objeto com menor racio da mochila
				for (j = 0; j < d.numGenes; j++)
					if (offspring[i].p[j] == 1 && (worst_ratio_index == -1 || mat[j][1] / (float)mat[j][0] < mat[worst_ratio_index][1] / (float)mat[worst_ratio_index][0]))
						worst_ratio_index = j;
			
				offspring[i].p[worst_ratio_index] = 0;
			}
		}
	}
}
