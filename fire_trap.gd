extends Node2D


func activate():
	$AnimatedSprite2D.play("default")
	await get_tree().create_timer(1).timeout
	$Area2D/CollisionShape2D.disabled=false
	await get_tree().create_timer(1).timeout
	$Area2D/CollisionShape2D.disabled=true


	
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$AnimatedSprite2D.play("default")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
