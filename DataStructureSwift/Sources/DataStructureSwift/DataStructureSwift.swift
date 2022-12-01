@main
public struct DataStructureSwift {
    public private(set) var text = "Hello, World!"

    public static func main() {
        let sortedArr = [1, 3, 5, 7, 9]
        print(binarySearch(data: sortedArr, key: 5))

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

        let hashTable = HashTable(initialCapacity: 10)
        hashTable.insert(key: 3)
        hashTable.insert(key: 9)
        hashTable.insert(key: 13)
        hashTable.insert(key: 4)
        hashTable.delete(13)
        hashTable.insert(key: 14)
        hashTable.delete(4)
        hashTable.insert(key: 19)
        print(hashTable)

        let bst = BinarySearchTree(root: BinarySearchTree.Node(key: 10, value: 0))
        bst.insert(key: 4, value: 0)
        bst.insert(key: 14, value: 0)
        bst.insert(key: 8, value: 0)
        bst.insert(key: 6, value: 0)
        bst.insert(key: 11, value: 0)
        bst.insert(key: 9, value: 0)
        bst.insert(key: 2, value: 0)
        bst.delete(key: 3)
        bst.delete(key: 8)
        print(bst)
        print("BFS: \(bst.bfsTraverse())")
        print(bst.inorderTraverse())
        print(bst.preorderTraverse())
        print(bst.postorderTraverse())

        let heap = MaxHeap<Int>()
        heap.insert(11)
        heap.insert(32)
        heap.insert(73)
        heap.insert(45)
        heap.insert(26)
        print(heap)
        for _ in 0 ..< 5 {
            print(heap.removeMax()!)
        }
        print(heapSort(data: [5,2,7,1,3,8,6,4]))
    }
}
