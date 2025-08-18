class_name Item extends RigidBody2D

	#region	Vars
@export var resource :ItemResource

var is_focused := false

@onready var sprite := $Sprite2D as Sprite2D
#endregion

	#region	Funcs
func _ready() -> void:
	if resource.sprite: sprite.texture = resource.sprite
	if resource.shape: $CollisionShape2D.shape = resource.shape
	mass = resource.mass
	if resource.physics_material: physics_material_override = resource.physics_material
func _input(event: InputEvent) -> void:
	if event.is_action_pressed('PickUp'):
		print(' |: ', self, ' is picked up')
#endregion

	#region	Signals
func _on_mouse_entered() -> void:
	is_focused = true
func _on_mouse_exited() -> void:
	is_focused = false
#endregion
