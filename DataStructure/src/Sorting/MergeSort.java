package Sorting;

import java.util.Arrays;

public class MergeSort {

    private static int[] merge(int[] a, int[] b) {
        int[] merged = new int[a.length + b.length];

        int indexA = 0;
        int indexB = 0;
        int indexM = 0;

        while (indexA < a.length && indexB < b.length) {
            if (a[indexA] < b[indexB]) {
                merged[indexM] = a[indexA];
                indexA ++;
            } else {
                merged[indexM] = b[indexB];
                indexB ++;
            }
            indexM ++;
        }

        while (indexA < a.length) {
            merged[indexM] = a[indexA];
            indexA ++;
            indexM ++;
        }

        while (indexB < b.length) {
            merged[indexM] = b[indexB];
            indexB ++;
            indexM ++;
        }

        return merged;
    }

    public static int[] mergeSort(int[] unsorted) {
        // base case
        if (unsorted.length <= 1) {
            return unsorted;
        }

        int mid = unsorted.length / 2;

        // create left array
        int[] left = new int[mid];
        System.arraycopy(unsorted, 0, left, 0, mid);

        // create right array
        int[] right = new int[unsorted.length - mid];
        System.arraycopy(unsorted, mid, right, 0, right.length);

        // recursively call mergeSort()
        left = mergeSort(left);
        right = mergeSort(right);

        // merge left part and right part
        return merge(left, right);
    }

    public static void main(String[] args) {
        int[] a = {5, 2, 4, 8, 3, 1, 10, 9};
        System.out.println(Arrays.toString(mergeSort(a)));
    }

}
