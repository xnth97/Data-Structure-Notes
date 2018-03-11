class Queue:
    def __init__(self):
        self.array = []


    def is_empty(self):
        return len(self.array) == 0


    def enqueue(self, item):
        self.array.append(item)


    def dequeue(self):
        if self.is_empty():
            return
        val = self.array[0]
        del self.array[0]
        return val


    def peek_front(self):
        if self.is_empty():
            return
        return self.array[0]