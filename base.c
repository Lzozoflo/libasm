int	ft_size_base(char *base)
{
	int	i = 0;
	while (base[i]){
		i++;
	}
	return (i);
}

int	get_nb(char c, char *base)
{
	int	i = 0;
	while (base[i] && base[i] != c)
		i++;
	return (i);
}

int   ft_atoi_base(char *str, char *base) {

    int i = 0;
    int res = 0;
    int neg = 1;

    // if (
    // !checkDoubleBase() &&
    // base_only_in_str(base, str)
    //      ){
    //     return -1
    // }


    int lenBase = ft_size_base(base);


    while (str[i] && (str[i] == '+' || str[i] == '-'))
    {
        if (str[i] == '-')
            neg = -neg;
        else
            neg = 1;
        i++;
    }
    

	while (str[i])                          //  .loop_cal_base
	{
        int tmp = get_nb(str[i], base);     //  tmp = len(c = base[i])
		res = (res * lenBase) + tmp;        //  MUL res, lenbase / add res, tmp
        i++;                                //  inc i
	}                                       //  jmp .loop_cal_base
	return (res * neg);
}

int main(int argc, char const *argv[])
{                                   //0123456789
    printf("%d", ft_atoi_base("+bcd", "abcdefghij"));


	char *tmp = "abcdefghij";
    printf("base ok: %d\n", ft_atoi_base("-bdca", tmp)); 		// ok
	printf("base ok: %d\n", ft_atoi_base("+-bcdef", tmp)); 	// ok
    printf("base ok: %d\n", ft_atoi_base("+--cdef", tmp)); 	// ok
    printf("base error: %d\n", ft_atoi_base("+-abcdef", tmp));	// error
    printf("base error: %d\n", ft_atoi_base("+-acdef", tmp));	// error
    printf("base: %d\n", ft_atoi_base("+-dabcdef", tmp));
    return 0;
}
