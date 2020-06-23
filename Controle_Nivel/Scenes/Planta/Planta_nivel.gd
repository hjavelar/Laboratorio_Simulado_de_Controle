extends "res://Scenes/Planta/Planta_base.gd"

# Constantes:
const V_ENT_MAX = 1
const VS_SAI_Y_MAX = 130
const RECT_ALT_MAX = 270
const MAX_NIVEL_POS = 434

var altura = 3 setget setAltura
var area = 1 
var vazao_saida = 0 
var restricao = 2 setget setRestricao
var nivel = 0 setget setNivel

signal vazao_saida_changed(newValue)

onready var VS_MAX  = sqrt(altura)/restricao

func setAltura(value):
	if altura != value:
		altura = value
		VS_MAX = sqrt(altura)/restricao
		
func setRestricao(value):
	if restricao != value:
		restricao = value
		VS_MAX = sqrt(altura)/restricao


func setNivel(value):
	nivel = value
	self.PV = 100*nivel/altura
	
func _ready():
	pass # Replace with function body.


func CalcPV(delta):
	# calcula o novo nível:
	vazao_saida = sqrt(nivel)/restricao
	emit_signal("vazao_saida_changed",VS_SAI_Y_MAX*vazao_saida/VS_MAX)

	var vazao = MV*0.01*V_ENT_MAX - vazao_saida
	self.nivel =  clamp((nivel + vazao*delta/area),0,100)
	pass

