public class HashTable {

    private int?[] hashArray { get; }

    public HashTable(int initialCapacity) {
        hashArray = new int?[initialCapacity];
    }

    public bool Search(int key) {
        int hash = Hash(key);
        while (hashArray[hash] != null) {
            if (hashArray[hash] == key) {
                return true;
            }
            hash++;
            hash %= hashArray.Length;
        }
        return false;
    }

    public void Insert(int key) {
        int hash = Hash(key);
        while (hashArray[hash] != null) {
            hash++;
            hash %= hashArray.Length;
        }
        hashArray[hash] = key;
    }

    public void Delete(int key) {
        int hash = Hash(key);
        while (hashArray[hash] != null) {
            if (hashArray[hash] == key) {
                hashArray[hash] = null;
                return;
            }
            hash++;
            hash %= hashArray.Length;
        }
    }

    private int Hash(int key) {
        return key % (hashArray.Length);
    }

}