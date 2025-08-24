class_name Item extends RigidBody2D

signal used

	#region	Vars
const SPIN_DEGREES := 11.
const HOVER_SCALE := Vector2(.11, .11)

@export var resource :ItemResource
@export var is_collected :bool = false

var interactor :Interactor
var is_focused := false
var is_hold := false

@onready var sprite := $Sprite2D as Sprite2D
#endregion

	#region	Funcs
func _ready() -> void:
	name = resource.name + str(randi() % 11)
	if resource.sprite: sprite.texture = resource.sprite
	if resource.shape: $CollisionShape2D.shape = resource.shape
	gravity_scale = resource.mass
func _physics_process(_delta: float) -> void:
	if is_hold: position = get_global_mouse_position()
	if not freeze and not get_contact_count(): sprite.rotation_degrees += SPIN_DEGREES
func _input(event: InputEvent) -> void:
	if not is_focused: return
	if event.is_action_released('Use'):
		if is_collected:
			if interactor:
				if interactor.key == resource: interactor.interacted.emit(self)
				else: put_in()
			else: put_in()
		is_hold = false
	elif event.is_action_pressed('Use'):
		if is_collected:
			Wallet.item_taken.emit(self)
			is_hold = true
		else:
			if name.begins_with('Flute'): Handler.isDone['gotFlute'] = true
			elif name.begins_with('Bucket'): Handler.isDone['gotBucket'] = true
			put_in()

func back() -> void:
	position = Vector2.ZERO
	rotation = 0
	sprite.rotation = 0
	set_deferred('freeze', true)

func use() -> void:
	$Timer.start()
	await  $Timer.timeout
	print('\n\t', self, '  |>  ', interactor, '\n')
	used.emit()
func put_in() -> void:
	freeze = false
	is_focused = false
	sprite.scale -= HOVER_SCALE
	apply_force(Vector2(0, -400))
#endregion

	#region	Signals
func _on_used():
	queue_free()

func _on_mouse_entered() -> void:
	if not freeze: return
	is_focused = true
	sprite.scale += HOVER_SCALE
func _on_mouse_exited() -> void:
	if not freeze: return
	is_focused = false
	sprite.scale -= HOVER_SCALE
#endregion
