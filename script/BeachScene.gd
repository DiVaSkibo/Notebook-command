extends Node2D


func _ready() -> void:
	if not Handler.isDone['YzzzStart']:
		Dialogic.start('tlYzzz')
		Handler.isDone['YzzzStart'] = true
