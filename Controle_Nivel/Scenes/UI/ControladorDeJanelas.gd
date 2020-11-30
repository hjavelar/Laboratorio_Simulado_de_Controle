extends Control

export (Array, PackedScene) var cenas

onready var Transicao = $Transicao
var cenaAtual = null

# Called when the node enters the scene tree for the first time.
func _ready():
	CarregaCenaIndex(0)
	pass # Replace with function body.


func CarregaCena(tipo:PackedScene)->void:
	Transicao.fade_in()
	
	if cenaAtual != null:
		cenaAtual.queue_free()
	cenaAtual = tipo.instance()
	Transicao.fade_out()
	add_child(cenaAtual)
	

func CarregaCenaIndex(index:int)->void:
	if cenas.size() > index:
		CarregaCena(cenas[index])
