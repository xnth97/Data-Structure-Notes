package main

type Stack struct {
	array []interface{}
}

func MakeStack() Stack {
	return Stack{
		array: make([]interface{}, 0),
	}
}

func (s *Stack) isEmpty() bool {
	if s.array == nil {
		return true
	}
	return len(s.array) == 0
}

func (s *Stack) push(element interface{}) {
	s.array = append(s.array, element)
}

func (s *Stack) pop() interface{} {
	length := len(s.array)
	if length == 0 {
		return nil
	}
	ret := s.array[length-1]
	s.array = s.array[:length-1]
	return ret
}

func (s *Stack) peek() interface{} {
	length := len(s.array)
	if length == 0 {
		return nil
	}
	return s.array[length-1]
}
