extern unsigned lsfrc(unsigned seed);
void encrc(int *arr, int num, int key) {
    for (int i = 0; i<num; ++i) {
        arr[i] = arr[i] - lsfrc(key);
        if (arr[i]<0) {
            arr[i]+=26;
        }
        key = lsfrc(key);
    }
}
