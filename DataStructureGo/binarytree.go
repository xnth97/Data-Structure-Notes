package main

type TreeNode struct {
	key   int
	value interface{}
	left  *TreeNode
	right *TreeNode
}

func MakeTreeNode(key int, value interface{}) TreeNode {
	return TreeNode{key, value, nil, nil}
}

type BinarySearchTree struct {
	root *TreeNode
}

func MakeBinarySearchTree() BinarySearchTree {
	return BinarySearchTree{nil}
}

func (tree *BinarySearchTree) find(key int) bool {
	if tree.root == nil {
		return false
	}
	curr := tree.root
	for curr.key != key {
		if curr.key < key {
			curr = curr.right
		} else {
			curr = curr.left
		}
		if curr == nil {
			return false
		}
	}
	return true
}

func (tree *BinarySearchTree) insert(key int, value interface{}) {
	node := MakeTreeNode(key, value)
	if tree.root == nil {
		tree.root = &node
		return
	}
	parent := tree.root
	curr := tree.root
	for {
		if curr.key == key {
			return
		}
		parent = curr
		if curr.key < key {
			curr = curr.right
			if curr == nil {
				parent.right = &node
				return
			}
		} else {
			curr = curr.left
			if curr == nil {
				parent.left = &node
				return
			}
		}
	}
}

func (tree *BinarySearchTree) delete(key int) {
	if tree.root == nil {
		return
	}
	parent := tree.root
	curr := tree.root
	isLeftChild := false
	for curr.key != key {
		parent = curr
		if curr.key > key {
			isLeftChild = true
			curr = curr.left
		} else {
			isLeftChild = false
			curr = curr.right
		}
		if curr == nil {
			return
		}
		if curr.left == nil && curr.right == nil {
			if curr == tree.root {
				return
			}
			if isLeftChild {
				parent.left = nil
			} else {
				parent.right = nil
			}
		} else if curr.right == nil {
			if curr == tree.root {
				return
			}
			if isLeftChild {
				parent.left = curr.left
			} else {
				parent.right = curr.left
			}
		} else if curr.left == nil {
			if curr == tree.root {
				return
			}
			if isLeftChild {
				parent.left = curr.right
			} else {
				parent.right = curr.right
			}
		} else {
			successor := tree.getSuccessor(curr)
			if curr == tree.root {
				tree.root = successor
			} else if isLeftChild {
				parent.left = successor
			} else {
				parent.right = successor
			}
			successor.left = curr.left
		}
	}
}

func (tree *BinarySearchTree) getSuccessor(toDelete *TreeNode) *TreeNode {
	parent := toDelete
	successor := toDelete
	curr := toDelete.right
	for curr != nil {
		parent = successor
		successor = curr
		curr = curr.left
	}
	if successor != toDelete.right {
		parent.left = successor.right
		successor.right = toDelete.right
	}
	return successor
}

// DFS traverse
func DFSTraverse(tree *BinarySearchTree) []int {
	ret := make([]int, 0)
	inOrder(&ret, tree.root)
	return ret
}

func inOrder(ret *[]int, node *TreeNode) {
	if node == nil {
		return
	}
	inOrder(ret, node.left)
	*ret = append(*ret, node.key)
	inOrder(ret, node.right)
}

// BFS traverse
func BFSTraverse(tree *BinarySearchTree) []int {
	ret := make([]int, 0)
	if tree.root == nil {
		return ret
	}
	queue := []*TreeNode{tree.root}
	for i := 0; i < len(queue); i++ {
		node := queue[i]
		ret = append(ret, node.key)
		if node.left != nil {
			queue = append(queue, node.left)
		}
		if node.right != nil {
			queue = append(queue, node.right)
		}
	}
	return ret
}
