extends Node2D

@onready var tween :Tween
@onready var map := $Map as Map


func _ready() -> void:
	if Handler.prev_scene: map.spawn(Handler.prev_scene)
	tween = create_tween().set_loops().set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_EXPO)
	tween.chain().tween_property($ocean, 'scale', Vector2(1.04, 1.04), 4)
	tween.parallel().tween_property($clouds, 'scale', Vector2(1.04, 1.04), 8)
	tween.parallel().tween_property($moon, 'rotation_degrees', -1.1, 8)
	tween.chain().tween_property($ocean, 'scale', Vector2.ONE, 4)
	tween.parallel().tween_property($clouds, 'scale', Vector2.ONE, 8)
	tween.parallel().tween_property($moon, 'rotation_degrees', 0, 8)
