extends Area2D


func _on_area_entered(area: Area2D) -> void:
	get_tree().current_scene.get_child(0).add_mana()
	$AnimationPlayer.play("pickup")
