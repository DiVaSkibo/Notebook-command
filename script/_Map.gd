extends NavigationRegion2D

	#region	Vars
@onready var navigator := $Navigator as Navigator
@onready var locations := $locations as Control
#endregion

	#region	Funcs
func _ready() -> void:
	Wallet.is_shown = false
	Wallet.hide()
	for location in locations.get_children():
		location.navigated.connect(_on_location_navigated)
#endregion

	#region	Signals
func _on_location_navigated(to :Location):
	if navigator.is_on_target(to): Transition.switch(to.scene)
	else: navigator.target = to
#endregion
