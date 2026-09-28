extends Node

#creating variables fro reasearch points based on button clicks
var points: int = 0

func add_points():
	points += 1

func sub_points(n: int):
	points -= n
