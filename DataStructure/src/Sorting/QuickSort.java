package Sorting;

import java.util.Arrays;

public class QuickSort {

    private static void swap(int[] data, int one, int two) {
        int tmp = data[one];
        data[one] = data[two];
        data[two] = tmp;
    }

    private static int partition(int[] arr, int left, int right, int pivot) {
        int leftPointer = left - 1;
        int rightPointer = right;

        while (true) {
            while (arr[++leftPointer] < pivot);
            while (rightPointer > 0 && arr[--rightPointer] > pivot);
            if (leftPointer >= rightPointer) {
                break;
            } else {
                swap(arr, leftPointer, rightPointer);
            }
        }
        swap(arr, leftPointer, right);
        return leftPointer;
    }

    private static void quickSort(int[] unsorted, int left, int right) {
        // base case
        if (left >= right) {
            return;
        }

        // last value is the pivot value
        int pivot = unsorted[right];
        int partition = partition(unsorted, left, right, pivot);

        quickSort(unsorted, left, partition - 1);
        quickSort(unsorted, partition + 1, right);
    }

    public static void quickSort(int[] unsorted) {
        quickSort(unsorted, 0, unsorted.length - 1);
    }

    public static void main(String[] args) {
        int[] a = {5, 2, 4, 8, 3, 1, 10, 9};
        quickSort(a);
        System.out.println(Arrays.toString(a));
    }

}
