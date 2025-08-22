class_name Pirate extends CharacterBody2D

	#region	Vars
@export var resource :PirateResource

@onready var sprite := $Sprite2D as Sprite2D
#endregion

	#region	Funcs
func _ready() -> void:
	name = resource.name + str(randi() % 11)
	if resource.sprite: sprite.texture = resource.sprite
	if resource.shape: $CollisionShape2D.shape = resource.shape
#endregion

	#region	Signals
#endregion
