int a[10];
int i, j, m, t;
for (i = 0; i < 10; ++i) {
	scanf("%d", a + i);
}
for (i = 0; i < 9; ++i) {
	m = i;
	for (j = i + 1; j < 10; j++) {
		if (a[j] < a[m]) {
			m = j;
		}
	}
	if (m != i) {
		t = a[i];
		a[i] = a[m];
		a[m] = t;
	}
}
