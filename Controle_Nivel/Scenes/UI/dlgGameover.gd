extends ColorRect


onready var lbPlayer = $HBox/VBox/lbPlayer
onready var lbCPU = $HBox/VBox/lbCPU

var PlayerErros = 0 setget setPlayerErros 
var CPUErros = 0 setget setCPUErros 


func setPlayerErros(value):
	PlayerErros = value
	if lbPlayer:
		lbPlayer.text = "Player "+str(PlayerErros)+" erro"
		if PlayerErros > 1:
			lbPlayer.text +="s"
	pass
	
func setCPUErros(value):
	CPUErros = value
	if lbCPU:
		lbCPU.text = "CPU "+str(CPUErros)+" erro"
		if CPUErros > 1:
			lbCPU.text += "s"
	pass
