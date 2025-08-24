extends Node2D


func _ready() -> void:
	if not Handler.isDone['BibeniStart']:
		Dialogic.start('tlBibeniStart')
		Handler.isDone['BibeniStart'] = true
	if Handler.isDone['upBibeni']: get_children().filter(func(x): return x.name.begins_with('Bibeni')).front().hide()
