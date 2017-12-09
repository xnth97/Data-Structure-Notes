package MaxHeap;

import java.util.NoSuchElementException;

public class MaxHeap implements MaxHeapInterface {

    private Node[] heapArray;
    private int currentSize;

    public MaxHeap(int initialCapacity) {
        heapArray = new Node[initialCapacity];
        currentSize = 0;
    }

    @Override
    public boolean insert(int key) {
        if (currentSize == heapArray.length) {
            // TODO: Should create a new array and copy elements
            return false;
        }
        Node newNode = new Node(key);
        heapArray[currentSize] = newNode;
        percolateUp(currentSize ++);
        return true;
    }

    private void percolateUp(int index) {
        // save the bottom node
        Node bottom = heapArray[index];

        // find the initial index value of parent
        int parent = (index - 1) / 2;

        while (index > 0 && heapArray[parent].key < bottom.key) {
            // parent node comes down
            heapArray[index] = heapArray[parent];

            // index moves up
            index = parent;

            // new parent index
            parent = (parent - 1) / 2;
        }

        heapArray[index] = bottom;
    }

    @Override
    public int removeMax() {
        if (currentSize == 0) {
            throw new NoSuchElementException();
        }
        Node root = heapArray[0];
        currentSize --;

        // root <- last one
        heapArray[0] = heapArray[currentSize];
        heapArray[currentSize] = null;
        percolateDown(0);
        return root.key;
    }

    private void percolateDown(int index) {
        Node top = heapArray[index];
        int largerChild;

        // while there is as at least left child
        while (index < (currentSize / 2)) {
            int leftChild = index * 2 + 1;
            int rightChild = leftChild + 1;

            if (rightChild < currentSize && heapArray[leftChild].key < heapArray[rightChild].key) {
                largerChild = rightChild;
            } else {
                largerChild = leftChild;
            }

            if (heapArray[largerChild].key <= top.key) {
                break;
            }

            // move the nodes up
            heapArray[index] = heapArray[largerChild];
            // index goes down toward larger child
            index = largerChild;
        }

        // put top key into proper location to restore the heap
        heapArray[index] = top;
    }

    private static class Node {
        private int key;

        Node(int key) {
            this.key = key;
        }
    }
}
