class LinkedList:
    def __init__(self):
        self.head = None


    def add_first(self, item):
        self.head = self.Node(item, None)
    

    def add_last(self, item):
        if not self.head:
            self.add_first(item)
            return

        tmp = self.head
        while tmp.next:
            tmp = tmp.next

        tmp.next = self.Node(item, None)


    def insert_after(self, key, item):
        tmp = self.head
        while tmp and tmp.data != key:
            tmp = tmp.next
        tmp.next = self.Node(item, tmp.next)


    def insert_before(self, key, item):
        if self.head:
            if self.head.data == key:
                self.add_first(item)
                return

            prev = None
            cur = self.head
            while cur and cur.data != key:
                prev = cur
                cur = cur.next

            if cur:
                prev.next = self.Node(item, cur)


    def remove(self, key):
        if self.head:
            if self.head.data == key:
                self.head = self.head.next
                return

            prev = None
            cur = self.head
            while cur and cur.data != key:
                prev = cur
                cur = cur.next

            if cur:
                prev.next = cur.next


    class Node:
        def __init__(self, data, next):
            self.data = data
            self.next = next