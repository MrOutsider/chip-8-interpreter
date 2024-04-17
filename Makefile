final: ./build/main.o
	@mkdir ./build/bin
	gcc ./build/main.o -o ./build/bin/app.out

./build/main.o: ./src/main.c
	@mkdir ./build
	gcc -c ./src/main.c -o ./build/main.o

clean:
	@rm -r ./build
