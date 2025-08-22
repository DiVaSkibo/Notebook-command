extends Node2D

@export var left_scene :StringName = '_Map'
@export var right_scene :StringName = '_Map'


func _on_left_area_body_entered(body: Node2D) -> void:
	if body is Fiuf:
		get_tree().call_deferred('change_scene_to_file', 'Scene/' + left_scene + '.tscn')
		print()
		print('\t\t' + '_'.repeat(left_scene.length() + 4))
		print('\t\t| ', left_scene, ' |')
func _on_right_area_body_entered(body: Node2D) -> void:
	if body is Fiuf:
		get_tree().call_deferred('change_scene_to_file', 'Scene/' + right_scene + '.tscn')
		print()
		print('\t\t' + '_'.repeat(right_scene.length() + 4))
		print('\t\t| ', right_scene, ' |')
