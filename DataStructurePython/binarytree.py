class BinaryTree:
    def __init__(self):
        self.root = None
    

    def find(self, key: int) -> bool:
        if not self.root:
            return False
        current = self.root
        while current.key != key:
            if current.key < key:
                current = current.right
            else:
                current = current.left
            if not current:
                return False
        return True


    def insert(self, key: int, value: float):
        new_node = self.Node(key, value)
        if not self.root:
            self.root = new_node
            return
        parent = self.root
        current = self.root
        while True:
            if current.key == key:
                return
            parent = current
            if current.key < key:
                current = current.right
                if not current:
                    parent.right = new_node
                    return
            else:
                current = current.left
                if not current:
                    parent.left = new_node
                    return


    def deleteNode(self, key: int):
        if not self.root:
            return
        parent = self.root
        current = self.root
        is_left_child = False
        while current.key != key:
            parent = current
            if current.key > key:
                is_left_child = True
                current = current.left
            else:
                is_left_child = False
                current = current.right
            if not current:
                return self.root
        
        # case 2: a leaf
        if not current.left and not current.right:
            if current == self.root:
                return
            if is_left_child:
                parent.left = None
            else:
                parent.right = None
        # case 3: one child
        # only has left child
        elif not current.right:
            if current == self.root:
                return current.left
            if is_left_child:
                parent.left = current.left
            else:
                parent.right = current.left
        # only has right child
        elif not current.left:
            if current == self.root:
                return current.right
            if is_left_child:
                parent.left = current.right
            else:
                parent.right = current.right
        # case 4: two children
        else:
            successor = self.__get_successor(current)
            if current == self.root:
                self.root = successor
            elif is_left_child:
                parent.left = successor
            else:
                parent.right = successor
            successor.left = current.left


    def __get_successor(self, to_delete: self.Node) -> self.Node:
        # find the minimum node in to_delete's right subtree
        parent = to_delete
        successor = to_delete
        current = to_delete.right
        while current:
            parent = successor
            successor = current
            current = current.left
        if successor != to_delete.right:
            parent.left = successor.right
            successor.right = to_delete.right
        return successor


    def dfs_traverse(self):
        self.__in_order(self.root)
        

    def __in_order(self, to_visit: self.Node):
        if to_visit:
            self.__in_order(to_visit.left)
            print(to_visit.key)
            self.__in_order(to_visit.right)

    def bfs_traverse(self):
        if not self.root:
            return
        queue = [self.root]
        for node in queue:
            print(node.key)
            if node.left:
                queue.append(node.left)
            if node.right:
                queue.append(node.right)


    def iterative_traverse(self):
        if not self.root:
            return
        stack = []
        current = self.root
        while current or stack:
            # add all through the left-most node of the tree
            while current:
                stack.append(current)
                current = current.left
            current = stack.pop()
            print(current.key)
            # if the removed node still has non-empty right subtree,
            # add all through the right node's left most child
            current = current.right


    # inner class
    class Node:
        def __init__(self, key: int, value: float):
            self.key = key
            self.value = value
            self.left = None
            self.right = None