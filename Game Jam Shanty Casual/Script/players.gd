extends CharacterBody2D

@onready var sprite2D = $Sprite2D
@onready var animation = $AnimationPlayer
@onready var Camera = $Camera2D
@onready var Jump_sound = $JumpSound
@onready var Death_sound = $DeathSound
@onready var Death_Timer = $Death_Timer

const SPEED = 100.0
const RUN_Speed = 150.0
const JUMP_VELOCITY = -300.0
const JUMP_VELOCITY_HIGHER = -350.0

var is_jumped = false
var is_alive = true


var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

var direction

func _ready():
	Death_Timer.connect("timeout", Callable(self, "_on_death_timer_timeout()"))



func _physics_process(delta):
	if is_alive == false:
		return
	
	
	if not is_on_floor():
		velocity.y += gravity * delta
		

	if Input.is_action_just_pressed("Jump") and is_on_floor():
		Jump_sound.play()
		is_jumped = true
		if Input.is_action_pressed("Run"):
			velocity.y = JUMP_VELOCITY_HIGHER
		else:
			velocity.y = JUMP_VELOCITY

	direction = Input.get_axis("Left", "Right")
	if direction:
		if Input.is_action_pressed("Run"):
			velocity.x = direction * RUN_Speed
		else:
			velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	
	move_and_slide()
	update_animation()
	died()
	Levelmanager()

func update_animation():
	if is_alive == false:
		return
	
	if direction != 0:
		animation.play("Walk")
		if direction == -1:
			sprite2D.flip_h = true
		elif direction == 1:
			sprite2D.flip_h = false
	else:
		animation.play("Down")
		pass
	
	if is_jumped:
		animation.play("Jump")
	if is_on_floor():
		is_jumped = false
		
	
	


func Levelmanager():
	Camera.limit_bottom = GameManager.camerafloor
	
	Lvl1manage()
	Lvl2manage()
	pass

func Lvl1manage():
	Camera.limit_right = GameManager.lvl1cameraright
	pass
func Lvl2manage():
	Camera.limit_right = GameManager.lvl2cameraright
	pass

func died():
	if is_alive == false:
		return
	
	if position.y > GameManager.floormax:
		is_alive = false
		animation.play("Death")
		Death_sound.play()
		dead_animation()
		await dead_animation()
		GameManager.Playerdeath = false
		pass

func dead_animation():
	var startpos = position
	var uppos = startpos + Vector2(0, -100)
	var downpos = startpos + Vector2(0, 600)
	
	while position.y > uppos.y:
		position.y -= 4
		await get_tree().create_timer(0.01).timeout
	


func _on_death_timer_timeout():
	GameManager.Playerdeath = false
	pass # Replace with function body.
