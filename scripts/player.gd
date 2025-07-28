extends Area2D

signal tp_up
signal tp_used
signal not_enough_mana
signal consume_mana
signal moved
signal damage

var can_move = true
var mana = 0
var movement = 3

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_select"):
		if mana > 0:
			emit_signal("tp_up")
			can_move=false
			$tp_right.visible = true
			$tp_left.visible = true
			$tp_down.visible = true
			$tp_up.visible = true
		else:
			emit_signal("not_enough_mana")
		
func end_tp():
	emit_signal("tp_used")
	can_move=true
	$tp_right.visible = false
	$tp_left.visible = false
	$tp_down.visible = false
	$tp_up.visible = false

func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("kill_zone"):
			get_tree().current_scene.get_child(0).kill_player()
	if area.is_in_group("tile"):
		area.ocupied=true
	if area.is_in_group("trap"):
		print("damage")
		emit_signal("damage")
		
		
func _on_area_exited(area: Area2D) -> void:
	if area.is_in_group("tile"):
		area.ocupied=false


#MOVEMENT
var animation_speed = 2
var moving = false
var tile_size = 16
var inputs = {
	"ui_right": Vector2.RIGHT,
	"ui_left": Vector2.LEFT,
	"ui_up": Vector2.UP,
	"ui_down": Vector2.DOWN
}

@onready var ray = $RayCast2d

func _ready():
	position = position.snapped(Vector2.ZERO * tile_size)
	position += Vector2.ZERO * tile_size / 2
	
func _unhandled_input(event):
	if moving:
		return
	for dir in inputs.keys():
		if event.is_action_pressed(dir) and can_move and movement>0:
			move(dir)
			
			
func move(dir):
	ray.target_position = inputs[dir] * tile_size
	ray.force_raycast_update()
	$AnimatedSprite2D.play(dir)
	if !ray.is_colliding():
		#position += inputs[dir] * tile_size
		var tween = get_tree().create_tween()
		tween.tween_property(self, "position", position + inputs[dir] * tile_size, 1.0/animation_speed).set_trans(Tween.TRANS_SINE)
		moving = true
		await tween.finished
		moving = false
		movement -= 1
		emit_signal("moved")
	$AnimatedSprite2D.play("idle "+dir)
