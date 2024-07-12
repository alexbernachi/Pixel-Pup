extends Area2D

@onready var AnimSprite = $AnimatedSprite2D


func _process(delta):
	AnimSprite.play("twisting")

func _on_body_entered(body):
	AudioManager.Collect_Sound.play()
	GameManager.TotalCoins += 1
	queue_free()
