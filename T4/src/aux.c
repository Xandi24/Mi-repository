#include "aux.h"

////////Definição da struct de um dado/////////////////////////////////////////////////////////
typedef struct type_data{
    int weight;
    int val;
}data;

////////Definição de funções auxiliares////////////////////////////////////////////////////////

//  Função que retorna relação valor-peso de um dado
int return_rel(data D){
    return((int)PRECISION*(D.val/D.weight));
}

/*
Função booleana que retorna se um dado A é maior que um dado B tendo como prioridade:
    *   Primeiro lugar: Relação entre valor e peso do item (com precisão de duas casas decimais após a vírgula).
    *   Segundo lugar: Item de menor peso caso tenham o mesmo valor de relação.
*/
bool bigger_than(data A, data B){
    if(return_rel(A)!=return_rel(B)){
        return (return_rel(A)>return_rel(B));
    }
    else{
        return(A.weight<B.weight);
    }
}
