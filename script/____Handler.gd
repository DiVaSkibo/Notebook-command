extends Node

const SCENES :Dictionary = {
	'MapScene': preload('res://Scene/MapScene.tscn'),
	'ShipScene': preload('res://Scene/ShipScene.tscn'),
	'ShipWheelScene': preload('res://Scene/ShipWheelScene.tscn'),
	'ShipBowspritScene': preload('res://Scene/ShipBowspritScene.tscn'),
	'BeachScene': preload('res://Scene/BeachScene.tscn'),
	'MarketScene': preload('res://Scene/MarketScene.tscn'),
	'IslandScene': preload('res://Scene/IslandScene.tscn')
}
const ITEM := preload('res://Scene/__Item.tscn')
const ITEMS :Dictionary = {
	'coin': preload('res://Resource/itemCoin.tres'),
	'flute': preload('res://Resource/itemFlute.tres'),
	'rum': preload('res://Resource/itemRum.tres'),
	'bucket': preload('res://Resource/itemBucket.tres'),
	'bucket+water': preload('res://Resource/itemBucket+water.tres')
}

var scene :
	set(x): get_tree().change_scene_to_packed(SCENES[x])
	get: return get_tree().current_scene
var prev_scene :StringName


func _input(event: InputEvent) -> void:
	if event.is_action_pressed('EXIT'): get_tree().quit()
