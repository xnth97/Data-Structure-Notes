package Stack;

public class ArrayStack<T> implements StackInterface<T> {

    private static final int defaultCapacity = 10;
    private int top;
    private Object[] elem;

    public ArrayStack() {
        this(defaultCapacity);
    }

    public ArrayStack(int initialCapacity) {
        if (initialCapacity <= 0) {
            elem = new Object[defaultCapacity];
        } else {
            elem = new Object[initialCapacity];
        }
        top = -1;
    }

    @Override
    public boolean isEmpty() {
        return top == -1;
    }

    @Override
    public void push(T item) {
        if (top == elem.length - 1) {
            throw new ArrayIndexOutOfBoundsException();
        }
        elem[++top] = item;
    }

    @SuppressWarnings("unchecked")
    @Override
    public T pop() {
        // must remove and return
        if (isEmpty()) {
            throw new ArrayIndexOutOfBoundsException();
        }
        T item = (T) elem[top];
        elem[top] = null;
        top --;
        return item;
    }

    @SuppressWarnings("unchecked")
    @Override
    public T peek() {
        // don't remove
        if (isEmpty()) {
            throw new ArrayIndexOutOfBoundsException();
        }
        return (T) elem[top];
    }
}
