extends Node

onready var Interface = $Planta/InterfaceNivel
onready var Planta = $Planta/Planta_nivel
onready var Controle_Manual = $Controlador/Manual
onready var Controle_PID = $Controlador/PID
onready var Board = $ControlBoard
onready var VazaoSaida = $Vazao_Saida/pgVazao_saida
onready var Charts = $Charts

func _ready():
	Controle_Manual.slider = Board.get_node("MV/sldMV")
	SetControle_Manual()
	
	Controle_PID.setPID(Board.Kp,Board.Ki,Board.Kd) 
	pass

func SetControle_PID():
	Controle_Manual.planta = null
	Controle_PID.planta = Planta
	if Board.Liga:
		Interface.ChaveSeletora.State = Interface.ChaveSeletora.Mode.PC
	else:
		Interface.ChaveSeletora.State = Interface.ChaveSeletora.Mode.OFF

func SetControle_Manual():
	Controle_PID.planta = null
	Controle_Manual.planta = Planta
	if Board.Liga:
		Interface.ChaveSeletora.State = Interface.ChaveSeletora.Mode.MANUAL
	else:
		Interface.ChaveSeletora.State = Interface.ChaveSeletora.Mode.OFF


func _on_ControlBoard_Auto_changed(newState):
	if newState:
		SetControle_PID()
	else:
		SetControle_Manual()
	if not Board.Liga:
		Interface.ChaveSeletora.State = Interface.ChaveSeletora.Mode.OFF
	Board.PID_visible = newState
	pass 


func _on_ControlBoard_Liga_changed(newState):
	Controle_Manual.enable = newState
	Controle_PID.enable =  newState
	if newState:
		if Board.Auto:
			Interface.ChaveSeletora.State = Interface.ChaveSeletora.Mode.PC
		else:
			Interface.ChaveSeletora.State = Interface.ChaveSeletora.Mode.MANUAL
	else:
		Interface.ChaveSeletora.State = Interface.ChaveSeletora.Mode.OFF
	
	


func _on_ControlBoard_PID_changed(Kp, Ki, Kd):
	Controle_PID.setPID(Kp, Ki, Kd)
	pass 


func _on_Planta_nivel_PV_changed(newPV):
	Board.PV = newPV
	Interface.PV = newPV
	Charts.PV = newPV
	pass 


func _on_Planta_nivel_vazao_saida_changed(newValue):
	VazaoSaida.value = newValue
	pass 


func _on_ControlBoard_SP_changed(value):
	Controle_Manual.SP = value
	Controle_PID.SP = value
	Charts.SP = value
	pass # Replace with function body.


func _on_Planta_nivel_MV_changed(newMV):
	if Board.Auto:
		Board.MV = newMV
	pass # Replace with function body.
