extern unsigned lsfrc(unsigned seed);
void decrc(int *arr, int num, int key) {
    for (int i = 0; i<num; ++i) {
        arr[i] = arr[i] + lsfrc(key);
        if (arr[i]>26) {
            arr[i]=arr[i] - 26;
        }
        key = lsfrc(key);
    }
}

