extends ColorRect

onready var aPlayer = $aPlayer

func _ready():
	reset()

func reset():
	if aPlayer.current_animation != "_SETUP":
		aPlayer.play("_SETUP")
	hide()
	
func fade_in():
	play("fade_in")

func fade_out():
	play("fade_out")

func play(name):
	show()
	aPlayer.play(name)
	yield(aPlayer, "animation_finished")
	hide()
