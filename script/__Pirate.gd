class_name Pirate extends CharacterBody2D

	#region	Vars
const HOVER_SCALE := Vector2(.11, .11)

@export var resource :PirateResource

var is_focused := false

@onready var interact := resource.interact as Callable
@onready var sprite := $Sprite2D as Sprite2D
#endregion

	#region	Funcs
func _ready() -> void:
	name = resource.name + str(randi() % 11)
	if resource.sprite: sprite.texture = resource.sprite
	if resource.shape: $CollisionShape2D.shape = resource.shape
func _input(event: InputEvent) -> void:
	if event.is_action_pressed('Use'):
		if is_focused: interact.call(resource.name)

#endregion

	#region	Signals
func _on_mouse_entered() -> void:
	is_focused = true
	sprite.scale += HOVER_SCALE
func _on_mouse_exited() -> void:
	is_focused = false
	sprite.scale -= HOVER_SCALE
#endregion
