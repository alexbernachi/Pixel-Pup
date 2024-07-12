extends Area2D




func _on_body_entered(body):
	if body.name == "Players":
		GameManager.HPTotal -=1
		
	pass # Replace with function body.
