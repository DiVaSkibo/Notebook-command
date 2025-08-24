extends ColorRect

const DURATION := 2.

@onready var tween :Tween


func _ready() -> void:
	tween = create_tween()
	tween.chain().tween_property(self, 'color:a', 0, DURATION)
	tween.tween_callback(hide)
	print('\n\t\t' + '_'.repeat(Handler.scene.name.length() + 4) + '\n\t\t| ', Handler.scene.name, ' |\n')

func quit() -> void:
	show()
	if tween: tween.kill()
	tween = create_tween()
	tween.chain().tween_property(self, 'color:a', 1, DURATION / 2)
	tween.chain().tween_callback(get_tree().quit)
func switch(to :StringName) -> void:
	show()
	Handler.prev_scene = Handler.scene.name
	var wallet_status :Callable
	if to.contains('Map'): wallet_status = Wallet.hide
	else: wallet_status = Wallet.show
	if tween: tween.kill()
	tween = create_tween()
	tween.chain().tween_property(self, 'color:a', 1, DURATION / 2)
	tween.chain().tween_callback(func(): Handler.scene = to)
	tween.parallel().tween_callback(wallet_status)
	tween.chain().tween_property(self, 'color:a', 0, DURATION / 2)
	tween.chain().tween_callback(hide)
	print('\n\t\t' + '_'.repeat(to.length() + 4) + '\n\t\t| ', to, ' |\n')
