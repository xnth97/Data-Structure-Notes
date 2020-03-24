package main

func BubbleSort(data *[]int) {
	for outIdx := len(*data) - 1; outIdx >= 0; outIdx-- {
		for inIdx := 0; inIdx < len(*data)-1; inIdx++ {
			if (*data)[inIdx] > (*data)[inIdx+1] {
				(*data)[inIdx], (*data)[inIdx+1] = (*data)[inIdx+1], (*data)[inIdx]
			}
		}
	}
}

func SelectionSort(data *[]int) {
	for outIdx := 0; outIdx < len(*data)-1; outIdx++ {
		// set initial min value's index
		minimum := outIdx
		// select a new minimum value's index
		for inIdx := outIdx + 1; inIdx < len(*data); inIdx++ {
			if (*data)[inIdx] < (*data)[minimum] {
				minimum = inIdx
			}
		}
		if outIdx != minimum {
			(*data)[outIdx], (*data)[minimum] = (*data)[minimum], (*data)[outIdx]
		}
	}
}

func InsertionSort(data *[]int) {
	for outIdx := 1; outIdx < len(*data); outIdx++ {
		tmp := (*data)[outIdx]
		inIdx := outIdx
		// go backward in the left side of the line
		// shift the values
		for inIdx > 0 && (*data)[inIdx-1] >= tmp {
			(*data)[inIdx] = (*data)[inIdx-1]
			inIdx--
		}
		if outIdx != inIdx {
			(*data)[inIdx] = tmp
		}
	}
}

func MergeSort(data []int) []int {
	if len(data) <= 1 {
		return data
	}
	mid := int(len(data) / 2)
	// call merge sort on left part
	left := data[:mid]
	left = MergeSort(left)
	// call merge sort on right part
	right := data[mid:]
	right = MergeSort(right)
	// merge two parts
	return merge(left, right)
}

func merge(a []int, b []int) []int {
	if a == nil || len(a) == 0 {
		return b
	}
	if b == nil || len(b) == 0 {
		return a
	}
	merged := make([]int, 0)
	ptr1 := 0
	ptr2 := 0
	for ptr1 < len(a) && ptr2 < len(b) {
		if a[ptr1] < b[ptr2] {
			merged = append(merged, a[ptr1])
			ptr1++
		} else {
			merged = append(merged, b[ptr2])
			ptr2++
		}
	}
	if ptr1 < len(a) {
		merged = append(merged, a[ptr1:]...)
	}
	if ptr2 < len(b) {
		merged = append(merged, b[ptr2:]...)
	}
	return merged
}

func QuickSort(data []int) []int {
	if len(data) <= 1 {
		return data
	}
	// initialize arrays
	left := make([]int, 0)
	right := make([]int, 0)
	// pick pivot value
	pivot := data[0]
	array := data[1:]
	for _, val := range array {
		if val < pivot {
			left = append(left, val)
		} else {
			right = append(right, val)
		}
	}
	return append(append(QuickSort(left), pivot), QuickSort(right)...)
}
