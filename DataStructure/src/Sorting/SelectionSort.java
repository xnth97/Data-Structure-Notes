package Sorting;

public class SelectionSort {

    public static void swap(int[] data, int one, int two) {
        int tmp = data[one];
        data[one] = data[two];
        data[two] = tmp;
    }

    public static void selectionSort(int[] data) {
        int min;
        for (int out = 0; out < data.length - 1; out ++) {
            min = out;

            // find the minimum value among the elements on the right side
            for (int in = out + 1; in < data.length - 1; in ++) {
                if (data[in] < data[min]) {
                    min = in;
                }
            }

            // swap
            if (out != min) {
                swap(data, out, min);
            }
        }
    }

}
