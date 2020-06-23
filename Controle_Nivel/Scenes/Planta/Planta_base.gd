extends Node


var MV = 0.0 setget setMV
var PV = 0.0 setget setPV

signal PV_changed(newPV)
signal MV_changed(newMV)


func _physics_process(delta):	
	CalcPV(delta)

func setMV(value):
	MV = value 
	emit_signal("MV_changed",MV)


func setPV(value):
	PV = value
	emit_signal("PV_changed",PV)

# virtual
func CalcPV(delta):
	pass

