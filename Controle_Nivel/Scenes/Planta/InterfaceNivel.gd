extends Node2D

const MAX_NIVEL_POS = 434

onready var ChaveSeletora = $Chave_seletora
onready var Manometro = $Manometro
onready var BtnLiga = $Estrutura/btnLiga
onready var Nivel = $Estrutura/Conteudo_Nivel

var PV = 0.0 setget setPV

func setPV(value):
	PV = value
	if Manometro:
		Manometro.pressure = value
	if Nivel:
		setNivel(value)

func setNivel(value):
	Nivel.region_rect.size.y = MAX_NIVEL_POS*0.91*value/100 # ajuste de 91% para coincidir com 100%		

func _ready():
	setNivel(PV)
	pass # Replace with function body.
