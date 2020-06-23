extends "res://Scenes/Planta/Charts.gd"

var PV_Player = 0
var PV_CPU = 0

func _ready():
	SampleTime.stop()
	pass # Replace with function body.

func init_graph():
	chart_node.set_chart_type(chart_node.CHART_TYPE.LINE_CHART)
	chart_node.MAX_VALUES = 50
	chart_node.UseAnimation = false
	chart_node.initialize(chart_node.LABELS_TO_SHOW.NO_LABEL, {PV_Player = Color(0, 0, 255, 1.0),PV_CPU = Color("8000ff"), SP = Color(255, 0, 0, 1)}, 0)

	chart_node.create_new_point({
		label = '',
		values = {
			"PV_Player":0,
			"PV_CPU":0,
			"SP":100
			}
		})
	for i in range(50):
		chart_node.create_new_point({
		label = '',
		values = {
			"PV_Player":0,
			"PV_CPU":0,
			"SP":0
			}
		})

func addPoint():
	chart_node.create_new_point({
		label = '',
		values = {
			"PV_Player":PV_Player,
			"PV_CPU":PV_CPU,
			"SP":SP
		}
	})
