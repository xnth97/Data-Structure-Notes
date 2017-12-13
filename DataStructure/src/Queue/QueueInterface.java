package Queue;

public interface QueueInterface<T> {
    // should be o(1)
    void enqueue(T item);
    T dequeue();
    T peekFront();
    boolean isEmpty();
}
