extends Node2D



var speed = -200
#controls the speed of the enemy group
func _ready():
	set_physics_process(true)
	
	
func _physics_process(delta):
	global_position.x += speed * delta
#controls the movement of enemy group
