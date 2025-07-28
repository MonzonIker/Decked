extends Node

var score = 0
var turn = 0

func _ready() -> void:
	%coins.pop_coin()
	
	
func add_point():
		score += 1
		if score < 2:
			%point_score_text.text=str(score)
			%coins.pop_coin()
		elif score == 2:
			%controls.banish()
			%point_score_text.text=str(score)
			%coins.pop_coin()
			%coins.pop_mana()
		elif score == 4:
			%point_score_text.text=str(score)
			%coins.pop_coin()
			$traps.pop_trap()
		else:
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


func _on_player_moved() -> void:
	$"../player/Camera2D/ProgressBar".value -=1
	$"../player/Camera2D/ProgressBar/Label".text=str(%player.movement)+"/3"


func _on_turn_pressed() -> void:
	turn += 1
	activate_traps()
	$"../player/Camera2D/turn_text/actual_turn".text=str(turn)
	$"../player/Camera2D/ProgressBar".value =3
	%player.movement=3
	$"../player/Camera2D/ProgressBar/Label".text=str(%player.movement)+"/3"

func activate_traps():
	for trap in get_tree().current_scene.get_child(0).get_child(0).get_children():
		trap.activate()


func _on_life_bar_lose_game() -> void:
	get_tree().change_scene_to_file("res://scenes/menu.tscn")


func _on_player_damage() -> void:
	$"../player/Camera2D/life_bar".lose_life()
