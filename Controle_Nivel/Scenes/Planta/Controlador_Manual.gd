extends "res://Scenes/Planta/Controlador_base.gd"

var slider = null

func CalcMV(SP:float,PV:float, delta:float):
	if slider:
		MV = slider.value
	else:
		MV = 0
	
