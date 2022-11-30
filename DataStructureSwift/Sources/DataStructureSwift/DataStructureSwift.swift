@main
public struct DataStructureSwift {
    public private(set) var text = "Hello, World!"

    public static func main() {
        let linkedList = LinkedList<Int>()
        linkedList.addFirst(item: 5)
        linkedList.addLast(item: 8)
        linkedList.addLast(item: 10)
        linkedList.addFirst(item: 2)
        linkedList.insert(after: 8, item: 9)
        linkedList.insert(after: 10, item: 11)
        linkedList.insert(before: 8, item: 7)
        linkedList.remove(item: 5)
        print(linkedList)
    }
}
