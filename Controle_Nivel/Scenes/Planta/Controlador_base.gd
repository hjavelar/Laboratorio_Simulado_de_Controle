extends Node

# A propriedade "enable", permite desabilitar a saida (MV=0), quando "false"
export var enable = false

# A propriedade "_planta" é o caminho para planta na qual será controlada
# Ver: Planta_base
export (NodePath) var _planta
# Ao inicializar converte o caminho da planta em objeto
onready var planta = get_node(_planta)

# Variavéis comuns a controladores 
var MV = 0.0
var SP = 0.0
# A variável de processo (PV)) é obtida automaticamente da "planta"

# Sinal para atualizar elementos externos sobre a alteração da MV
signal MV_changed(MV)

# ### Verificar se é necessário: ###
func _ready():
	pass # Replace with function body.

# A cada ciclo (de duração "delta"):
func _physics_process(delta):
	# Se o objeto "planta" está pronto (se foi atribuido, se existe)
	if planta:
		# Se a opção "enable" é true
		if enable:
			# Faz o cálculo da nova MV, tendo como entrada a SP, PV e delta
			CalcMV(SP, planta.PV,delta)
		else:
			# Se a opção "enable" é false, então MV = 0
			MV = 0.0
		# Emite o sinal para atulizar elementos externos
		emit_signal("MV_changed",MV)
		# Atualiza planta sobre a nova MV
		planta.MV = MV

# virtual (Essa função será substituída por controles "filhos" desse script)
func CalcMV(SP:float,PV:float, delta:float):
	pass
