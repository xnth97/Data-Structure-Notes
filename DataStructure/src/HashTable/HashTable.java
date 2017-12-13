package HashTable;

public class HashTable implements HashTableInterface {
    private static final DataItem DELETED = new DataItem(-1);
    private DataItem[] hashArray;

    public HashTable(int initialCapacity) {
        hashArray = new DataItem[initialCapacity];
    }

    private int hashFunc(int key) {
        return key % hashArray.length;
    }

    @Override
    public boolean search(int key) {
        int hashVal = hashFunc(key);
        while (hashArray[hashVal] != null) {
            if (hashArray[hashVal].key == key) {
                return true;
            }
            hashVal ++;
            hashVal %= hashArray.length;
        }
        return false;
    }

    @Override
    public int delete(int key) {
        int hashVal = hashFunc(key);
        while (hashArray[hashVal] != null) {
            if (hashArray[hashVal].key == key) {
                // should return value from data structure
                int val = hashArray[hashVal].key;
                hashArray[hashVal] = DELETED;
                return val;
            }
            hashVal ++;
            hashVal %= hashArray.length;
        }
        return -1;
    }

    @Override
    public void insert(int key) {
        DataItem item = new DataItem(key);
        int hashVal = hashFunc(key);

        while (hashArray[hashVal] != null && hashArray[hashVal] != DELETED) {
            hashVal ++;
            hashVal %= hashArray.length;
        }
        hashArray[hashVal] = item;
    }

    private static class DataItem {
        private int key;

        DataItem(int key) {
            this.key = key;
        }
    }
}
