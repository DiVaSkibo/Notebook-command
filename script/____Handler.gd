extends Node

const ITEM := preload('res://Scene/__Item.tscn')
const ITEMS :Dictionary = {
	'coin': preload('res://Resource/itemCoin.tres'),
	'flute': preload('res://Resource/itemFlute.tres'),
	'rum': preload('res://Resource/itemRum.tres'),
	'bucket': preload('res://Resource/itemBucket.tres'),
	'bucket+water': preload('res://Resource/itemBucket+water.tres')
}

var scene :Node = null


func _input(event: InputEvent) -> void:
	if event.is_action_pressed('EXIT'): get_tree().quit()
