class_name Location extends TextureButton

signal navigated(to :Location)

	#region	Vars
const HOVER_SCALE := Vector2(.04, .04)

var coordinates:
	get: return position + size / 2

@export var scene :StringName
#endregion

	#region	Signals
func _on_navigated(to :Location): print('-> ', to.scene)
func _on_pressed() -> void:
	navigated.emit(self)

func _on_mouse_entered() -> void:
	scale += HOVER_SCALE
func _on_mouse_exited() -> void:
	scale -= HOVER_SCALE
#endregion
