package main

type Queue struct {
	array []interface{}
}

func MakeQueue() Queue {
	return Queue{make([]interface{}, 0)}
}

func (q Queue) isEmpty() bool {
	if q.array == nil {
		return true
	}
	return len(q.array) == 0
}

func (q *Queue) enqueue(item interface{}) {
	if q.array == nil {
		q.array = make([]interface{}, 0)
	}
	q.array = append(q.array, item)
}

func (q *Queue) dequeue() interface{} {
	if q.isEmpty() {
		return nil
	}
	val := q.array[0]
	q.array = q.array[1:]
	return val
}

func (q Queue) peekFront() interface{} {
	if q.isEmpty() {
		return nil
	}
	return q.array[0]
}
