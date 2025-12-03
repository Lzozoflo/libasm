// printf
#include <stdio.h>
#include <stdlib.h> // malloc
#include <string.h>



//from libasm.a
extern int ft_strlen(char *s);
extern int ft_strcmp(const char *s1, const char *s2);
extern char *ft_strcpy(const char *s1, const char *s2);



/* ---- test ft_strcmp ---- */
int main(int ac, char** av)
{
    (void)ac;
	printf("\n");
	for (int i = 1; i <= ac; i++) {
		printf("av[%d] : '%s'\n", i, av[i]);
	}

	printf("\n\n------ {-[strlen]-} ------");
	for (int i = 1; i < ac; i++) {
		printf("\n\nav[%d] : '%s'", i, av[i]);
		printf("\nft_strlen(av[%d]) : '%d'",i, ft_strlen(av[i]));
		printf("\nstrlen(av[%d]) : '%lu'",i, strlen(av[i]));
	}

	printf("\n\n------ {-[strcmp]-} ------");
	for (int i = 1; i < ac; i++) {
		printf("\n\nav[%d] : '%s'", i, av[i]);
		printf("\nft_strcmp(av[%d], 'av2') : '%d'",i, ft_strcmp(av[i], "av2"));
		printf("\nstrcmp(av[%d], 'av2') : '%d'",i, strcmp(av[i], "av2"));
	}

	printf("\n\n------ {-[strcpy]-} ------");
	for (int i = 1; i < ac; i++) {
		char *dest = malloc(sizeof(char) * (ft_strlen(av[i]) + 1));

		printf("\n\nav[%d] : '%s'", i, av[i]);
		// printf("\nft_strcpy(av[%d], 'av2') dest: '%s'", i, ft_strcpy(dest, av[i]));
		printf("\nstrcpy(dest, av[%d]) dest : '%s'", i, strcpy(dest, av[i]));
	}
	printf("\n\n------ {-[strcpy]-} ------");
	return (0);
}
