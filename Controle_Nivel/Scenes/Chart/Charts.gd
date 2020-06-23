extends Control

# Variáveis do gráfico
onready var chart_node = $GDCharts
onready var SampleTime = $SampleTime
onready var Nivel_ProgressBar = $"../Controlador/ReferenceRect/ProgressBar"
onready var SP_Slider = $"../Controlador/ReferenceRect/SetPoint_VSlider"

func _ready():
	init_graph()
	pass # Replace with function body.

func init_graph():
	chart_node.set_chart_type(chart_node.CHART_TYPE.LINE_CHART)
	chart_node.MAX_VALUES = 50
	chart_node.initialize(chart_node.LABELS_TO_SHOW.NO_LABEL, {y = Color(0, 0, 255, 0.5), set_point = Color(255, 0, 0, 1)}, 0)

	for i in range(50):
		chart_node.create_new_point({
		label = '',
		values = {
			y = 0,
			set_point = 0
		}
	})

func _on_SampleTime_timeout():
	chart_node.create_new_point({
		label = '',
		values = {
			y = Nivel_ProgressBar.value,
			set_point = SP_Slider.value
		}
	})
