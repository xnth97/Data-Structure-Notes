package main

func binarySearch(data []int, key int) int {
	lowerBound := 0
	upperBound := len(data) - 1
	mid := 0
	for lowerBound <= upperBound {
		mid = lowerBound + (upperBound-lowerBound)/2
		if data[mid] == key {
			return mid
		} else if data[mid] < key {
			lowerBound = mid + 1
		} else {
			upperBound = mid - 1
		}
	}
	return -1
}
