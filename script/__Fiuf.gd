class_name Fiuf extends CharacterBody2D

	#region	Vars
@export var speed :float = 300

var gravity :float = ProjectSettings.get_setting("physics/2d/default_gravity")

@onready var tween :Tween
#endregion

	#region	Funcs
func _physics_process(_delta: float) -> void:
	if not is_on_floor(): velocity.y += gravity
	var direction = Input.get_axis('moveLeft', 'moveRight')
	if direction:
		velocity.x = speed * direction
		if not tween or not tween.is_running():
				tween = create_tween().set_loops()
				tween.chain().tween_property(self, 'skew', deg_to_rad(11), .11)
				tween.chain().tween_property(self, 'skew', deg_to_rad(-11), .11)
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
		if tween: tween.kill()
		tween = create_tween()
		tween.tween_property(self, 'skew', 0, .11)
		tween.tween_callback(tween.kill)
	move_and_slide()
#endregion
