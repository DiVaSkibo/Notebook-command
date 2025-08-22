class_name Navigator extends CharacterBody2D

	#region	Vars
@export var speed :float = 300
@export var target :Location:
	set(x):
		if x == target: return
		target = x
		navagent.target_position = target.coordinates

@onready var navagent := $NavigationAgent2D as NavigationAgent2D
@onready var tween :Tween
#endregion

	#region	Funcs
func _physics_process(_delta: float) -> void:
	if navagent.is_navigation_finished():
		if tween: tween.kill()
		tween = create_tween()
		tween.tween_property(self, 'skew', 0, .1)
		tween.tween_callback(tween.kill)
		return
	velocity = speed * global_position.direction_to(navagent.get_next_path_position())
	if not tween.is_running():
		tween = create_tween().set_loops()
		tween.chain().tween_property(self, 'skew', deg_to_rad(22), .07)
		tween.chain().tween_property(self, 'skew', deg_to_rad(-22), .07)
	move_and_slide()

func is_on_target(of :Location = target) -> bool:
	return target == of and navagent.is_navigation_finished()
#endregion
