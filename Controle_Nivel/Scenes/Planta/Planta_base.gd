extends Node

# Toda planta (ou sistema) terá uma entrada (MV) e uma saída (PV)
var MV = 0.0 setget setMV
var PV = 0.0 setget setPV

# Os sinais são gerados quando ocorrer variação nos valores de MV e PV
signal PV_changed(newPV)
signal MV_changed(newMV)

# executa CalcPV() a cada intervalo delta
func _physics_process(delta):
	CalcPV(delta)

func setMV(value):
	MV = value 
	emit_signal("MV_changed",MV)

func setPV(value):
	PV = value
	emit_signal("PV_changed",PV)

# virtual (a função CalcPV será definida na Planta_nivel, baseada em Planta_base)
func CalcPV(delta):
	pass

