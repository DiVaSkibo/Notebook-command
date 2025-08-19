extends Control

signal item_taken(item :Item)

	#region	Vars
@export var items :Array[ItemResource] = []

@onready var listview := $CenterContainer/ListView as HBoxContainer
#endregion

	#region	Funcs
func append(what :Item) -> void:
	if what.resource not in items:
		items.append(what.resource)
		what.is_collected = true
		print(' #: ', what, ' is in wallet')
	move(what, false)
	what.back()
func move(what :Item, is_out :bool = true) -> void:
	if is_out:
		var erasenode = listview.get_children().filter(func(x:Node): return x.has_node(what.get_path())).front() as CenterContainer
		erasenode.remove_child(what)
		listview.remove_child(erasenode)
		add_child(what)
	else:
		var container := CenterContainer.new()
		what.get_parent().remove_child(what)
		container.add_child(what)
		listview.call_deferred('add_child', container)
func erase(what :Item) -> void:
	items.erase(what.resource)
	var erasenode = listview.get_children().any(func(x:Node): return x.has_node(what.get_path()))
	listview.remove_child(erasenode)
	what.queue_free()
#endregion

	#region	Signals
func _on_item_taken(item :Item):
	move(item)

func _on_put_in_area_body_entered(body: Node2D) -> void:
	if body is not Item: return
	append(body)
#endregion
