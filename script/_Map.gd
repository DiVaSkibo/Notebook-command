extends NavigationRegion2D

	#region	Vars
@onready var navigator := $Navigator as Navigator
@onready var locations := $locations as Control
#endregion

	#region	Funcs
func _ready() -> void:
	Wallet.hide()
	for location in locations.get_children():
		location.navigated.connect(_on_location_navigated)
#endregion

	#region	Signals
func _on_location_navigated(to :Location):
	if navigator.is_on_target(to):
		Wallet.show()
		get_tree().change_scene_to_file('Scene/' + to.scene + '.tscn')
		print()
		print('\t\t' + '_'.repeat(to.scene.length() + 4))
		print('\t\t| ', to.scene, ' |')
	else:
		navigator.target = to
#endregion
