package Sorting;

public class BubbleSort {

    public static void swap(int[] data, int one, int two) {
        int tmp = data[one];
        data[one] = data[two];
        data[two] = tmp;
    }

    public static void bubbleSort(int[] data) {
        for (int out = data.length - 1; out >= 1; out --) {
            for (int in = 0; in < out; in ++) {
                if (data[in] > data[in + 1]) {
                    swap(data, in, in + 1);
                }
            }
        }
    }

}
