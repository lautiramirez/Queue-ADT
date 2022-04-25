flags = gcc -Wall -Wextra -Werror -pedantic -std=c99
files_c = queue.c main.c
files_o = queue.o main.o

clear: 
	rm -f main.o
	rm -f queue.o
	rm -f test

comp: queue.c main.c
	$(flags) -c $(files_c)
	$(flags) -o test $(files_o)

leak: test
	valgrind --show-reachable=yes --leak-check=full ./test

gdb:
	make clear
	$(flags) -g -c $(files_c)
	$(flags) -g -o test $(files_o)
	gdb ./test
