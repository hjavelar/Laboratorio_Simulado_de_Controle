extends Node

onready var Charts = $Chart/Charts
onready var Clock = $Clock
onready var Board = $ControlBoard
onready var lbPlayerErrors = $UI/ErrorPlayer
onready var lbCPUErrors = $UI/ErrorCPU
onready var lbTime = $UI/Time
onready var SP_Changer = $SP_Changer
onready var dlgGameover = $dlgGameover
onready var sndWaiting = $SFX/sndWaiting
onready var sndTheme = $SFX/sndTheme
onready var sndVictory = $SFX/sndVictory
onready var sndAlert = $SFX/sndAlert
onready var hintTimer = $UI/Hint
onready var touchHint = $Touch

# Use "self.", before use these variables (use "self.", antes de usar essas variáveis)

var Time = 60 setget setTime
var PlayerErrors = 0 setget setPlayerErrors
var CPUErrors = 0 setget setCPUErrors


func setTime(value):
	Time = value
	if lbTime:
		lbTime.text = str(Time)+" seg"

func setPlayerErrors(value):
	PlayerErrors = clamp(value,0,9999)
	if lbPlayerErrors:
		lbPlayerErrors.text = str(PlayerErrors)+ " erros"
	pass 

func setCPUErrors(value):
	CPUErrors = clamp(value,0,9999)
	if lbCPUErrors:
		lbCPUErrors.text = str(CPUErrors)+ " erros"
	pass 

func _ready():
	Board.get_node("SP/sldSP").editable = false
	Board.get_node("Buttons/btnAuto").visible = false
	pass # Replace with function body.


func Gameover():
	pass

func Start():	
	SP_Changer.start()
	_on_SP_Changer_timeout()
	sndWaiting.stop()
	sndTheme.play()
	hintTimer.stop()
	touchHint.hide()
	yield(get_tree().create_timer(1.0),"timeout")
	Clock.start()
	pass
	
func Step():
	pass

func SPchanged(SP):
	pass
	
func _on_1s():
	self.Time -= 1	
	if Time <= 0:
		Clock.stop()
		SP_Changer.stop()
		Gameover()
		sndTheme.stop()
		sndVictory.play()
		Charts.visible = false
		dlgGameover.PlayerErros = PlayerErrors
		dlgGameover.CPUErros = CPUErrors
		yield(get_tree().create_timer(1.0),"timeout")
		dlgGameover.visible = true
	Step()


func _on_SP_Changer_timeout():
	randomize()
	var SP =rand_range(10,90)
	SPchanged(SP)
	Board.SP = SP
	Charts.SP = SP
	sndAlert.play()


func _on_Hint_timeout():
	touchHint.show()
	pass # Replace with function body.
