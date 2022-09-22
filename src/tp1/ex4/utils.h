#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <errno.h>

#define CHECK(x) \
  do { \
    if (!(x)) { \
      fprintf(stderr, "%s:%d: ", __func__, __LINE__); \
	  if(errno==0) errno=ECANCELED; \
      perror(#x); \
      exit(EXIT_FAILURE); \
    } \
  } while (0)

#define NB_ID_BASE 5

struct _table {
    char **symbols;
    int size;
};

void raler (const char *msg);

/* Identificateurs de base du langage */
char id_base[NB_ID_BASE][6];

/* Initialise la table des symboles 
Rempli par les identificateurs de base*/
struct _table * init_table();

/* Ajoute un symbole si il n'existe pas
Retourne l'index du symbole */
int add_symbol(struct _table *table, const char *symbole);
