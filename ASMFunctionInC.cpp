
#include <iostream>
#include <stdlib.h>

extern "C" void ReverseArray(int* destination, const int* source, int n);

int main()
{
	const int n = 10;
	int x[n], y[n];

	for (unsigned int i = 0; i < n; i++) {
		x[i] = i;
	}

	ReverseArray(y, x, n);
	for (int i = 0; i < n; i++)
		std::cout << "dest: " << y[i] << " source: " << x[i] << std::endl;

	return 0;
}


