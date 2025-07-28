extends Button


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass



func _on_pressed() -> void:
	get_tree().current_scene.get_child(4).end_tp()
	visible=false


func _on_player_tp_up() -> void:
	visible=true


func _on_player_tp_used() -> void:
	visible=false
