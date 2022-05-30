public class Stack<T> {

    private List<T> list { get; }

    public Stack() {
        list = new List<T>();
    }

    public bool IsEmpty {
        get {
            return list.Count == 0;
        }
    }

    public void Push(T item) {
        list.Add(item);
    }

    public T? Pop() {
        if (IsEmpty) {
            return default;
        }
        var last = list[list.Count - 1];
        list.RemoveAt(list.Count - 1);
        return last;
    }

    public T? Peek() {
        if (IsEmpty) {
            return default;
        }
        return list[list.Count - 1];
    }

    public override string ToString() {
        return $"Stack: [{String.Join(", ", list)}]";
    }

}
