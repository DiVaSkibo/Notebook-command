class_name Item extends RigidBody2D

	#region	Vars
@export var resource :ItemResource

var is_focused := false

@onready var sprite := $Sprite2D as Sprite2D
#endregion

	#region	Funcs
func _ready() -> void:
	if resource.sprite: sprite.texture = resource.sprite
	if resource.radius: $CollisionShape2D.shape.radius = resource.radius
	gravity_scale = resource.mass
func _physics_process(_delta: float) -> void:
	if not freeze and not get_contact_count(): sprite.rotation_degrees += 11
func _input(event: InputEvent) -> void:
	if event.is_action_pressed('PickUp'):
		if is_focused:
			freeze = false
			is_focused = false
			sprite.scale -= Vector2(.11, .11)
			apply_force(Vector2(0, -400))
#endregion

	#region	Signals
func _on_mouse_entered() -> void:
	if not freeze: return
	is_focused = true
	sprite.scale += Vector2(.11, .11)
func _on_mouse_exited() -> void:
	if not freeze: return
	is_focused = false
	sprite.scale -= Vector2(.11, .11)
#endregion
