extends Node2D


func _ready() -> void:
	if not Handler.isDone['ShiushinStart']:
		Dialogic.start('tlShiushinStart')
		Handler.isDone['ShiushinStart'] = true
	if Handler.isDone['upShiushin']: get_children().filter(func(x): return x.name.begins_with('Shiushin')).front().hide()
	if Handler.isDone['boughtRum']: get_children().filter(func(x): return x.name.begins_with('Rum')).front().hide()
