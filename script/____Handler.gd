extends Node

	#region	Vars
const SCENES :Dictionary = {
	'MapScene': preload('res://Scene/MapScene.tscn'),
	'ShipScene': preload('res://Scene/ShipScene.tscn'),
	'ShipWheelScene': preload('res://Scene/ShipWheelScene.tscn'),
	'ShipBowspritScene': preload('res://Scene/ShipBowspritScene.tscn'),
	'BeachScene': preload('res://Scene/BeachScene.tscn'),
	'MarketScene': preload('res://Scene/MarketScene.tscn'),
	'IslandScene': preload('res://Scene/IslandScene.tscn'),
	'Final': preload('res://Scene/Final.tscn')
}
const ITEM := preload('res://Scene/__Item.tscn')
const ITEMS :Dictionary = {
	'coin': preload('res://Resource/itemCoin.tres'),
	'flute': preload('res://Resource/itemFlute.tres'),
	'rum': preload('res://Resource/itemRum.tres'),
	'bucket': preload('res://Resource/itemBucket.tres'),
	'bucket+water': preload('res://Resource/itemBucket+water.tres')
}
const PIRATE := preload('res://Scene/__Pirate.tscn')
const PIRATES :Dictionary = {
	'Biob': preload('res://Resource/pirateBiob.tres'),
	'Shiushin': preload('res://Resource/pirateShiushin.tres'),
	'Bibeni': preload('res://Resource/pirateBibeni.tres'),
	'Y': preload('res://Resource/pirateY.tres')
}

@export var isDone :Dictionary = {
	'BiobStart': false,
	'gotFlute': false,
	'YzzzStart': false,
	'BibeniStart': false,
	'ShiushinStart': false,
	'boughtRum': false,
	'gotBucket': false,
	'upShiushin': false,
	'upBibeni': false,
	'upY': false,
}

var scene :
	set(x): get_tree().change_scene_to_packed(SCENES[x])
	get: return get_tree().current_scene
var prev_scene :StringName
#endregion

	#region	Funcs
func _input(event: InputEvent) -> void:
	if event.is_action_pressed('EXIT'): get_tree().quit()

func sail() -> void:
	Transition.switch('Final')
#endregion
