#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>

//Crée la liste des ensembles
void createList();

//On crée un ensemble avec un nombre
uint32_t createSet(uint32_t number);

//Retourne un ensemble par son index
uint32_t getSet(int index);

//Opération sur deux ensembles (0 = union, 1 = inter, 2 = diff)
uint32_t operationSet(int operation, uint32_t set1, uint32_t set2);

//Union de deux ensembles
uint32_t unionSet(uint32_t set1, uint32_t set2);

//Inter de deux ensembles
uint32_t interSet(uint32_t set1, uint32_t set2);

//Différence de deux ensembles
uint32_t diffSet(uint32_t set1, uint32_t set2);

//Complémentaire d'un ensemble
uint32_t complementSet(uint32_t set);

//Assignation d'un ensemble dans la liste
void assign(uint32_t ensemble, int index);

//On affiche un ensemble de la liste(index passé en paramètre)
void printSet(uint32_t index);