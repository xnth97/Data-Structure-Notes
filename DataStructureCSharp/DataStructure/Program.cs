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