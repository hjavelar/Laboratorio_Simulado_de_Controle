extends TextureButton

onready var ControladorDeJanelas = get_tree().get_root().get_child(0)
export var CenaIndex:int

func _on_btn_pressed():
	if ControladorDeJanelas.has_method("CarregaCena"):
		ControladorDeJanelas.CarregaCenaIndex(CenaIndex)
	else:
		print("Abra a aplicação pela janela princial (ControladorDeJanelas)")
	pass # Replace with function body.
