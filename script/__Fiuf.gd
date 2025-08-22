extends CharacterBody2D

	#region	Vars
@export var speed :float = 300

@onready var tween :Tween
#endregion

	#region	Funcs
func _physics_process(_delta: float) -> void:
	var direction = Input.get_axis('moveLeft', 'moveRight')
	if direction:
		velocity = Vector2(speed * direction, 0)
		if not tween.is_running():
			tween = create_tween().set_loops()
			tween.chain().tween_property(self, 'skew', deg_to_rad(11), .1)
			tween.chain().tween_property(self, 'skew', deg_to_rad(-11), .1)
	else:
		velocity = Vector2(move_toward(velocity.x, 0, speed), move_toward(velocity.y, 0, speed))
		if tween: tween.kill()
		tween = create_tween()
		tween.tween_property(self, 'skew', 0, .1)
		tween.tween_callback(tween.kill)
	move_and_slide()
#endregion
