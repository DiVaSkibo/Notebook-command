extends Node2D


func _ready() -> void:
	if not Handler.isDone['BibeniStart']:
		Dialogic.start('tlBibeniStart')
		Handler.isDone['BibeniStart'] = true
