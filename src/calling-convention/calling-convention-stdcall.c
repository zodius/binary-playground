#ifdef __GNUC__
#define _stdcall __attribute__((__stdcall__))
#endif

int _stdcall test(int a, int b, int c) {
    return a + b + c;
}

int main() {
    test(1, 2, 3);
    return 0;
}
