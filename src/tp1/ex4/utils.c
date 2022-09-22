#include "utils.h"

//Identificateurs de base
char id_base[NB_ID_BASE][6] =
{ "char",
  "int",
  "float",
  "void",
  "main"
};

void raler (const char *msg){
    perror(msg);
    exit(EXIT_FAILURE);
}

/* Initialise la table des symboles 
Rempli par les identificateurs de base*/
struct _table * init_table()
{
    struct _table * table;
    CHECK(table = malloc(sizeof(struct _table)));
    table->size = 0;
    CHECK(table->symbols = malloc(0 * sizeof(char*)));

    for(int i = 0; i<NB_ID_BASE; i++)
    {
        add_symbol(table, id_base[i]);
    }

    return table;
}

/* Ajoute un symbole si il n'existe pas
Retourne l'index du symbole */
int add_symbol(struct _table *table, const char *symbole)
{
    //On cherche l'identificateur dans la table
    for(int i = 0; i < table->size; i++)
    {
        if(strcmp(table->symbols[i], symbole) == 0)
            return i;
    }

    //Si on ne l'a pas trouvé, on l'ajoute
    CHECK(table->symbols = realloc(table->symbols, (table->size + 1) * sizeof(char*)));
    char *s;
    CHECK(s = malloc(sizeof(char) * strlen(symbole)+1));
    strcpy(s, symbole);
    table->symbols[table->size] = s;
    table->size++;

    return table->size - 1;
}