#include "symtab.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

list_t *head = NULL;
extern int lineno;

void insert(char* name, int type)
{
    if (search(name) == NULL)
    {
        list_t* temp = (list_t*)malloc(sizeof(list_t));
        strcpy(temp->st_name, name);
        temp->st_type = type;
        temp->array_len = 0;
        printf("In line no %d, Inserting %s with type %s in symbol table.\n", lineno, name, typename[type]);
        temp->next = head;
        head = temp;
    }
    else
    {
        printf("In line no %d, Same variable %s is declared more than once.\n", lineno, name);
    }
}

void insert_array(char* name, int type, int length)
{
    if (search(name) == NULL)
    {
        list_t* temp = (list_t*)malloc(sizeof(list_t));
        strcpy(temp->st_name, name);
        temp->st_type = type;
        temp->array_len = length;
        printf("In line no %d, Inserting %s as array[%d] with base type %s in symbol table.\n", lineno, name, length, typename[type]);
        temp->next = head;
        head = temp;
    }
    else
    {
        printf("In line no %d, Same variable %s is declared more than once.\n", lineno, name);
    }
}

list_t* search(char *name)
{
    list_t* current = head;
    while (current != NULL)
    {
        if (strcmp(name, current->st_name) == 0)
            return current;
        current = current->next;
    }
    return NULL;
}

int idcheck(char* name)
{
    if (search(name) == NULL)
    {
        printf("In line no %d, ID %s is not declared.\n", lineno, name);
        return 0;
    }
    else
    {
        return 1;
    }
}

int gettype(char *name)
{
    list_t* temp = search(name);
    if (temp == NULL)
    {
        printf("In line no %d, ID %s is not declared.\n", lineno, name);
        return UNDEF_TYPE;
    }
    else
        return temp->st_type;
}

int get_array_len(char *name)
{
    list_t* temp = search(name);
    if (temp == NULL)
    {
        printf("In line no %d, ID %s is not declared.\n", lineno, name);
        return 0;
    }
    return temp->array_len;
}

int typecheck(int type1, int type2)
{
    if (type1 > 3 || type1 < 0) type1 = UNDEF_TYPE;
    if (type2 > 3 || type2 < 0) type2 = UNDEF_TYPE;

    if (type1 == type2)
        return type1;

    if ((type1 == INT_TYPE && type2 == REAL_TYPE) || (type1 == REAL_TYPE && type2 == INT_TYPE))
        return REAL_TYPE;

    printf("In line no %d, Data type %s is not matched with Data type %s.\n", lineno, typename[type1], typename[type2]);
    return UNDEF_TYPE;
}
