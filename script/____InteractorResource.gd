class_name InteractorResource extends Resource

enum Result { coin, rum, bucket_water, upyi, upbibeni, upshiushin }

@export var name :StringName
@export var key :ItemResource
@export var result :Result
@export var sprite_frames :SpriteFrames
@export var shape :Shape2D
@export var scale :Vector2


func lead(to :Result, on :Vector2 = Vector2.ZERO) -> void:
	var item :Item
	if on:
		item = Handler.ITEM.instantiate()
	match to:
		Result.coin: item.resource = Handler.ITEMS['coin']
		Result.rum: item.resource = Handler.ITEMS['rum']
		Result.bucket_water: item.resource = Handler.ITEMS['bucket+water']
		Result.upyi: pass
		Result.upbibeni: pass
		Result.upshiushin: pass
	if on:
		item.position = on
		Handler.scene.add_child(item)
