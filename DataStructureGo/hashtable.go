package main

type DataItem struct {
	key int
}

type HashTable struct {
	hashArray []*DataItem
	deleted   *DataItem
}

func MakeHashTable(capacity int) HashTable {
	return HashTable{make([]*DataItem, capacity), &DataItem{-1}}
}

func (table *HashTable) hash(key int) int {
	return key % len(table.hashArray)
}

func (table *HashTable) search(key int) bool {
	hashVal := table.hash(key)
	for table.hashArray[hashVal] != nil {
		if table.hashArray[hashVal].key == key {
			return true
		}
		hashVal++
		hashVal %= len(table.hashArray)
	}
	return false
}

func (table *HashTable) insert(key int) {
	item := DataItem{key}
	hashVal := table.hash(key)
	for table.hashArray[hashVal] != nil && table.hashArray[hashVal] != table.deleted {
		hashVal++
		hashVal %= len(table.hashArray)
	}
	table.hashArray[hashVal] = &item
}

func (table *HashTable) delete(key int) int {
	hashVal := table.hash(key)
	for table.hashArray[hashVal] != nil {
		if table.hashArray[hashVal].key == key {
			val := table.hashArray[hashVal].key
			table.hashArray[hashVal] = table.deleted
			return val
		}
		hashVal++
		hashVal %= len(table.hashArray)
	}
	return table.deleted.key
}
