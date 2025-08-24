class_name PirateResource extends Resource

@export var name :StringName
@export var sprite :Texture2D
@export var shape :Shape2D


func interact(with :StringName) -> void:
	match with:
		'Shiushin': if Handler.isDone['boughtRum']: Dialogic.start('tlShiushinUp')
		'Bibeni': if Handler.isDone['boughtRum']: Dialogic.start('tlBibeniUp')
		'Y': if Handler.isDone['boughtRum']: Dialogic.start('tlYUp')
		'Biob':
			Dialogic.VAR.set_variable('IsTeamUp', Handler.isDone['upShiushin'] and Handler.isDone['upBibeni'] and Handler.isDone['upY'])
			Dialogic.start('tlBoibUp')
