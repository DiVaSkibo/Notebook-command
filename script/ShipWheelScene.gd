extends Node2D


func _ready() -> void:
	if not Handler.isDone['BiobStart']:
		Dialogic.start('tlBiobStart')
		Handler.isDone['BiobStart'] = true
	if not Handler.isDone['upY']: get_children().filter(func(x): return x.name.begins_with('Y')).front().hide()
