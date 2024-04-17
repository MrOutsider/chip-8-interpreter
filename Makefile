final: main.o
	gcc main.o -o app.out

main.o: ./src/main.c
	gcc -c ./src/main.c

clean:
	@rm ./app.out ./*.o
