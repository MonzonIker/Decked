extends Node2D

signal lose_game

var points = 3

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$h1.play("gain")
	$h2.play("gain")
	$h3.play("gain")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func lose_life():
	points -= 1
	match points:
		2:
			$h3.play("lose")
		1: 
			$h2.play("lose")
		0:
			$h1.play("lose")
			await get_tree().create_timer(2).timeout
			emit_signal("lose_game")
