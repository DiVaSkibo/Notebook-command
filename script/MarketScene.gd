extends Node2D


func _ready() -> void:
	if not Handler.isDone['ShiushinStart']:
		Dialogic.start('tlShiushinStart')
		Handler.isDone['ShiushinStart'] = true
