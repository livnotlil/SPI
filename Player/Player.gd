extends KinematicBody2D

var movement_speed = 200
# export (int) var health = 3
var bulletSource = preload ("res://Bullet/Bullet.tscn")
func _ready():
	set_process(true)
	set_physics_process(true)
	GlobalVariables.Player = self

func _process(delta):
	if GlobalVariables.automaticFiring:
		if Input.is_action_just_pressed("fire"):
			if GlobalVariables.bulletInstanceCount < 3:
				var bulletInstance = bulletSource.instance()
				bulletInstance.position = Vector2(position.x, position.y-80)
				get_tree().get_root().add_child(bulletInstance)
	elif Input.is_action_just_pressed("fire"):
		if GlobalVariables.bulletInstanceCount < 3:
			var bulletInstance = bulletSource.instance()
			bulletInstance.position = Vector2(position.x, position.y-80)
			get_tree().get_root().add_child(bulletInstance)
#controls firerate and bullet count of player
		
func _physics_process(delta):
	if Input.is_action_pressed("ui_left"):
		if position.x > 0:
			move_and_collide(Vector2( -movement_speed * delta, 0))
	if Input.is_action_pressed("ui_right"):
		if position.x < 1280:
			move_and_collide(Vector2(movement_speed * delta, 0))
	if Input.is_action_pressed("ui_up"):
		move_and_collide(Vector2(0,-movement_speed * delta))
	if Input.is_action_pressed("ui_down"):
		move_and_collide(Vector2(0,movement_speed * delta))
#controls player movement, depending on the set ui_? in settings
