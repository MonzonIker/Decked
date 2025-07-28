extends Node

var list = [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15]

func getRandomPos():
	
	var createed = false
	while createed == false:
		var tile = get_tree().current_scene.get_child(1).get_child(list.pick_random())
	
		var x = tile.position.x +8
		var y = tile.position.y +8
		
		if !tile.ocupied:
			tile.ocupied=true
			return Vector2(x,y) #* 16 / 2
		

func pop_trap():
	await get_tree().create_timer(0.5).timeout
	var trapScene = load("res://scenes/fire_trap.tscn")
	var trapInstance = trapScene.instantiate()
	trapInstance.global_transform.origin =  getRandomPos()
	var trapssNode = get_tree().current_scene.get_child(0).get_child(0)
	trapssNode.add_child(trapInstance)
