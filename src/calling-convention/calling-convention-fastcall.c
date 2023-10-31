#ifdef __GNUC__
#define _fastcall __attribute__((__fastcall__))
#endif

int _fastcall test(int a, int b, int c) {
    return a + b + c;
}

int main() {
    test(1, 2, 3);
    return 0;
}
