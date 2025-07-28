extends Node

var score = 0

func _ready() -> void:
	%coins.pop_coin()
	
func add_point():
		score += 1
		if score < 3:
			%point_score_text.text=str(score)
			%coins.pop_coin()
		elif score == 3:
			%controls.banish()
			%point_score_text.text=str(score)
			%coins.pop_coin()
			%coins.pop_mana()
		else:
			%controls.banish()
			%point_score_text.text=str(score)
			%coins.pop_coin()

func add_mana():
	%player.mana += 1
	%mana_text.text=str(%player.mana)
	%coins.pop_mana()

func _on_player_not_enough_mana() -> void:
	%warnings.visible=true
	%warnings.text="NOT ENOUGH MANA"
	await get_tree().create_timer(2).timeout
	%warnings.visible=false

func _on_player_consume_mana() -> void:
	%mana_text.text=str(%player.mana)


func kill_player():
	get_tree().change_scene_to_file("res://scenes/menu.tscn")
