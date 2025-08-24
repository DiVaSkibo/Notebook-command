extends Node2D


func _ready() -> void:
	if not Handler.isDone['upShiushin']: get_children().filter(func(x): return x.name.begins_with('Shiushin')).front().hide()
