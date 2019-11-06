
#include <iostream>
#include <stdlib.h>

extern "C" void ReverseArray(int* destination, const int* source, int n);
extern "C" void CalculateSum(int a, int b, int c, int* s1, int* s2, int* s3);

extern "C" int MemoryAddressing(int i, int* v1, int* v2, int* v3, int* v4);
//simple value usage in asm
extern "C" int NumFibVals;

extern "C" void GlobalAddition(char c, short s, int i, long long l);
//global vars
extern "C" char GlChar = 10;
extern "C" short GlShort = 20;
extern "C" int GlInt = 30;
extern "C" long long GlLongLong = 40;


int main()
{
	std::cout << "samples";

	return 0;
}


