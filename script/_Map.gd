class_name Map extends NavigationRegion2D

	#region	Vars
@onready var navigator := $Navigator as Navigator
@onready var locations := $locations as Control
@onready var LOCATION :Dictionary[StringName, Location] = {
	'ShipBowspritScene': locations.get_node('Ship'),
	'BeachScene': locations.get_node('Beach'),
	'MarketScene': locations.get_node('Market'),
	'IslandScene': locations.get_node('Island')
}
#endregion

	#region	Funcs
func _ready() -> void:
	Wallet.is_shown = false
	Wallet.hide()
	for location in locations.get_children():
		location.navigated.connect(_on_location_navigated)

func spawn(on :StringName) -> void:
	navigator.position = LOCATION[on].get_node('Marker2D').global_position
#endregion

	#region	Signals
func _on_location_navigated(to :Location):
	if navigator.is_on_target(to): Transition.switch(to.scene)
	else: navigator.target = to
#endregion
