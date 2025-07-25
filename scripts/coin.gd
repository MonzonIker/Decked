extends Area2D

func _on_area_entered(area: Area2D) -> void:
	%GameManager.add_point()
	$AnimationPlayer.play("pickup")
