extends Node2D


func _ready() -> void:
	if not Handler.isDone['BiobStart']:
		Dialogic.start('tlBiobStart')
		Handler.isDone['BiobStart'] = true
