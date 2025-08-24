extends Control

signal item_taken(item :Item)

	#region	Vars
@export var is_shown := false:
	set(x):
		is_shown = x
		if is_shown: animation_player.play('useWallet')
		else: animation_player.play_backwards('useWallet')
@export var items :Array[ItemResource] = []

static var _index := -1:
	get:
		_index += 1
		return _index

@onready var center_conteiner := $CenterContainer as CenterContainer
@onready var listview := $CenterContainer/ListView as HBoxContainer
@onready var animation_player := $AnimationPlayer as AnimationPlayer
@onready var pocket := $Pocket as TextureButton
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
	if is_out and what.get_parent() is CenterContainer:
		var erasecontainer = what.get_parent()
		erasecontainer.remove_child(what)
		listview.remove_child(erasecontainer)
		Handler.scene.add_child(what)
	elif not is_out:
		what.get_parent().remove_child(what)
		var container := CenterContainer.new()
		container.name = 'container' + str(_index)
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

func _on_pocket_pressed() -> void:
	is_shown = not is_shown
	await animation_player.animation_finished

func _on_put_in_area_body_entered(body: Node2D) -> void:
	if body is not Item: return
	append(body)
#endregion
