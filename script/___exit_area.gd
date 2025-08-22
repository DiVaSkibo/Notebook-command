class_name ExitArea extends Area2D

@export var scene :StringName = '_Map'


func _on_body_entered(body: Node2D) -> void:
	if body is Fiuf:
		get_tree().call_deferred('change_scene_to_file', 'Scene/' + scene + '.tscn')
		print()
		print('\t\t' + '_'.repeat(scene.length() + 4))
		print('\t\t| ', scene, ' |')
