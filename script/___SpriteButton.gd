class_name SpriteButton extends Area2D

signal pressed


const HOVER_SCALE := Vector2(.08, .08)

var is_focused := false

@onready var sprite := $Sprite2D as Sprite2D


func _input(event: InputEvent) -> void:
	if event.is_action_released('Use'):
		if is_focused: sprite.scale += HOVER_SCALE
	if event.is_action_pressed('Use'):
		if is_focused:
			pressed.emit()
			sprite.scale -= HOVER_SCALE


func _on_mouse_entered() -> void:
	is_focused = true
	sprite.scale += HOVER_SCALE
func _on_mouse_exited() -> void:
	is_focused = false
	sprite.scale -= HOVER_SCALE
