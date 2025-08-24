extends Node2D

@export var left_scene :StringName = '_Map'
@export var right_scene :StringName = '_Map'


func _on_left_area_body_entered(body: Node2D) -> void:
	if body is Fiuf: Transition.switch(left_scene)
func _on_right_area_body_entered(body: Node2D) -> void:
	if body is Fiuf: Transition.switch(right_scene)
