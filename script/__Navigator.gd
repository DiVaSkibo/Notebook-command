class_name Navigator extends CharacterBody2D

	#region	Vars
@export var speed :float = 300
@export var target :Node2D:
	set(x):
		target = x
		navagent.target_position = target.position

@onready var navagent := $NavigationAgent2D as NavigationAgent2D
#endregion

	#region	Funcs
func _physics_process(_delta: float) -> void:
	if navagent.is_navigation_finished(): return
	velocity = speed * global_position.direction_to(navagent.get_next_path_position())
	move_and_slide()

func is_on_target(of :Node2D = target) -> bool:
	return of.position == position
#endregion
