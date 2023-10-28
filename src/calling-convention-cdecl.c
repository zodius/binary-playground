#ifdef __GNUC__
#define _cdecl __attribute__((__cdecl__))
#endif

int _cdecl test(int a, int b, int c) {
    return a + b + c;
}

int main() {
    test(1, 2, 3);
    return 0;
}