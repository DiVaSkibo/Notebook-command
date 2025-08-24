extends Node2D

@onready var animated_sprite := $AnimatedSprite2D as AnimatedSprite2D
@onready var timer := $Timer as Timer


func _ready() -> void:
	Wallet.hide()
	await timer.timeout
	animated_sprite.frame += 1
	timer.start()
	await timer.timeout
	animated_sprite.frame += 1
	timer.wait_time = 11
	timer.start()
	await timer.timeout
	Transition.quit()
