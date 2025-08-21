class_name InteractorResource extends Resource

enum Result { coin, rum, bucket_water, upyi, upbibeni, upshiushin }

@export var key :ItemResource
@export var result :Result
@export var sprite_frames :SpriteFrames

func lead(to :Result) -> void:
	match to:
		Result.coin: pass
		Result.rum: pass
		Result.bucket_water: pass
		Result.upyi: pass
		Result.upbibeni: pass
		Result.upshiushin: pass
	print(to)
