extends Control

export(int) var countdownMax
var currentTimer


# Called when the node enters the scene tree for the first time.
func _ready():
	currentTimer = countdownMax
	$HUD/Countdown.text = str(currentTimer)
	
#	if GlobalVariables.playerhealth > 0 && currentTimer > 0:
	while GlobalVariables.playerhealth > 0 && currentTimer > 0:
		yield(get_tree().create_timer(1.0), "timeout")
		$HUD/Countdown.text = str(currentTimer)
		currentTimer = currentTimer - 1
		print(currentTimer)
		#print("Game Over")
		#get_tree().change_scene("res://Losescrene.tscn")
		#GlobalVariables.bulletInstanceCount = 0
#	else:
	get_tree().change_scene("res://Losescrene.tscn")
	GlobalVariables.bulletInstanceCount = 0

func _process(delta):
	$HUD/Health.update_health($Player.health)
	$HUD/CurrentScore.text = str(GlobalVariables.scoringInformation["currentScore"])
	$HUD/CurrentScore.text = str(GlobalVariables.scoringInformation["currentScore"])
	if get_tree().get_nodes_in_group("enemy").size() == 0:
		get_tree().change_scene("res://WinScene.tscn")
