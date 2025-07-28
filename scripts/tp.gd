extends Area2D

func _on_mouse_entered() -> void:
	$AnimatedSprite2D.play("hover")

func _on_mouse_exited() -> void:
	$AnimatedSprite2D.play("default")

func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event.is_action("left_click"):
		var pos = 0
		match name:
			"tp_left":
				
				$"..".position.x += -32
			"tp_right":
				$"..".position.x += 32
			"tp_up":
				$"..".position.y += -32
			"tp_down":
				$"..".position.y += 32
		$"..".mana += -1
		$"..".emit_signal("consume_mana")
		$"..".end_tp()
