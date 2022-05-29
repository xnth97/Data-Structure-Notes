public class LinkedList<T> where T: IEquatable<T> {

    public Node<T>? head { get; private set; }

    public LinkedList() {
        head = null;
    }

    public class Node<T> where T: IEquatable<T> {

        public T data { get; internal set; }
        public Node<T>? next { get; internal set; }

        public Node(T data, Node<T>? next) {
            this.data = data;
            this.next = next;
        }
    }

    public void AddFirst(T item) {
        head = new Node<T>(item, null);
    }

    public void AddLast(T item) {
        if (head == null) {
            AddFirst(item);
            return;
        }

        var tmp = head;
        while (tmp.next != null) {
            tmp = tmp.next;
        }
        tmp.next = new Node<T>(item, null);
    }

    public void InsertBefore(T key, T value) {
        if (head == null) {
            return;
        }

        if (head.data.Equals(key)) {
            AddFirst(value);
            return;
        }

        Node<T>? prev = null;
        Node<T>? curr = head;
        while (curr != null && !curr.data.Equals(key)) {
            prev = curr;
            curr = curr.next;
        }

        if (prev != null && curr != null) {
            prev.next = new Node<T>(value, curr);
        }
    }

    public void Remove(T key) {
        if (head == null) {
            return;
        }

        if (head.data.Equals(key)) {
            head = head.next;
            return;
        }

        Node<T>? prev = null;
        Node<T>? curr = head;

        while (curr != null && !curr.data.Equals(key)) {
            prev = curr;
            curr = curr.next;
        }

        if (prev != null && curr != null) {
            prev.next = curr.next;
        }
    }

    public override string ToString() {
        var res = "LinkedList: ";
        if (head == null) {
            res += "null";
            return res;
        }

        var curr = head;
        while (curr != null) {
            res += $"{curr.data}";
            if (curr.next != null) {
                res += " -> ";
            }
            curr = curr.next;
        }
        return res;
    }

}

