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
		

func pop_coin():
	await get_tree().create_timer(0.5).timeout
	var coinScene = load("res://scenes/coin.tscn")
	var coinInstance = coinScene.instantiate()
	coinInstance.global_transform.origin =  getRandomPos()
	var coinsNode = get_tree().current_scene.get_child(2)
	coinsNode.add_child(coinInstance)
	
func pop_mana():
	await get_tree().create_timer(0.5).timeout
	var manaScene = load("res://scenes/mana.tscn")
	var manaInstance = manaScene.instantiate()
	manaInstance.global_transform.origin =  getRandomPos()
	var manasNode = get_tree().current_scene.get_child(2)
	manasNode.add_child(manaInstance)
	
