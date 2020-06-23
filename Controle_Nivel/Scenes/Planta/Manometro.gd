extends Sprite

const MIN_ANGLE = 0
const MAX_ANGLE = 270

export var pressure = 0 setget setPressure
export var Min = 0 setget setMin
export var Max = 100 setget setMax

onready var ponteiro = get_node("ponteiro")


func setPressure(value):
	pressure =  value
	update()
	
func setMin(value):
	Min = value
	update()

func setMax(value):
	Max = value
	update()


func update():
	if ponteiro:
		updatePonteiro()
	else:
		set_physics_process(true)

# Mapeia um valor entre dois limites
func map(x, in_min, in_max, out_min, out_max):
	return (x - in_min) * (out_max - out_min) / (in_max - in_min) + out_min

func updatePonteiro():
	ponteiro.rotation = deg2rad(map(pressure,Min,Max,MIN_ANGLE,MAX_ANGLE)) 
	
func _physics_process(delta):
	updatePonteiro()
	set_physics_process(false)
