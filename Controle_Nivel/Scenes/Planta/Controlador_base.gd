extends Node

export var enable = true
export (NodePath) var _planta

onready var planta = get_node(_planta)

var MV = 0.0
var SP = 0.0

signal MV_changed(MV)

func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	if planta:
		if enable:
			CalcMV(SP, planta.PV,delta)
		else:
			MV = 0.0
		emit_signal("MV_changed",MV)
		planta.MV = MV
		
#virtual
func CalcMV(SP:float,PV:float, delta:float):
	pass
		
