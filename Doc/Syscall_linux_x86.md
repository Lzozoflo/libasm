
# Syscall x86 Linux ASM

[Extracted from W3Challs Syscalls](https://syscalls.w3challs.com/?arch=x86_64)



| # | Retour value | 1er Arg. | 2e Arg. | 3e Arg. | 4e Arg. | 5e Arg. | 6e Arg. | Callee-Saved | 
|:----: | :----: |:----: | :-----: | :-----: | :-----: | :-----: | :-----: | :-----:  | 
| 64bit | rax | rdi | rsi | rdx | rcx | r8 | r9 | rbx - rbp | 
| 32bit | eax | edi | esi | edx | ecx | - | - | ebx - ebp | 
| 16bit | ax | di | si | dx | cx | - | - | bx - bp | 
| 8bit | al | dil | sil | dl | cl | - | - | bl - bpl | 


 
|# (Décimal) | # (Hexadécimal) | Name | RDI (Arg 1) | RSI (Arg 2) | RDX (Arg 3) | R10 (Arg 4) | R8 (Arg 5) | R9 (Arg 6) |
|:----: | :----: |:----: | :----- | :----- | :----- | :----- | :----- | :-----  |
|0 | 0x00 | read | unsigned int fd | char *buf | size_t count | - | - | - |
|1 | 0x01 | write | unsigned int fd | const char *buf | size_t count | - | - | - |
|2 | 0x02 | open | const char *filename | int flags | umode_t mode | - | - | - |
|3 | 0x03 | close | unsigned int fd | - | - | - | - | - |
|4 | 0x04 | stat | const char *filename | struct __old_kernel_stat *statbuf | - | - | - | - |
|5 | 0x05 | fstat | unsigned int fd | struct __old_kernel_stat *statbuf | - | - | - | - |
|6 | 0x06 | lstat | const char *filename | struct __old_kernel_stat *statbuf | - | - | - | - |
|7 | 0x07 | poll | struct pollfd *ufds | unsigned int nfds | int timeout_msecs | - | - | - |
|8 | 0x08 | lseek | unsigned int fd | off_t offset | unsigned int origin | - | - | - |
|9 | 0x09 | mmap | unsigned long addr | unsigned long len | unsigned long prot | unsigned long flags | unsigned long fd | unsigned long off |
|10 | 0x0a | mprotect | unsigned long start | size_t len | unsigned long prot | - | - | - |
|11 | 0x0b | munmap | unsigned long addr | size_t len | - | - | - | - |
|12 | 0x0c | brk | unsigned long brk | - | - | - | - | - |
|13 | 0x0d | rt_sigaction | int sig | const struct sigaction *act | struct sigaction *oact | size_t sigsetsize | - | - |
|14 | 0x0e | rt_sigprocmask | int how | sigset_t *nset | sigset_t *oset | size_t sigsetsize | - | - |
|15 | 0x0f | rt_sigreturn | - | - | - | - | - | - |
|16 | 0x10 | ioctl | unsigned int fd | unsigned int cmd | unsigned long arg | - | - | - |
|17 | 0x11 | pread64 | char *buf size_t count | loff_t pos | - | - | - | - |
|18 | 0x12 | pwrite64 | const char *buf size_t count | loff_t pos | - | - | - | - |
|19 | 0x13 | readv | unsigned long fd | const struct iovec *vec | unsigned long vlen | - | - | - |
|20 | 0x14 | writev | unsigned long fd | const struct iovec *vec | unsigned long vlen | - | - | - |
|21 | 0x15 | access | const char *filename | int mode | - | - | - | - |
|22 | 0x16 | pipe | int *fildes | - | - | - | - | - |
|23 | 0x17 | select | int n | fd_set *inp | fd_set *outp | fd_set *exp | struct timeval *tvp | - |
|24 | 0x18 | sched_yield | - | - | - | - | - | - |
|25 | 0x19 | mremap | unsigned long addr | unsigned long old_len | unsigned long new_len | unsigned long flags | unsigned long new_addr | - |
|26 | 0x1a | msync | unsigned long start | size_t len | int flags | - | - | - |
|27 | 0x1b | mincore | unsigned long start | size_t len | unsigned char *vec | - | - | - |
|28 | 0x1c | madvise | unsigned long start | size_t len_in | int behavior | - | - | - |
|29 | 0x1d | shmget | key_t key | size_t size | int shmflg | - | - | - |
|30 | 0x1e | shmat | int shmid | char *shmaddr | int shmflg | - | - | - |
|31 | 0x1f | shmctl | int shmid | int cmd | struct shmid_ds *buf | - | - | - |
|32 | 0x20 | dup | unsigned int fildes | - | - | - | - | - |
|33 | 0x21 | dup2 | unsigned int oldfd | unsigned int newfd | - | - | - | - |
|34 | 0x22 | pause | - | - | - | - | - | - |
|35 | 0x23 | nanosleep | struct timespec *rqtp | struct timespec *rmtp | - | - | - | - |
|36 | 0x24 | getitimer | int which | struct itimerval *value | - | - | - | - |
|37 | 0x25 | alarm | unsigned int seconds | - | - | - | - | - |
|38 | 0x26 | setitimer | int which | struct itimerval *value | struct itimerval *ovalue | - | - | - |
|39 | 0x27 | getpid | - | - | - | - | - | - |
|40 | 0x28 | sendfile | int out_fd | int in_fd | off_t *offset | size_t count | - | - |
|41 | 0x29 | socket | int family | int type | int protocol | - | - | - |
|42 | 0x2a | connect | int fd | struct sockaddr *uservaddr | int addrlen | - | - | - |
|43 | 0x2b | accept | int fd | struct sockaddr *upeer_sockaddr | int *upeer_addrlen | - | - | - |
|44 | 0x2c | sendto | int fd | void *buff | size_t len | unsigned int flags | struct sockaddr *addr | int addr_len |
|45 | 0x2d | recvfrom | int fd | void *ubuf | size_t size | unsigned int flags | struct sockaddr *addr | int *addr_len |
|46 | 0x2e | sendmsg | int fd | struct msghdr *msg | unsigned int flags | - | - | - |
|47 | 0x2f | recvmsg | int fd | struct msghdr *msg | unsigned int flags | - | - | - |
|48 | 0x30 | shutdown | int fd | int how | - | - | - | - |
|49 | 0x31 | bind | int fd | struct sockaddr *umyaddr | int addrlen | - | - | - |
|50 | 0x32 | listen | int fd | int backlog | - | - | - | - |
|51 | 0x33 | getsockname | int fd | struct sockaddr *usockaddr | int *usockaddr_len | - | - | - |
|52 | 0x34 | getpeername | int fd | struct sockaddr *usockaddr | int *usockaddr_len | - | - | - |
|53 | 0x35 | socketpair | int family | int type | int protocol | int *usockvec | - | - |
|54 | 0x36 | setsockopt | int fd | int level | int optname | char *optval | int optlen | - |
|55 | 0x37 | getsockopt | int fd | int level | int optname | char *optval | int *optlen | - |
|56 | 0x38 | clone | unsigned long clone_flags | unsigned long newsp | void *parent_tid | void *child_tid | - | - |
|57 | 0x39 | fork | - | - | - | - | - | - |
|58 | 0x3a | vfork | - | - | - | - | - | - |
|59 | 0x3b | execve | const char *name | const char *const *argv | const char *const *envp | - | - | - |
|60 | 0x3c | exit | int error_code | - | - | - | - | - |
|61 | 0x3d | wait4 | pid_t upid | int *stat_addr | int options | struct rusage *ru | - | - |
|62 | 0x3e | kill | pid_t pid | int sig | - | - | - | - |
|63 | 0x3f | uname | struct old_utsname *name | - | - | - | - | - |
|64 | 0x40 | semget | key_t key | int nsems | int semflg | - | - | - |
|65 | 0x41 | semop | int semid | struct sembuf *tsops | unsigned nsops | - | - | - |
|66 | 0x42 | semctl | int semnum int cmd | union semun arg | - | - | - | - |
|67 | 0x43 | shmdt | char *shmaddr | - | - | - | - | - |
|68 | 0x44 | msgget | key_t key | int msgflg | - | - | - | - |
|69 | 0x45 | msgsnd | int msqid | struct msgbuf *msgp | size_t msgsz | int msgflg | - | - |
|70 | 0x46 | msgrcv | int msqid | struct msgbuf *msgp | size_t msgsz | long msgtyp | int msgflg | - |
|71 | 0x47 | msgctl | int msqid | int cmd | struct msqid_ds *buf | - | - | - |
|72 | 0x48 | fcntl | unsigned int fd | unsigned int cmd | unsigned long arg | - | - | - |
|73 | 0x49 | flock | unsigned int fd | unsigned int cmd | - | - | - | - |
|74 | 0x4a | fsync | unsigned int fd | - | - | - | - | - |
|75 | 0x4b | fdatasync | unsigned int fd | - | - | - | - | - |
|76 | 0x4c | truncate | const char *path | long length | - | - | - | - |
|77 | 0x4d | ftruncate | unsigned int fd | unsigned long length | - | - | - | - |
|78 | 0x4e | getdents | unsigned int fd | struct linux_dirent *dirent | unsigned int count | - | - | - |
|79 | 0x4f | getcwd | char *buf | unsigned long size | - | - | - | - |
|80 | 0x50 | chdir | const char *filename | - | - | - | - | - |
|81 | 0x51 | fchdir | unsigned int fd | - | - | - | - | - |
|82 | 0x52 | rename | const char *oldname | const char *newname | - | - | - | - |
|83 | 0x53 | mkdir | const char *pathname | umode_t mode | - | - | - | - |
|84 | 0x54 | rmdir | const char *pathname | - | - | - | - | - |
|85 | 0x55 | creat | const char *pathname | umode_t mode | - | - | - | - |
|86 | 0x56 | link | const char *oldname | const char *newname | - | - | - | - |
|87 | 0x57 | unlink | const char *pathname | - | - | - | - | - |
|88 | 0x58 | symlink | const char *oldname | const char *newname | - | - | - | - |
|89 | 0x59 | readlink | const char *path | char *buf | int bufsiz | - | - | - |
|90 | 0x5a | chmod | const char *filename | umode_t mode | - | - | - | - |
|91 | 0x5b | fchmod | unsigned int fd | umode_t mode | - | - | - | - |
|92 | 0x5c | chown | const char *filename | uid_t user | gid_t group | - | - | - |
|93 | 0x5d | fchown | unsigned int fd | uid_t user | gid_t group | - | - | - |
|94 | 0x5e | lchown | const char *filename | uid_t user | gid_t group | - | - | - |
|95 | 0x5f | umask | int mask | - | - | - | - | - |
|96 | 0x60 | gettimeofday | struct timeval *tv | struct timezone *tz | - | - | - | - |
|97 | 0x61 | getrlimit | unsigned int resource | struct rlimit *rlim | - | - | - | - |
|98 | 0x62 | getrusage | int which | struct rusage *ru | - | - | - | - |
|99 | 0x63 | sysinfo | struct sysinfo *info | - | - | - | - | - |
|100 | 0x64 | times | struct tms *tbuf | - | - | - | - | - |
|101 | 0x65 | ptrace | long request | long pid | unsigned long addr | unsigned long data | - | - |
|102 | 0x66 | getuid | - | - | - | - | - | - |
|103 | 0x67 | syslog | int type | char *buf | int len | - | - | - |
|104 | 0x68 | getgid | - | - | - | - | - | - |
|105 | 0x69 | setuid | uid_t uid | - | - | - | - | - |
|106 | 0x6a | setgid | gid_t gid | - | - | - | - | - |
|107 | 0x6b | geteuid | - | - | - | - | - | - |
|108 | 0x6c | getegid | - | - | - | - | - | - |
|109 | 0x6d | setpgid | pid_t pid | pid_t pgid | - | - | - | - |
|110 | 0x6e | getppid | - | - | - | - | - | - |
|111 | 0x6f | getpgrp | - | - | - | - | - | - |
|112 | 0x70 | setsid | - | - | - | - | - | - |
|113 | 0x71 | setreuid | uid_t ruid | uid_t euid | - | - | - | - |
|114 | 0x72 | setregid | gid_t rgid | gid_t egid | - | - | - | - |
|115 | 0x73 | getgroups | int gidsetsiz | gid_t *grouplist | - | - | - | - |
|116 | 0x74 | setgroups | int gidsetsiz | gid_t *grouplist | - | - | - | - |
|117 | 0x75 | setresuid | uid_t ruid | uid_t euid | uid_t suid | - | - | - |
|118 | 0x76 | getresuid | uid_t *ruidp | uid_t *euidp | uid_t *suidp | - | - | - |
|119 | 0x77 | setresgid | gid_t rgid | gid_t egid | gid_t sgid | - | - | - |
|120 | 0x78 | getresgid | gid_t *rgidp | gid_t *egidp | gid_t *sgidp | - | - | - |
|121 | 0x79 | getpgid | pid_t pid | - | - | - | - | - |
|122 | 0x7a | setfsuid | uid_t uid | - | - | - | - | - |
|123 | 0x7b | setfsgid | gid_t gid | - | - | - | - | - |
|124 | 0x7c | getsid | pid_t pid | - | - | - | - | - |
|125 | 0x7d | capget | cap_user_header_t header | cap_user_data_t dataptr | - | - | - | - |
|126 | 0x7e | capset | cap_user_header_t header | const cap_user_data_t data | - | - | - | - |
|127 | 0x7f | rt_sigpending | sigset_t *set | size_t sigsetsize | - | - | - | - |
|128 | 0x80 | rt_sigtimedwait | const sigset_t *uthese | siginfo_t *uinfo | const struct timespec *uts | size_t sigsetsize | - | - |
|129 | 0x81 | rt_sigqueueinfo | pid_t pid | int sig | siginfo_t *uinfo | - | - | - |
|130 | 0x82 | rt_sigsuspend | sigset_t *unewset | size_t sigsetsize | - | - | - | - |
|131 | 0x83 | sigaltstack | const stack_t *uss | stack_t *uoss | - | - | - | - |
|132 | 0x84 | utime | char *filename | struct utimbuf *times | - | - | - | - |
|133 | 0x85 | mknod | const char *filename | umode_t mode | unsigned dev | - | - | - |
|135 | 0x87 | personality | unsigned int personality | - | - | - | - | - |
|136 | 0x88 | ustat | unsigned dev | struct ustat *ubuf | - | - | - | - |
|137 | 0x89 | statfs | const char *pathname | struct statfs *buf | - | - | - | - |
|138 | 0x8a | fstatfs | unsigned int fd | struct statfs *buf | - | - | - | - |
|139 | 0x8b | sysfs | int option | unsigned long arg1 | unsigned long arg2 | - | - | - |
|140 | 0x8c | getpriority | int which | int who | - | - | - | - |
|141 | 0x8d | setpriority | int which | int who | int niceval | - | - | - |
|142 | 0x8e | sched_setparam | pid_t pid | struct sched_param *param | - | - | - | - |
|143 | 0x8f | sched_getparam | pid_t pid | struct sched_param *param | - | - | - | - |
|144 | 0x90 | sched_setscheduler | pid_t pid | int policy | struct sched_param *param | - | - | - |
|145 | 0x91 | sched_getscheduler | pid_t pid | - | - | - | - | - |
|146 | 0x92 | sched_get_priority_max | int policy | - | - | - | - | - |
|147 | 0x93 | sched_get_priority_min | int policy | - | - | - | - | - |
|148 | 0x94 | sched_rr_get_interval | pid_t pid | struct timespec *interval | - | - | - | - |
|149 | 0x95 | mlock | unsigned long start | size_t len | - | - | - | - |
|150 | 0x96 | munlock | unsigned long start | size_t len | - | - | - | - |
|151 | 0x97 | mlockall | int flags | - | - | - | - | - |
|152 | 0x98 | munlockall | - | - | - | - | - | - |
|153 | 0x99 | vhangup | - | - | - | - | - | - |
|154 | 0x9a | modify_ldt | int func | void *ptr | unsigned long bytecount | - | - | - |
|155 | 0x9b | pivot_root | const char *new_root | const char *put_old | - | - | - | - |
|156 | 0x9c | _sysctl | struct __sysctl_args *args | - | - | - | - | - |
|157 | 0x9d | prctl | int option | unsigned long arg2 | unsigned long arg3 | unsigned long arg4 | unsigned long arg5 | - |
|158 | 0x9e | arch_prctl | int code | unsigned long addr | - | - | - | - |
|159 | 0x9f | adjtimex | struct timex *txc_p | - | - | - | - | - |
|160 | 0xa0 | setrlimit | unsigned int resource | struct rlimit *rlim | - | - | - | - |
|161 | 0xa1 | chroot | const char *filename | - | - | - | - | - |
|162 | 0xa2 | sync | - | - | - | - | - | - |
|163 | 0xa3 | acct | const char *name | - | - | - | - | - |
|164 | 0xa4 | settimeofday | struct timeval *tv | struct timezone *tz | - | - | - | - |
|165 | 0xa5 | mount | char *dev_name | char *dir_name | char *type | unsigned long flags | void *data | - |
|166 | 0xa6 | umount2 | char *name | int flags | - | - | - | - |
|167 | 0xa7 | swapon | const char *specialfile | int swap_flags | - | - | - | - |
|168 | 0xa8 | swapoff | const char *specialfile | - | - | - | - | - |
|169 | 0xa9 | reboot | int magic1 | int magic2 | unsigned int cmd | void *arg | - | - |
|170 | 0xaa | sethostname | char *name | int len | - | - | - | - |
|171 | 0xab | setdomainname | char *name | int len | - | - | - | - |
|172 | 0xac | iopl | unsigned int level | - | - | - | - | - |
|173 | 0xad | ioperm | unsigned long from | unsigned long num | int turn_on | - | - | - |
|175 | 0xaf | init_module | void *umod | unsigned long len | const char *uargs | - | - | - |
|176 | 0xb0 | delete_module | const char *name_user | unsigned int flags | - | - | - | - |
|179 | 0xb3 | quotactl | unsigned int cmd | const char *special | qid_t id | void *addr | - | - |
|186 | 0xba | gettid | - | - | - | - | - | - |
|187 | 0xbb | readahead | loff_t offset | size_t count | - | - | - | - |
|188 | 0xbc | setxattr | const char *pathname | const char *name | const void *value | size_t size | int flags | - |
|189 | 0xbd | lsetxattr | const char *pathname | const char *name | const void *value | size_t size | int flags | - |
|190 | 0xbe | fsetxattr | int fd | const char *name | const void *value | size_t size | int flags | - |
|191 | 0xbf | getxattr | const char *pathname | const char *name | void *value | size_t size | - | - |
|192 | 0xc0 | lgetxattr | const char *pathname | const char *name | void *value | size_t size | - | - |
|193 | 0xc1 | fgetxattr | int fd | const char *name | void *value | size_t size | - | - |
|194 | 0xc2 | listxattr | const char *pathname | char *list | size_t size | - | - | - |
|195 | 0xc3 | llistxattr | const char *pathname | char *list | size_t size | - | - | - |
|196 | 0xc4 | flistxattr | int fd | char *list | size_t size | - | - | - |
|197 | 0xc5 | removexattr | const char *pathname | const char *name | - | - | - | - |
|198 | 0xc6 | lremovexattr | const char *pathname | const char *name | - | - | - | - |
|199 | 0xc7 | fremovexattr | int fd | const char *name | - | - | - | - |
|200 | 0xc8 | tkill | pid_t pid | int sig | - | - | - | - |
|201 | 0xc9 | time | time_t *tloc | - | - | - | - | - |
|202 | 0xca | futex | u32 *uaddr | int op | u32 val | struct timespec *utime | u32 *uaddr2 | u32 val3 |
|203 | 0xcb | sched_setaffinity | pid_t pid | unsigned int len | unsigned long *user_mask_ptr | - | - | - |
|204 | 0xcc | sched_getaffinity | pid_t pid | unsigned int len | unsigned long *user_mask_ptr | - | - | - |
|206 | 0xce | io_setup | unsigned nr_events | aio_context_t *ctxp | - | - | - | - |
|207 | 0xcf | io_destroy | aio_context_t ctx | - | - | - | - | - |
|208 | 0xd0 | io_getevents | aio_context_t ctx_id | long min_nr | long nr | struct io_event *events | struct timespec *timeout | - |
|209 | 0xd1 | io_submit | aio_context_t ctx_id | long nr | struct iocb **iocbpp | - | - | - |
|210 | 0xd2 | io_cancel | aio_context_t ctx_id | struct iocb *iocb | struct io_event *result | - | - | - |
|212 | 0xd4 | lookup_dcookie | char *buf | size_t len | - | - | - | - |
|213 | 0xd5 | epoll_create | int size | - | - | - | - | - |
|216 | 0xd8 | remap_file_pages | unsigned long start | unsigned long size | unsigned long prot | unsigned long pgoff | unsigned long flags | - |
|217 | 0xd9 | getdents64 | unsigned int fd | struct linux_dirent64 *dirent | unsigned int count | - | - | - |
|218 | 0xda | set_tid_address | int *tidptr | - | - | - | - | - |
|219 | 0xdb | restart_syscall | - | - | - | - | - | - |
|220 | 0xdc | semtimedop | int semid | struct sembuf *tsops | unsigned nsops | const struct timespec *timeout | - | - |
|221 | 0xdd | fadvise64 | loff_t offset | size_t len | int advice | - | - | - |
|222 | 0xde | timer_create | const clockid_t which_clock | struct sigevent *timer_event_spec | timer_t *created_timer_id | - | - | - |
|223 | 0xdf | timer_settime | timer_t timer_id | int flags | const struct itimerspec *new_setting | struct itimerspec *old_setting | - | - |
|224 | 0xe0 | timer_gettime | timer_t timer_id | struct itimerspec *setting | - | - | - | - |
|225 | 0xe1 | timer_getoverrun | timer_t timer_id | - | - | - | - | - |
|226 | 0xe2 | timer_delete | timer_t timer_id | - | - | - | - | - |
|227 | 0xe3 | clock_settime | const clockid_t which_clock | const struct timespec *tp | - | - | - | - |
|228 | 0xe4 | clock_gettime | const clockid_t which_clock | struct timespec *tp | - | - | - | - |
|229 | 0xe5 | clock_getres | const clockid_t which_clock | struct timespec *tp | - | - | - | - |
|230 | 0xe6 | clock_nanosleep | const clockid_t which_clock | int flags | const struct timespec *rqtp | struct timespec *rmtp | - | - |
|231 | 0xe7 | exit_group | int error_code | - | - | - | - | - |
|232 | 0xe8 | epoll_wait | int epfd | struct epoll_event *events | int maxevents | int timeout | - | - |
|233 | 0xe9 | epoll_ctl | int epfd | int op | int fd | struct epoll_event *event | - | - |
|234 | 0xea | tgkill | pid_t tgid | pid_t pid | int sig | - | - | - |
|235 | 0xeb | utimes | char *filename | struct timeval *utimes | - | - | - | - |
|237 | 0xed | mbind | unsigned long start | unsigned long len | unsigned long mode | unsigned long *nmask | unsigned long maxnode | unsigned flags |
|238 | 0xee | set_mempolicy | int mode | unsigned long *nmask | unsigned long maxnode | - | - | - |
|239 | 0xef | get_mempolicy | int *policy | unsigned long *nmask | unsigned long maxnode | unsigned long addr | unsigned long flags | - |
|240 | 0xf0 | mq_open | const char *u_name | int oflag | umode_t mode | struct mq_attr *u_attr | - | - |
|241 | 0xf1 | mq_unlink | const char *u_name | - | - | - | - | - |
|242 | 0xf2 | mq_timedsend | mqd_t mqdes | const char *u_msg_ptr | size_t msg_len | unsigned int msg_prio | const struct timespec *u_abs_timeout | - |
|243 | 0xf3 | mq_timedreceive | mqd_t mqdes | char *u_msg_ptr | size_t msg_len | unsigned int *u_msg_prio | const struct timespec *u_abs_timeout | - |
|244 | 0xf4 | mq_notify | mqd_t mqdes | const struct sigevent *u_notification | - | - | - | - |
|245 | 0xf5 | mq_getsetattr | mqd_t mqdes | const struct mq_attr *u_mqstat | struct mq_attr *u_omqstat | - | - | - |
|246 | 0xf6 | kexec_load | unsigned long entry | unsigned long nr_segments | struct kexec_segment *segments | unsigned long flags | - | - |
|247 | 0xf7 | waitid | int which | pid_t upid | struct siginfo *infop | int options | struct rusage *ru | - |
|248 | 0xf8 | add_key | const char *_type | const char *_description | const void *_payload | size_t plen | key_serial_t ringid | - |
|249 | 0xf9 | request_key | const char *_type | const char *_description | const char *_callout_info | key_serial_t destringid | - | - |
|250 | 0xfa | keyctl | int option | unsigned long arg2 | unsigned long arg3 | unsigned long arg4 | unsigned long arg5 | - |
|251 | 0xfb | ioprio_set | int which | int who | int ioprio | - | - | - |
|252 | 0xfc | ioprio_get | int which | int who | - | - | - | - |
|253 | 0xfd | inotify_init | - | - | - | - | - | - |
|254 | 0xfe | inotify_add_watch | int fd | const char *pathname | u32 mask | - | - | - |
|255 | 0xff | inotify_rm_watch | int fd | __s32 wd | - | - | - | - |
|256 | 0x100 | migrate_pages | pid_t pid | unsigned long maxnode | const unsigned long *old_nodes | const unsigned long *new_nodes | - | - |
|257 | 0x101 | openat | int dfd | const char *filename | int flags | umode_t mode | - | - |
|258 | 0x102 | mkdirat | int dfd | const char *pathname | umode_t mode | - | - | - |
|259 | 0x103 | mknodat | int dfd | const char *filename | umode_t mode | unsigned dev | - | - |
|260 | 0x104 | fchownat | int dfd | const char *filename | uid_t user | gid_t group | int flag | - |
|261 | 0x105 | futimesat | int dfd | const char *filename | struct timeval *utimes | - | - | - |
|262 | 0x106 | newfstatat | int dfd | const char *filename | struct stat *statbuf | int flag | - | - |
|263 | 0x107 | unlinkat | int dfd | const char *pathname | int flag | - | - | - |
|264 | 0x108 | renameat | int olddfd | const char *oldname | int newdfd | const char *newname | - | - |
|265 | 0x109 | linkat | int olddfd | const char *oldname | int newdfd | const char *newname | int flags | - |
|266 | 0x10a | symlinkat | const char *oldname | int newdfd | const char *newname | - | - | - |
|267 | 0x10b | readlinkat | int dfd | const char *pathname | char *buf | int bufsiz | - | - |
|268 | 0x10c | fchmodat | int dfd | const char *filename | umode_t mode | - | - | - |
|269 | 0x10d | faccessat | int dfd | const char *filename | int mode | - | - | - |
|270 | 0x10e | pselect6 | int n | fd_set *inp | fd_set *outp | fd_set *exp | struct timespec *tsp | void *sig |
|271 | 0x10f | ppoll | struct pollfd *ufds | unsigned int nfds | struct timespec *tsp | const sigset_t *sigmask | size_t sigsetsize | - |
|272 | 0x110 | unshare | unsigned long unshare_flags | - | - | - | - | - |
|273 | 0x111 | set_robust_list | struct robust_list_head *head | size_t len | - | - | - | - |
|274 | 0x112 | get_robust_list | int pid | struct robust_list_head **head_ptr | size_t *len_ptr | - | - | - |
|275 | 0x113 | splice | int fd_in | loff_t *off_in | int fd_out | loff_t *off_out | size_t len | unsigned int flags |
|276 | 0x114 | tee | int fdin | int fdout | size_t len | unsigned int flags | - | - |
|277 | 0x115 | sync_file_range | loff_t offset | loff_t nbytes | unsigned int flags | - | - | - |
|278 | 0x116 | vmsplice | int fd | const struct iovec *iov | unsigned long nr_segs | unsigned int flags | - | - |
|279 | 0x117 | move_pages | pid_t pid | unsigned long nr_pages | const void **pages | const int *nodes | int *status | int flags |
|280 | 0x118 | utimensat | int dfd | const char *filename | struct timespec *utimes | int flags | - | - |
|281 | 0x119 | epoll_pwait | int epfd | struct epoll_event *events | int maxevents | int timeout | const sigset_t *sigmask | size_t sigsetsize |
|282 | 0x11a | signalfd | int ufd | sigset_t *user_mask | size_t sizemask | - | - | - |
|283 | 0x11b | timerfd_create | int clockid | int flags | - | - | - | - |
|284 | 0x11c | eventfd | unsigned int count | - | - | - | - | - |
|285 | 0x11d | fallocate | int mode | loff_t offset | loff_t len | - | - | - |
|286 | 0x11e | timerfd_settime | int ufd | int flags | const struct itimerspec *utmr | struct itimerspec *otmr | - | - |
|287 | 0x11f | timerfd_gettime | int ufd | struct itimerspec *otmr | - | - | - | - |
|288 | 0x120 | accept4 | int fd | struct sockaddr *upeer_sockaddr | int *upeer_addrlen | int flags | - | - |
|289 | 0x121 | signalfd4 | int ufd | sigset_t *user_mask | size_t sizemask | int flags | - | - |
|290 | 0x122 | eventfd2 | unsigned int count | int flags | - | - | - | - |
|291 | 0x123 | epoll_create1 | int flags | - | - | - | - | - |
|292 | 0x124 | dup3 | unsigned int oldfd | unsigned int newfd | int flags | - | - | - |
|293 | 0x125 | pipe2 | int *fildes | int flags | - | - | - | - |
|294 | 0x126 | inotify_init1 | int flags | - | - | - | - | - |
|295 | 0x127 | preadv | unsigned long fd | const struct iovec *vec | unsigned long vlen | unsigned long pos_l | unsigned long pos_h | - |
|296 | 0x128 | pwritev | unsigned long fd | const struct iovec *vec | unsigned long vlen | unsigned long pos_l | unsigned long pos_h | - |
|297 | 0x129 | rt_tgsigqueueinfo | pid_t tgid | pid_t pid | int sig | siginfo_t *uinfo | - | - |
|298 | 0x12a | perf_event_open | struct perf_event_attr *attr_uptr | pid_t pid | int cpu | int group_fd | unsigned long flags | - |
|299 | 0x12b | recvmmsg | int fd | struct mmsghdr *mmsg | unsigned int vlen | unsigned int flags | struct timespec *timeout | - |
|300 | 0x12c | fanotify_init | unsigned int flags | unsigned int event_f_flags | - | - | - | - |
|301 | 0x12d | fanotify_mark | unsigned int flags | __u64 mask | int dfd | const char *pathname | - | - |
|302 | 0x12e | prlimit64 | pid_t pid | unsigned int resource | const struct rlimit64 *new_rlim | struct rlimit64 *old_rlim | - | - |
|303 | 0x12f | name_to_handle_at | int dfd | const char *name | struct file_handle *handle | int *mnt_id | int flag | - |
|304 | 0x130 | open_by_handle_at | int mountdirfd | struct file_handle *handle | int flags | - | - | - |
|305 | 0x131 | clock_adjtime | const clockid_t which_clock | struct timex *utx | - | - | - | - |
|306 | 0x132 | syncfs | int fd | - | - | - | - | - |
|307 | 0x133 | sendmmsg | int fd | struct mmsghdr *mmsg | unsigned int vlen | unsigned int flags | - | - |
|308 | 0x134 | setns | int fd | int nstype | - | - | - | - |
|309 | 0x135 | getcpu | unsigned *cpup | unsigned *nodep | struct getcpu_cache *unused | - | - | - |
|310 | 0x136 | process_vm_readv | pid_t pid | const struct iovec *lvec | unsigned long liovcnt | const struct iovec *rvec | unsigned long riovcnt | unsigned long flags |
|311 | 0x137 | process_vm_writev | pid_t pid | const struct iovec *lvec | unsigned long liovcnt | const struct iovec *rvec | unsigned long riovcnt | unsigned long flags |
|312 | 0x138 | kcmp | pid_t pid1 | pid_t pid2 | int type | unsigned long idx1 | unsigned long idx2 | - |