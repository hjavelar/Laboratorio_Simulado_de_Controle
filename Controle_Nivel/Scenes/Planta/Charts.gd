extends Control

onready var chart_node = $GDCharts
onready var SampleTime =$SampleTime

var SP = 0 setget setSP
var PV = 0 setget setPV


func setSP(value):
	SP = clamp(value,0,100)

func setPV(value):
	PV = clamp(value,0,100)

func _ready():
	init_graph()
	pass 

func init_graph():
	chart_node.set_chart_type(chart_node.CHART_TYPE.LINE_CHART)
	chart_node.MAX_VALUES = 50
	chart_node.initialize(chart_node.LABELS_TO_SHOW.NO_LABEL, {PV = Color(0, 0, 255, 0.5), SP = Color(255, 0, 0, 1)}, 0)

	for i in range(50):
		chart_node.create_new_point({
		label = '',
		values = {
			"PV":0,
			"SP":0
			}
		})

func addPoint():
	chart_node.create_new_point({
		label = '',
		values = {
			"PV":PV,
			"SP":SP
		}
	})

func _on_SampleTime_timeout():
	addPoint()
	pass # Replace with function body.
