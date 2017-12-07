package BinaryTree;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

public class HuffmanTree {

    public Node buildHuffmanTree(HashMap<String, Integer> map) {
        ArrayList<Node> nodeList = new ArrayList<>();
        for (Map.Entry<String, Integer> entry : map.entrySet()) {
            Node tmpNode = new Node(entry.getValue(), entry.getKey());
            nodeList.add(tmpNode);
        }

        Node root = null;

        while (nodeList.size() > 0) {
            nodeList.sort((o1, o2) -> {
                if (o1.key != o2.key) {
                    return Integer.compare(o1.key, o2.key);
                } else {
                    if (o1.value.equals("") && !o2.value.equals("")) {
                        return -1;
                    } else if (!o1.value.equals("") && o2.value.equals("")) {
                        return 1;
                    } else {
                        return o1.value.compareTo(o2.value);
                    }
                }
            });
            Node smallest = nodeList.get(0);
            nodeList.remove(0);
            Node secondSmallest = nodeList.get(0);
            nodeList.remove(0);

            Node sumNode = new Node(smallest.key + secondSmallest.key, "");
            sumNode.left = smallest;
            sumNode.right = secondSmallest;

            if (nodeList.size() == 0) {
                root = sumNode;
            } else {
                nodeList.add(sumNode);
            }
        }

        return root;
    }

    public static void main(String[] args) {

        HashMap<String, Integer> freq = new HashMap<>();
        freq.put("LF", 1);
        freq.put("U", 1);
        freq.put("T", 1);
        freq.put("Y", 2);
        freq.put("E", 2);
        freq.put("A", 2);
        freq.put("I", 3);
        freq.put("SP", 4);
        freq.put("S", 6);

        HuffmanTree huffmanTree = new HuffmanTree();
        Node root = huffmanTree.buildHuffmanTree(freq);
        huffmanTree.printTree(root);
    }

    public void printTree(Node root) {
        iterate(root);
    }

    private void iterate(Node node) {
        if (node == null) {
            return;
        }
        System.out.println(node.value + ", " + node.key);
        iterate(node.left);
        iterate(node.right);
    }

    private static class Node {
        private int key;
        private String value;
        private Node left;
        private Node right;

        Node(int key, String value) {
            this.key = key;
            this.value = value;
            left = null;
            right = null;
        }
    }
}
