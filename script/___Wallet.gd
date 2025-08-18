extends Node2D

	#region	Vars
@export var items :Array[ItemResource] = []
#endregion

	#region	Signals
func _on_put_in_area_body_entered(body: Node2D) -> void:
	if body is Item:
		items.append(body.resource)
		body.queue_free()
		print(' #: ', body, ' is in wallet')
#endregion
