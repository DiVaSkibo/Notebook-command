extends NavigationRegion2D

	#region	Vars
@onready var locations :Dictionary = {
	'mar0': $Marker2D,
	'mar1': $Marker2D2,
	'mar2': $Marker2D3,
	'mar3': $Marker2D4
}
@onready var navigator := $Navigator as Navigator
#endregion

	#region	Funcs
func _input(event: InputEvent) -> void:
	if event.is_action_pressed('PickUp'):
		navigator.target = locations.values().pick_random()
#endregion
