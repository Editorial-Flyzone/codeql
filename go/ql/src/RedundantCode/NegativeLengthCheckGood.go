package main

func getFirstGood(xs []int) int {
	if len(xs) == 0 {
		panic("No elements provided")
	}
	return xs[0]
}
