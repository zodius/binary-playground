class Test {
    public:
	int a;
	int test(int a, int b, int c) {
	    this->a = a + b + c;
	    return this->a;
	}
};

int main() {
    Test mytest = Test();
    mytest.test(1, 2, 3);
    return 0;
}
