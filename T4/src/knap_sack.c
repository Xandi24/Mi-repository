#include "knap_sack.h"
#include "heap_sort.h"

////////Definição da struct de um dado/////////////////////////////////////////////////////////
typedef struct type_data{
    int weight;
    int val;
}data;
///////////////////////////////////////////////////////////////////////////////////////////////


///////Definição de funções principais/////////////////////////////////////////////////////////
data* KNPS_dinamic(int P, int Q, data* array){
    int s;
    int memory[Q+1][P+1];

    for(int i=0; i<(Q+1); i++){

        for(int j=0; j<(P+1); j++){
            
            s = j - array[i-1].weight;
            if(i == 0) memory[i][j]=0;
            else if(s < 0) memory[i][j]=memory[i-1][j];
            else if(s >= 0){
                memory[i][j] = (array[i-1].val) + (memory[i-1][s]);
            }
        }
    }

    int aux[Q];
    int cont=0;
    
    int k=P;
    for(int l=Q; l>0; l--){

        if(memory[l][k]!=memory[l-1][k]){
            aux[l-1]=1;
            k-=array[l-1].weight;
            cont++;
        }

        else aux[l-1]=0;
    }

    data* itens=(data*)calloc(cont,sizeof(data));
    for(int i=Q; i>0; i--){

        if(aux[i-1]==1){
            itens[cont]=array[i-1];
            cont--;
        }
    }
    return itens;
}

data* KNPS_greedy(int P, int Q, data* array){
    
    data* order_array =(data*)calloc(Q,sizeof(data));
    for(int i=0;i<Q;i++){
        order_array[i]=array[i];
    }
    heap_sort(order_array,Q);
    
    int j=Q-1;
    int cont=0;
    while( P >= order_array[j].weight){
        P-=order_array[j].weight;
        cont++;
        j--;
    }

    data* itens = (data*)calloc(cont,sizeof(data));

    for(int k=j+1; k<Q; k++){
        itens[k]=order_array[k];
    }

    return itens;
}