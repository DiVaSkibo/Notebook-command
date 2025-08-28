extends Node

	#region	Vars
const SCENES :Dictionary = {
	'MapScene': preload('uid://innu512naocq'),
	'ShipScene': preload('uid://bt450mc7wr8v'),
	'ShipWheelScene': preload('uid://dvlqy7np371ua'),
	'ShipBowspritScene': preload('uid://ekttktxh6y23'),
	'BeachScene': preload('uid://m78kv4rekawj'),
	'MarketScene': preload('uid://s74m2cucrlhg'),
	'IslandScene': preload('uid://cchr3ex55lvmr'),
	'Final': preload('uid://cchpvxvf38lt8')
}
const ITEM := preload('uid://c28ajc76tvb0r')
const ITEMS :Dictionary = {
	'coin': preload('uid://d3d426if74gdh'),
	'flute': preload('uid://dhdvoha6a75lj'),
	'rum': preload('uid://ccqbqvdoyja6j'),
	'bucket': preload('uid://dqmyocw3qmakb'),
	'bucket+water': preload('uid://c6lec34preqcl')
}
const PIRATE := preload('uid://cgd4eoxo8eqlm')
const PIRATES :Dictionary = {
	'Biob': preload('uid://b7k3d2ytd74lu'),
	'Shiushin': preload('uid://uerqbr5j7uyj'),
	'Bibeni': preload('uid://bufpkp3jdva1v'),
	'Y': preload('uid://c4yodj6cpkwc3')
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
