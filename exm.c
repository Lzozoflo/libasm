





int main(int ac, char **av){
	(void)ac;

	int i = 0, j = 0;
	while (av[1][i]) {
		j = i + 1;
		while(av[1][j]) {
			if (av[1][i] == av[1][j])
				return 1;
			j++;
		}
		i++;
	}
	return 0;
}
