class MaxHeap:
    def __init__(self):
        self.heap_array = []


    def insert(self, key):
        new_node = self.Node(key)
        self.heap_array.append(new_node)
        self.__percolate_up(len(self.heap_array) - 1)


    def __percolate_up(self, index: int):
        # save the bottom node
        bottom = self.heap_array[-1]
        # find the initial index value of parent
        parent = int((index - 1) / 2)
        # while parent's key is smaller than the new key
        while index > 0 and self.heap_array[parent].key < bottom.key:
            # parent node comes down
            self.heap_array[index] = self.heap_array[parent]
            index = parent # index moves up
            parent = int((parent - 1) / 2)
        # finally, insert newly added node into proper position
        self.heap_array[index] = bottom


    def remove_max(self) -> int:
        if not self.heap_array:
            return
        root = self.heap_array[0]
        self.heap_array[0] = self.heap_array[-1]
        del self.heap_array[-1]
        if self.heap_array:
            self.__perculate_down(0)
        return root.key


    def __perculate_down(self, index):
        top = self.heap_array[index]
        larger_child = -1 # larger child's index
        while index < int(len(self.heap_array) / 2):
            left_child = index * 2 + 1
            right_child = (index + 1) * 2
            # find which one is larger
            if right_child < len(self.heap_array) and self.heap_array[left_child].key < self.heap_array[right_child].key:
                larger_child = right_child
            else:
                larger_child = left_child
            # no need to go down any more
            if self.heap_array[larger_child].key <= top.key:
                break
            # move the nodes up
            self.heap_array[index] = self.heap_array[larger_child]
            # index goes down toward larger child
            index = larger_child
        # put top key into proper location to restore the heap
        self.heap_array[index] = top


    # Node
    class Node:
        def __init__(self, key):
            self.key = key