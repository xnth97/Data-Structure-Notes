// See https://aka.ms/new-console-template for more information
var linkedList = new LinkedList<int>();
linkedList.AddLast(1);
linkedList.AddLast(2);
linkedList.AddLast(3);
linkedList.AddLast(5);
linkedList.InsertBefore(2, 4);
linkedList.Remove(3);
Console.WriteLine(linkedList);

var stack = new Stack<int>();
stack.Push(1);
stack.Push(2);
stack.Push(3);
stack.Push(4);
stack.Push(5);
stack.Pop();
stack.Pop();
Console.WriteLine(stack);

var queue = new Queue<int>();
queue.Enqueue(1);
queue.Enqueue(2);
queue.Enqueue(3);
queue.Dequeue();
Console.WriteLine(queue);

var hashTable = new HashTable(10);
hashTable.Insert(5);
hashTable.Insert(7);
Console.WriteLine(hashTable.Search(2));
Console.WriteLine(hashTable.Search(5));
hashTable.Delete(5);
Console.WriteLine(hashTable.Search(5));
Console.WriteLine(hashTable.Search(7));
