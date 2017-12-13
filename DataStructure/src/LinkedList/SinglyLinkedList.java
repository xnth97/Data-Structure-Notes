package LinkedList;

import java.util.Iterator;
import java.util.NoSuchElementException;

public class SinglyLinkedList<T> implements Iterable<T> {

    private Node<T> head;

    public SinglyLinkedList() {
        this.head = null;
    }

    public void addFirst(T item) {
        head = new Node<>(item, head);
    }

    public void addLast(T item) {
        if (head == null) {
            addFirst(item);
        } else {
            Node<T> tmp = head;
            while (tmp.next != null) {
                tmp = tmp.next;
            }
            tmp.next = new Node<>(item, null);
        }
    }

    public void insertAfter(T key, T item) {
        Node<T> tmp = head;
        while (tmp != null && !tmp.data.equals(key)) {
            tmp = tmp.next;
        }

        // found the key
        if (tmp != null) {
            tmp.next = new Node<>(item, tmp.next);
        }
    }

    public void insertBefore(T key, T item) {
        if (head == null) {
            return;
        }

        if (head.data.equals(key)) {
            addFirst(item);
            return;
        }

        Node<T> prev = null;
        Node<T> curr = head;

        while (curr != null && !curr.data.equals(key)) {
            prev = curr;
            curr = curr.next;
        }

        if (curr != null) {
            prev.next = new Node<>(item, curr);
        }
    }

    public void remove(T key) {
        if (head == null) {
            return;
        }

        if (head.data.equals(key)) {
            head = head.next;
            return;
        }

        Node<T> prev = null;
        Node<T> curr = head;

        while (curr != null && !curr.data.equals(key)) {
            prev = curr;
            curr = curr.next;
        }

        if (curr != null) {
            prev.next = curr.next;
        }
    }

    @Override
    public Iterator<T> iterator() {
        return new LinkedListIterator();
    }

    private class LinkedListIterator implements Iterator<T> {

        private Node<T> nextNode;

        LinkedListIterator() {
            nextNode = head;
        }

        @Override
        public boolean hasNext() {
            return nextNode != null;
        }

        @Override
        public T next() {
            if (!hasNext()) {
                throw new NoSuchElementException();
            }
            T result = nextNode.data;
            nextNode = nextNode.next;
            return result;
        }
    }

    private static class Node<T> {
        private T data;
        private Node<T> next;

        Node(T data, Node<T> next) {
            this.data = data;
            this.next = next;
        }
    }

}
