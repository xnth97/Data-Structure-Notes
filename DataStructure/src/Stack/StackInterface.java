package Stack;

public interface StackInterface<T> {
    // should be o(1)
    void push(T item);
    T pop();
    T peek();
    boolean isEmpty();
}
