helloworld: world helloworld.c
	mkdir -p build
	gcc -o ./build/helloworld -L./build/lib -Wl,-rpath=./build/lib helloworld.c -lworld

world: hello lib/world.c
	mkdir -p build/lib
	gcc -shared -o build/lib/libworld.so -L ./build/lib lib/world.c -Wl,-rpath=./build/lib -lhello -fPIC


hello: lib/hello.c
	mkdir -p build/lib
	gcc -shared -o build/lib/libhello.so lib/hello.c -fPIC

clean: 
	rm -rf build *.o *.so *.out helloworld
