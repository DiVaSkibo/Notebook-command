extends Node2D


func _ready() -> void:
	if not Handler.isDone['upBibeni']: get_children().filter(func(x): return x.name.begins_with('Bibeni')).front().hide()
	if Handler.isDone['gotFlute']: get_children().filter(func(x): return x.name.begins_with('Flute')).front().hide()
	if not Handler.isDone['upBibeni'] or Handler.isDone['gotBucket']: get_children().filter(func(x): return x.name.begins_with('Bucket')).front().hide()
