class_name Interactor extends Area2D

signal interacted(by: Item)

	#region	Vars
const HOVER_SCALE := Vector2(.11, .11)

@export var resource :InteractorResource

@onready var animated_sprite := $AnimatedSprite2D as AnimatedSprite2D
@onready var key := resource.key as ItemResource
@onready var result := resource.result as InteractorResource.Result
@onready var lead := resource.lead as Callable
#endregion

	#region	Funcs
func _ready() -> void:
	name = resource.name + str(randi() % 11)
	animated_sprite.sprite_frames = resource.sprite_frames
	animated_sprite.play('default')
	if resource.shape: $CollisionShape2D.shape = resource.shape
	if resource.scale: animated_sprite.scale = resource.scale
#endregion

	#region	Signals
func _on_interacted(by :Item):
	if by.resource == key:
		by.use()
		await by.used
		if result in [InteractorResource.Result.coin, InteractorResource.Result.rum, InteractorResource.Result.bucket_water]:
			lead.call(result, position)
		else: lead.call(result)
	else:
		by.put_in()
	if not name.begins_with('Water'): scale += HOVER_SCALE

func _on_body_entered(body: Node2D) -> void:
	if body is Item:
		body.interactor = self
		if not name.begins_with('Water'): scale -= HOVER_SCALE
func _on_body_exited(body: Node2D) -> void:
	if body is Item:
		if body.interactor == self: body.interactor = null
		if not name.begins_with('Water'): scale += HOVER_SCALE
#endregion
