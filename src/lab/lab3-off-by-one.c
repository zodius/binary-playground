#include <stdio.h>

void vuln(char *input) {
	char buf[1024];
	strcpy(buf, input);
	printf("%s\r\n", buf);
}

int main() {
	char *buf = malloc(2000);
	read(0, buf, 1500);

	if(strlen(buf) > 1024) {
		printf("You bad!\n");
		return 1;
	}

	vuln(buf);
}

void gadget() {
	asm("sub %%ebx, %%esp \n ret" ::: "esp");
	asm("pop %%esp \n ret" ::: "esp");
	asm("sub $16, %%esp \n ret" ::: "esp");
}

void ret2win() {
	printf("You win\n!");
}
