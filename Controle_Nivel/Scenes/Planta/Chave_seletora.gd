extends Sprite

const KNOB_SNAP = 30

enum Mode {MANUAL = 0,OFF,ON_OFF,PC,MSSR,MINIREG}

export (Mode) var State = Mode.OFF setget setState

onready var knob = get_node("knob")

func setState(value):
	State = value
	update_knob()

func update_knob():
	if knob:
		knob.rotation_degrees = int(State)*KNOB_SNAP
	else:
		set_physics_process(true)

func _physics_process(delta):
	update_knob()
	set_physics_process(false)
