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
