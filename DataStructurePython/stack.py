class Stack:
    def __init__(self):
        self.array = []

    def is_empty(self):
        return len(self.array) == 0

    def push(self, item):
        self.array.append(item)

    def pop(self):
        if self.is_empty():
            return
        return self.array.pop()

    def peek(self):
        if self.is_empty():
            return
        return self.array[-1]