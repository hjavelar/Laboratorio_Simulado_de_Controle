extends "res://Scenes/Planta/Controlador_base.gd"

export var Kp = 0.0
export var Ki = 0.0
export var Kd = 0.0

var erro = 0
var integral = 0.0
var errorAnterior = 0.0

func setPID(kp,ki,kd):
	Kp = kp
	Ki = ki
	Kd = kd

func CalcMV(SP:float,PV:float, delta:float):
	erro = SP - PV
	
	integral += Ki*(erro+errorAnterior)*delta/2.0 # Integral
	# Limita a sída do Integrador:
	integral = clamp(integral,0,100);
		
	var P = Kp*erro                   # Proporcional
	var I = integral	
	var D = Kd*(erro-errorAnterior)/delta      # Derivativo
	errorAnterior = erro                   # Atualiza Erro anterior
	# Limita o PID:
	var PID = clamp(P+I+D,0,100)
	self.MV = PID
	pass
