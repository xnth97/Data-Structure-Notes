class HashTable:
    def __init__(self, initial_capacity: int):
        self.hash_array = [None] * initial_capacity
        self.DELETED = self.DataItem(-1)


    def search(self, key: int) -> bool:
        hash_val = self.__hash_func(key)
        while self.hash_array[hash_val]:
            if self.hash_array[hash_val].key == key:
                return True
            hash_val += 1
            # 每次都取模防止溢出
            hash_val %= len(self.hash_array)
        return False


    def delete(self, key: int) -> int:
        hash_val = self.__hash_func(key)
        while self.hash_array[hash_val]:
            if self.hash_array[hash_val].key == key:
                val = self.hash_array[hash_val].key
                self.hash_array[hash_val] = self.DELETED
                return val
            hash_val += 1
            hash_val %= len(self.hash_array)
        return -1


    def insert(self, key: int):
        item = self.DataItem(key)
        hash_val = self.__hash_func(key)
        while self.hash_array[hash_val] and self.hash_array[hash_val].key != -1:
            hash_val += 1
            hash_val %= len(self.hash_array)
        self.hash_array[hash_val] = item
    

    def __hash_func(self, key: int) -> int:
        return key % len(self.hash_array)


    class DataItem:
        def __init__(self, key: int):
            self.key = key