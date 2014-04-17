static void print(char *str, char color);
static void cls(void);

#define BLACK	0
#define BLUE	1
#define GREEN	2
#define CYAN	3
#define RED		4
#define MAGENTA 5
#define COLOR(fg,bg) (((bg) << 4) + (fg))

char *SCREEN = (char *)0xb8000;

void kmain(void)
{
	cls();
	print("Hello kernel!", COLOR(RED,GREEN));
}

static void print(char *str, char color)
{
	unsigned int i;
	unsigned int j;

	for (j = 0, i = 0; str[j] != '\0'; j++, i += 2) {
		SCREEN[i] = str[j];
		SCREEN[i + 1]= color;
	}
}

static void cls(void)
{
	unsigned int i;
	for (i = 0; i < 80 * 25 * 2; i += 2) {
		SCREEN[i] = ' ';
	}
}
