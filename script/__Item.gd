class_name Item extends RigidBody2D

	#region	Vars
const SPIN_DEGREES := 11.
const HOVER_SCALE := Vector2(.11, .11)

@export var resource :ItemResource
@export var is_collected :bool = true

var is_focused := false
var is_hold := false

@onready var sprite := $Sprite2D as Sprite2D
#endregion

	#region	Funcs
func _ready() -> void:
	if resource.sprite: sprite.texture = resource.sprite
	if resource.radius: $CollisionShape2D.shape.radius = resource.radius
	gravity_scale = resource.mass
func _physics_process(_delta: float) -> void:
	if is_hold: position = get_global_mouse_position()
	if not freeze and not get_contact_count(): sprite.rotation_degrees += SPIN_DEGREES
func _input(event: InputEvent) -> void:
	if not is_focused: return
	if event.is_action_released('PickUp'):
		if is_collected:
			put_in()
			is_hold = false
	elif event.is_action_pressed('PickUp'):
		if is_collected:
			Wallet.item_taken.emit(self)
			is_hold = true
		else: put_in()

func back() -> void:
	position = Vector2.ZERO
	rotation = 0
	sprite.rotation = 0
	set_deferred('freeze', true)
func put_in() -> void:
	freeze = false
	is_focused = false
	sprite.scale -= HOVER_SCALE
	apply_force(Vector2(0, -400))
#endregion

	#region	Signals
func _on_mouse_entered() -> void:
	if not freeze: return
	is_focused = true
	sprite.scale += HOVER_SCALE
func _on_mouse_exited() -> void:
	if not freeze: return
	is_focused = false
	sprite.scale -= HOVER_SCALE
#endregion
