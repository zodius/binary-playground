#ifdef __GNUC__
#define _fastcall __attribute__((__fastcall__))
#endif

#include <stdint.h>
#include <stdio.h>

void _fastcall flag(int a, int b, int c) {
	if(a == 0x6520 && b == 0x55765649 && c == 0xdeadbeaf) {
		printf("You really know calling convention!\n");
	}
	else {
		printf("too bad..\n");
	}
}

int main() {
	int eax, ebx, ecx, edx;

	printf("Input eax in hex(1a2b): ");
	scanf("%x", &eax);
	printf("Input ebx in hex(1a2b): ");
	scanf("%x", &ebx);
	printf("Input ecx in hex(1a2b): ");
	scanf("%x", &ecx);
	printf("Input edx in hex(1a2b): ");
	scanf("%x", &edx);

	int stack1, stack2, stack3;
	printf("=========================\n");
	printf("now we going to push stack 3 times:\n");
	printf("give me 8 byte in hex to push stack (1/3):");
	scanf("%x", &stack1);
	printf("give me 8 byte in hex to push stack (2/3):");
	scanf("%x", &stack2);
	printf("give me 8 byte in hex to push stack (3/3):");
	scanf("%x", &stack3);

	printf("=========================\n");

	printf("eax: 0x%08x \n", eax);
	printf("ebx: 0x%08x \n", ebx);
	printf("ecx: 0x%08x \n", ecx);
	printf("edx: 0x%08x \n", edx);
	printf("push %x\n", stack1);
	printf("push %x\n", stack2);
	printf("push %x\n", stack3);


	asm (
		"mov %0, %%eax \n"
		"mov %1, %%ebx \n"
		"mov %2, %%ecx \n"
		"mov %3, %%edx \n"
		"push %4 \n"
		"push %5 \n"
		"push %6 \n"
		"call flag"
		:
		: "g"((uint32_t)eax),"g"((uint32_t)ebx),"g"((uint32_t)ecx),"g"((uint32_t)edx),"m"((uint32_t)stack1),"m"((uint32_t)stack2),"m"((uint32_t)stack3)
		: "eax", "ebx", "ecx", "edx"
	);
	return 0;
}
