
#include <stdio.h>		// printf
#include <stdlib.h>		// malloc
#include <string.h>

#include "libasm.h"


/* ---- test ft_strcmp ---- */
int main(int ac, char** av)
{
    (void)ac;
    (void)av;
	// printf("\n");
	// for (int i = 1; i <= ac; i++) {
	// 	printf("av[%d] : '%s'\n", i, av[i]);
	// }

	// printf("\n\n------ {-[strlen]-} ------");
	// for (int i = 1; i < ac; i++) {
	// 	printf("\n\nav[%d] : '%s'", i, av[i]);
	// 	printf("\nft_strlen(av[%d]) : '%d'",i, ft_strlen(av[i]));
	// 	printf("\nstrlen(av[%d]) : '%lu'",i, strlen(av[i]));
	// }

	// printf("\n\n------ {-[strcmp]-} ------");
	// for (int i = 1; i < ac; i++) {
	// 	printf("\n\nav[%d] : '%s'", i, av[i]);
	// 	printf("\nft_strcmp(av[%d], 'av2') : '%d'",i, ft_strcmp(av[i], "av2"));
	// 	printf("\nstrcmp(av[%d], 'av2') : '%d'",i, strcmp(av[i], "av2"));
	// }

	// printf("\n\n------ {-[strcpy]-} ------");
	// for (int i = 1; i < ac; i++) {
	// 	char *dest = malloc(sizeof(char) * (ft_strlen(av[i]) + 1));

	// 	printf("\n\nav[%d] : '%s'", i, av[i]);
	// 	printf("\nft_strcpy(dest, av[%d]) dest: '%s'", i, ft_strcpy(dest, av[i]));
	// 	printf("\nstrcpy(dest, av[%d]) dest : '%s'", i, strcpy(dest, av[i]));
	// 	free(dest);
	// }


	// printf("\n\n------ {-[write]-} ------\n");
	// for (int i = 1; i < ac; i++) {
	// 	printf("\n\nav[%d] : '%s'\n", i, av[i]);
	// 	printf("\nreturn write : '%zd'\n", ft_write(1, av[i], ft_strlen(av[i])));
	// }

	printf("\n\n------ {-[ft_strdup]-} ------\n");
	for (int i = 1; i < ac; i++) {
		printf("\n\nav[%d] : '%s'\n", i, av[i]);
		char * ptr = ft_strdup(av[i]);
		printf("\nptr malloced from ft_strdup : '%s'\n", ptr);
		free(ptr);
	}

	// printf("\n------ {-[read]-} ------");
// 	char buff[10];
// 	ft_read(0,buff, 9);

	t_list *node = ft_list_new(42);

	printf("node p: %p\n", node);
	printf("data d: %d\n", node->data);
	printf("next p: %p\n", node->next);
	return (0);
}
