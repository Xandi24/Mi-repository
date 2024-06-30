#ifndef KNAP_SACK_H
#define KNAP_SACK_H

//Includes
#include "aux.h"

////////Declaração de funções principais///////////////////////////////////////////////////////
/*
Entradas
    *   P: peso total suportado pela mochila
    *   Q: quantidade de itens que serão informados na array
    *   Array: vetor de dados de itens
Saida
    *   Vetor de dados (itens) que correspondem ao valor máximo que pode ser levado na mochila
*/
data* KNPS_dinamic(int P, int Q, data* array); //versão que usa programação dinâmica
data* KNPS_greedy(int P, int Q, data* array); //versão que usa algoritmo guloso





























#endif 