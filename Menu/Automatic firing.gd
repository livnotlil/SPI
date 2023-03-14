extends CheckButton


func _ready():
	pass

func _on_Automatic_firing_pressed():
	GlobalVariables.automaticFiring = pressed
	print(pressed)


func _on_Automatic_firing_toggled(button_pressed):
	GlobalVariables.automaticFiring = pressed
	print(toggle_mode)
