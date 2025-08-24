extends Node2D


func _ready() -> void:
	if not Handler.isDone['YzzzStart']:
		Dialogic.start('tlYzzzStart')
		Handler.isDone['YzzzStart'] = true
	if Handler.isDone['upY']: get_children().filter(func(x): return x.name.begins_with('Y')).front().hide()
