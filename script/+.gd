extends Node

@onready var marker := $Marker2D as Marker2D

func _on_timer_timeout() -> void:
	var item = load('res://Scene/__Item.tscn').instantiate()
	item.resource = ItemResource.new()
	item.position = marker.position + Vector2(randf_range(-400, 400), 0)
	add_child(item)
