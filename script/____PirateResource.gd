class_name PirateResource extends Resource

@export var name :StringName
@export var sprite :Texture2D
@export var shape :Shape2D


func interact(with :StringName) -> void:
	match with:
		'Shiushin': if Handler.isDone['boughtRum']:
			if Handler.scene.name.begins_with('Market'): Dialogic.start('tlShiushinUp')
		'Bibeni':
			if Handler.isDone['upBibeni']:
				if Handler.scene.name.begins_with('Island'): Dialogic.start('tlBibeniUp')
				elif not Handler.isDone['gotBucket']: Dialogic.start('tlBibeniBucket')
		'Y': if Handler.isDone['upY']:
			if Handler.scene.name.begins_with('Beach'): Dialogic.start('tlYUp')
		'Biob':
			Dialogic.VAR.set_variable('IsTeamUp', Handler.isDone['upShiushin'] and Handler.isDone['upBibeni'] and Handler.isDone['upY'])
			Dialogic.start('tlBiobUp')
