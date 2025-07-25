extends Node

var score = 0

func _ready() -> void:
	%coins.pop_coin()
	
func add_point():
		score += 1
		%point_score_text.text=str(score)
		%coins.pop_coin()
