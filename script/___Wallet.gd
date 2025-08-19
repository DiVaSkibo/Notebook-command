extends Control

	#region	Vars
const ITEM := preload('res://Scene/__Item.tscn')

@export var items :Array[ItemResource] = []

@onready var listview := $CenterContainer/ListView as HBoxContainer
#endregion

	#region	Funcs
func append(what :Item) -> void:
	items.append(what.resource)
	var item := ITEM.instantiate()
	item.resource = what.resource
	var container := CenterContainer.new()
	container.add_child(item)
	listview.call_deferred('add_child', container)
#endregion

	#region	Signals
func _on_put_in_area_body_entered(body: Node2D) -> void:
	if body is not Item: return
	if body.resource in items:
		body.back()
	else:
		append(body)
		body.queue_free()
		print(' #: ', body, ' is in wallet')
#endregion
