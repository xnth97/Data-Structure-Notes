package Queue;

public class ArrayQueue<T> implements QueueInterface<T> {

    private static final int defaultCapacity = 6;
    private int front;
    private int back;
    private int nItems;
    private Object[] elem;

    public ArrayQueue() {
        elem = new Object[defaultCapacity];
        front = 0;
        back = -1;
        nItems = 0;
    }

    @Override
    public boolean isEmpty() {
        return nItems == 0;
    }

    @Override
    public void enqueue(T item) {
        if (nItems == elem.length) {
            throw new IndexOutOfBoundsException();
        }
        back ++;
        // use modulation for reusing space
        elem[back % elem.length] = item;
        nItems ++;
    }

    @SuppressWarnings("unchecked")
    @Override
    public T dequeue() {
        if (isEmpty()) {
            throw new IndexOutOfBoundsException();
        }
        int index = front % elem.length;
        T item = (T) elem[index];
        elem[index] = null;
        front ++;
        nItems --;
        return item;
    }

    @SuppressWarnings("unchecked")
    @Override
    public T peekFront() {
        return (T) elem[front % elem.length];
    }
}
