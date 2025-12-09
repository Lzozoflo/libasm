
#ifndef LIBASM_H
#define LIBASM_H

typedef struct s_list
{
	char			*data;		// 8
	struct s_list	*next;		// 8
} t_list;


//from libasm.a

extern int		ft_strlen	(char *s);											// Mandatory
extern char		*ft_strcpy	(const char *s1, const char *s2);					// Mandatory
extern int		ft_strcmp	(const char *s1, const char *s2);					// Mandatory
extern ssize_t	ft_write	(int fd, const void *buf, size_t count);			// Mandatory
extern ssize_t	ft_read		(int fd, void *buf, size_t count);					// Mandatory
extern char		*ft_strdup	(const char *str);									// Mandatory


extern void		ft_list_push_front(t_list **begin_list, void *data);			// Bonus
extern int		ft_list_size(t_list *begin_list);								// Bonus
extern void		ft_list_sort(t_list **begin_list, int (*cmp)());				// Bonus
extern void		ft_list_remove_if(t_list **begin_list, void *data_ref, int (*cmp)(), void (*free_fct)(void *));	// Bonus


extern void		ft_list_clear(t_list *begin_list);								// my bonus
extern void		*ft_list_new(char *value); 										// my bonus

#endif
