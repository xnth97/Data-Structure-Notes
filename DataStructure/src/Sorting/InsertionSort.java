package Sorting;

public class InsertionSort {

    public static void insertionSort(int[] data) {
        for (int out = 1; out < data.length; out ++) {
            // store the value
            int tmp = data[out];

            int in = out;

            // go to left side to find a position
            while (in > 0 && data[in - 1] >= tmp) {
                data[in] = data[in - 1];
                in --;
            }
            if (out != in) {
                // insert the value
                data[in] = tmp;
            }
        }
    }

}
