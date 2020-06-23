extends "res://Scenes/Planta/Game_base.gd"

onready var ControleManual = $Controladores/Controlador_Manual
onready var ControlePID = $Controladores/Controlador_PID
onready var PlantaPlayer = $Plantas/Planta_nivel_Player
onready var PlantaCPU = $Plantas/Planta_nivel_CPU

func _ready():
	ControleManual.slider = Board.get_node("MV/sldMV")
	ControleManual.planta = PlantaPlayer
	ControlePID.setPID(Board.Kp,Board.Ki,Board.Kd)
	ControlePID.planta = PlantaCPU
	pass

func Gameover():
	print("Gameover")
	ControleManual.enable =false
	ControlePID.enable =false
	pass
	
func Step():
	var playerError = pow((Board.SP - PlantaPlayer.PV),2)/500
	var CPUError = pow((Board.SP - PlantaCPU.PV),2)/500
	self.PlayerErrors += int(playerError)
	self.CPUErrors +=  int(CPUError)
	Charts.PV_Player = PlantaPlayer.PV
	Charts.PV_CPU = PlantaCPU.PV
	Charts.addPoint()
	pass

func SPchanged(SP):
	ControlePID.SP = SP
	ControleManual.SP = SP
	pass

func _on_ControlBoard_Liga_changed(newState):
	Board.get_node("Buttons/btnLiga").visible = false
	Start()
	pass # Replace with function body.




func _on_Planta_nivel_Player_PV_changed(newPV):
	Board.PV = newPV
	pass # Replace with function body.
