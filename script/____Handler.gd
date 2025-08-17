extends Node

func _input(event: InputEvent) -> void:
	if event.is_action_pressed('EXIT'): get_tree().quit()
