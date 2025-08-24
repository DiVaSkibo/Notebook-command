class_name InteractorResource extends Resource

enum Result { coin, rum, bucket_water, upyi, upbibeni }

@export var name :StringName
@export var key :ItemResource
@export var result :Result
@export var sprite_frames :SpriteFrames
@export var shape :Shape2D
@export var scale :Vector2


func lead(to :Result, on :Vector2 = Vector2.ZERO) -> void:
	var object
	if to in [Result.coin, Result.rum, Result.bucket_water]: object = Handler.ITEM.instantiate()
	else: object = Handler.PIRATE.instantiate()
	match to:
		Result.coin: object.resource = Handler.ITEMS['coin']
		Result.rum: object.resource = Handler.ITEMS['rum']
		Result.bucket_water: object.resource = Handler.ITEMS['bucket+water']
		Result.upyi: object.resource = Handler.PIRATES['Y']
		Result.upbibeni: object.resource = Handler.PIRATES['Bibeni']
	object.position = on
	Handler.scene.add_child(object)
