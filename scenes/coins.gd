extends Node

var listX = [-1,1,3,5]
var listY = [-3,-1,1,3]
var ocupied = [Vector2(-1,3)]

func getRandomPos():
	
	var x = listX.pick_random()
	var y = listY.pick_random()
	var createed = false
	while createed == false:
		x = listX.pick_random()
		y = listY.pick_random()
		
		print("array: "+str(ocupied.find(Vector2(x,y))))
		
		if ocupied.find(Vector2(x,y)) == -1:
			ocupied.clear()
			ocupied.append(Vector2(x,y))
			return Vector2(x,y) * 16 / 2

func pop_coin():
	await get_tree().create_timer(0.5).timeout
	var coinScene = load("res://scenes/coin.tscn")
	var coinInstance = coinScene.instantiate()
	call_deferred("add_child",coinInstance)
	coinInstance.global_transform.origin =  getRandomPos()
	
