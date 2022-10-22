#include "utils.h"

uint32_t * liste_ensemble;

//Crée la liste des ensembles
void createList(){
    liste_ensemble = malloc(sizeof(uint32_t) *26);
    for (int i = 0; i < 26; i++){
        liste_ensemble[i] = 0;
    }
}

//On crée un ensemble avec un nombre
uint32_t createSet(uint32_t number){
    return 1 << number;
}

//Retourne un ensemble par son index
uint32_t getSet(int index){
    return liste_ensemble[index];
}

//Opération sur deux ensembles (0 = union, 1 = inter, 2 = diff)
uint32_t operationSet(int operation, uint32_t set1, uint32_t set2){
    switch (operation){
        case 0:
            return unionSet(set1, set2);
        case 1:
            return interSet(set1, set2);
        case 2:
            return diffSet(set1, set2);
        default:
            return 0;
    }
}

//Union de deux ensembles
uint32_t unionSet(uint32_t set1, uint32_t set2){
    return set1 | set2;
}

//Inter de deux ensembles
uint32_t interSet(uint32_t set1, uint32_t set2){
    return set1 & set2;
}

//Différence de deux ensembles
uint32_t diffSet(uint32_t set1, uint32_t set2){
    return set1 & ~set2;
}

//Complémentaire d'un ensemble
uint32_t complementSet(uint32_t set){
    return ~set;
}

//Assignation d'un ensemble dans la liste
void assign(uint32_t ensemble, int index){
    liste_ensemble[index] = ensemble;
}

//On affiche un ensemble de la liste(index passé en paramètre)
void printSet(uint32_t index){
    printf("\t{");
    for(int i = 0; i < 32; i++){
        if(liste_ensemble[index] & (1 << i)){
            printf("%d, ", i);
        }
    }
    printf("}\n\n");
}