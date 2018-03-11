def binary_search(data: [int], key: int) -> int:
    lower_bound = 0
    upper_bound = len(data) - 1
    mid = 0
    while True:
        if lower_bound > upper_bound:
            return -1
        # 注意：直接使用 (lowerBound + upperBound) / 2 可能导致超出 int 范围溢出
        mid = lower_bound + (upper_bound - lower_bound) / 2
        if data[mid] == key:
            return mid
        elif data[mid] < key:
            lower_bound = mid + 1
        else:
            upper_bound = mid - 1