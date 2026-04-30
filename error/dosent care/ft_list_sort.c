
typedef struct s_list
{
	char			*data;		// 8
	struct s_list	*next;		// 8
} t_list;


int ft_strcmp(const char *str1, const char *str2) {

	int i = 0;
	while (str1[i] || str2[i])
	{
		if (str1[i] != str2[i])
			return ((unsigned char)str1[i] - (unsigned char)str2[i]);
		i++;
	}
	return (0);
}

void ft_list_sort(t_list **begin_list, int (*cmp)()){

	t_list **prev;
	t_list *tmp;
	int size = 3;


	while (size--){

		prev = begin_lis
		tmp = *begin_list;
		while (condition)
		{

			if (tmp->data > tmp->next->data)
			//swap
		}


	}
}


int main(int ac, char**av) {
	int i = 1;
	int j = 1;



	while(j + 1 < ac) {
		i = 1;
		while (i + 1 < ac)
		{
			if (ft_strcmp(av[i], av[i + 1]) > 0){
				void *ptr = av[i];
				av[i] = av[i + 1];
				av[i + 1] = ptr;
			}
			i++;
		}
		j++;
	}
		i = 1;
		while (i < ac){
			printf("[%d]: '%s'\n", i , av[i]);
			i++;
		}
	return 1;
}
