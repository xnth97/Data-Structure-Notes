package BinaryTree;

public class BinarySearchTree implements BSTInterface {

    private Node root;

    @Override
    public boolean find(int key) {
        if (root == null) {
            return false;
        }
        Node current = root;
        while (current.key != key) {
            if (current.key < key) {
                current = current.right;
            } else {
                current = current.left;
            }
            if (current == null) {
                // not found
                return false;
            }
        }
        return true;
    }

    @Override
    public void insert(int key, Object value) {
        Node newNode = new Node(key, value);
        if (root == null) {
            root = newNode;
            return;
        }

        Node parent = root;
        Node current = root;
        while (true) {
            if (current.key == key) {
                return;
            }
            parent = current;
            if (current.key < key) {
                current = current.right;
                if (current == null) {
                    parent.right = newNode;
                    return;
                }
            } else {
                current = current.left;
                if (current == null) {
                    parent.left = newNode;
                    return;
                }
            }
        }
    }

    @Override
    public void delete(int key) {
        if (root == null) {
            return;
        }
        Node parent = root;
        Node current = root;
        boolean isLeftChild = true;

        while (current.key != key) {
            parent = current;
            if (current.key < key) {
                isLeftChild = false;
                current = current.right;
            } else {
                isLeftChild = true;
                current = current.left;
            }

            // case 1: not found
            if (current == null) {
                return;
            }

            // case 2: a leaf (no children)
            if (current.left == null && current.right == null) {
                if (current == root) {
                    root = null;
                } else if (isLeftChild) {
                    parent.left = null;
                } else {
                    parent.right = null;
                }
            }

            // case 3-1: one child, left only
            else if (current.right == null) {
                if (current == root) {
                    root = current.left;
                } else if (isLeftChild) {
                    parent.left = current.left;
                } else {
                    parent.right = current.left;
                }
            }

            // case 3-2: one child, right only
            else if (current.left == null) {
                if (current == root) {
                    root = current.right;
                } else if (isLeftChild) {
                    parent.left = current.right;
                } else {
                    parent.right = current.right;
                }
            }

            // case 4: two children
            else {
                Node successor = getSuccessor(current);
                if (current == root) {
                    root = successor;
                } else if (isLeftChild) {
                    parent.left = successor;
                } else {
                    parent.right = successor;
                }
                successor.left = current.left;
            }
        }
    }

    @Override
    public void traverse() {
        inOrderHelper(root);
    }

    /**
     * Method to find successor, next-highest key after toDelete.
     * @param toDelete node to delete
     * @return successor node
     */
    private Node getSuccessor(Node toDelete) {
        Node successorParent = toDelete;
        Node successor = toDelete;
        Node current = toDelete.right;

        while (current != null) {
            successorParent = successor;
            successor = current;
            current = current.left;
        }

        if (successor != toDelete.right) {
            successorParent.left = successor.right;
            successor.right = toDelete.right;
        }

        return successor;
    }

    private void inOrderHelper(Node toVisit) {
        if (toVisit != null) {
            inOrderHelper(toVisit.left);
            System.out.println(toVisit);
            inOrderHelper(toVisit.right);
        }
    }

    private static class Node {
        private int key;
        private Object value;
        private Node left;
        private Node right;

        Node(int key, Object value) {
            this.key = key;
            this.value = value;
            left = null;
            right = null;
        }
    }
}
