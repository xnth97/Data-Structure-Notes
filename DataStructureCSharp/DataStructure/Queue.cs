public class Queue<T> {

    private List<T> list { get; }

    public Queue() {
        list = new List<T>();
    }

    public void Enqueue(T item) {
        list.Add(item);
    }

    public T? Dequeue() {
        if (IsEmpty) {
            return default;
        }
        var first = list[0];
        list.RemoveAt(0);
        return first;
    }

    public T? Peek() {
        if (IsEmpty) {
            return default;
        }
        return list[0];
    }

    public bool IsEmpty {
        get {
            return list.Count == 0;
        }
    }

    public override string ToString() {
        return $"Queue: [{string.Join(", ", list)}]";
    }

}