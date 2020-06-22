extends TextureButton

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

onready var chart_node = get_node("../GDCharts")
onready var planta_node = get_node("../Planta_Nivel")

func _on_TextureButton_toggled(button_pressed):
	if button_pressed:
		chart_node.show()
		planta_node.hide()
	else:
		chart_node.hide()
		planta_node.show()
