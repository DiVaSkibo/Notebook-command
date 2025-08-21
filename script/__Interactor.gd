class_name Interactor extends Area2D

signal interacted(by: Item)

	#region	Vars
@export var resource :InteractorResource

@onready var animated_sprite := $AnimatedSprite2D as AnimatedSprite2D
@onready var key := resource.key as ItemResource
@onready var result := resource.result as InteractorResource.Result
@onready var lead := resource.lead as Callable
#endregion

	#region	Funcs
func _ready() -> void:
	animated_sprite.sprite_frames = resource.sprite_frames
#endregion

	#region	Signals
func _on_interacted(by :Item):
	if by.resource == key:
		by.use()
		await by.used
		lead.bind(result)
	else:
		by.put_in()

func _on_body_entered(body: Node2D) -> void:
	if body is Item: body.interactor = self
func _on_body_exited(body: Node2D) -> void:
	if body is Item: if body.interactor == self: body.interactor = null
#endregion
