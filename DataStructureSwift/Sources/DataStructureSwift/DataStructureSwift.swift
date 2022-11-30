@main
public struct DataStructureSwift {
    public private(set) var text = "Hello, World!"

    public static func main() {
        let linkedList = LinkedList<Int>()
        linkedList.addFirst(5)
        linkedList.addLast(8)
        linkedList.addLast(10)
        linkedList.addFirst(2)
        linkedList.insert(after: 8, item: 9)
        linkedList.insert(after: 10, item: 11)
        linkedList.insert(before: 8, item: 7)
        linkedList.remove(5)
        print(linkedList)

        let stack = Stack<Int>()
        stack.push(1)
        stack.push(2)
        stack.pop()
        stack.push(3)
        print(stack)

        let queue = Queue<Int>()
        queue.enqueue(1)
        queue.enqueue(2)
        queue.dequeue()
        queue.enqueue(3)
        queue.enqueue(4)
        queue.dequeue()
        print(queue)
    }
}
