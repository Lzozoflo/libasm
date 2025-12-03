// printf
#include <stdio.h>
#include <string.h>




//from libasm.a
extern int ft_strlen(char *);
extern int ft_strcmp (const char *s1, const char *s2);


// /* ---- test ft_strlen ---- */
// int main(int ac, char** av)
// {
//     (void)ac;
//     printf("\nagrv : '%s'\nft_strlen : '%d'\n",av[1], ft_strlen(av[1]));
//     return (0);
// }


/* ---- test ft_strcmp ---- */
int main(int ac, char** av)
{
    (void)ac;
    printf("\nagrv : '%s'\nft_strcmp : '%d'\n",av[1], ft_strcmp(av[1], "av2"));
    printf("\nstrcmp : '%d'\n", strcmp(av[1], "av2"));
    return (0);
}
