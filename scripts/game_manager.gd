extends Node

var score = 0

func add_point():
		score += 1
		%point_score_text.text=str(score)
