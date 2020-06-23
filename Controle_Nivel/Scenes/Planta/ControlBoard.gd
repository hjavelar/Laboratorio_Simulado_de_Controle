extends Node2D

# PID
onready var edKp = $PID/Frame/edKp
onready var edKi = $PID/Frame/edKi
onready var edKd = $PID/Frame/edKd

# Buttons
onready var btnLiga = $Buttons/btnLiga
onready var btnAuto = $Buttons/btnAuto

# Sliders
onready var sldSP = $SP/sldSP
onready var sldMV = $MV/sldMV

# Progressvar
onready var pgPV = $PV/pgPV

# Frames
onready var boxPID = $PID

# Signals
signal PID_changed(Kp,Ki,Kd)
signal Liga_changed(newState)
signal Auto_changed(newState)
signal SP_changed(value)

# public variables

var MV = 0 setget setMV, getMV
var PV = 0 setget setPV, getPV
var SP = 0 setget setSP, getSP

var Kp = 1.4 setget setKp
var Ki = 1.0 setget setKi
var Kd = 0.0 setget setKd
var PID_visible = false setget setPID_visible

var MV_readyOnly = false setget setMV_readOnly

var Auto = false
var Liga = false

func _ready():
	updatePID()
	boxPID.visible = PID_visible

# MV

func setMV(value):
	MV = clamp(value,0,100)
	if sldMV:
		sldMV.value = MV
	pass

func getMV():
	if sldMV:
		return sldMV.value
	return MV
	pass

# PV 

func setPV(value):
	PV = clamp(value,0,100)
	if pgPV:
		pgPV.value = PV

func getPV():
	if pgPV:
		return pgPV.value
	return PV

# SP

func setSP(value):
	SP = clamp(value,0,100)
	if sldSP:
		sldSP.value = SP
	pass

func getSP():
	if sldSP:
		return sldSP.value
	return SP
	pass


## PID


func setKp(value):
	Kp = value
	updatePID()

func setKi(value):
	Ki = value
	updatePID()

func setKd(value):
	Kd = value
	updatePID()

func setPID_visible(value):
	PID_visible = value
	if boxPID:
		boxPID.visible = value

func updatePID():
	if edKp:
		edKp.text = str(Kp)
	if edKi:
		edKi.text = str(Ki)
	if edKd:
		edKd.text = str(Kd)

func PIDChanged():
	emit_signal("PID_changed",Kp,Ki,Kd)


func _on_edKp_focus_exited():
	self.Kp = float(edKp.text)
	PIDChanged()

func _on_edKi_focus_exited():
	self.Ki = float(edKi.text)
	PIDChanged()

func _on_edKd_focus_exited():
	self.Ki = float(edKi.text)
	PIDChanged()

func setMV_readOnly(value):
	MV_readyOnly = value
	if sldMV:
		sldMV.editable = not value

# Buttons

func _on_btnLiga_toggled(button_pressed):
	emit_signal("Liga_changed",button_pressed)
	Liga = button_pressed
	if Liga:
		sldMV.editable = not Auto
	else:
		sldMV.editable = false
		self.MV = 0.0
	pass # Replace with function body.


func _on_btnAuto_toggled(button_pressed):
	emit_signal("Auto_changed",button_pressed)
	Auto = button_pressed
	sldMV.editable = not Auto
	pass # Replace with function body.


func _on_sldSP_value_changed(value):
	emit_signal("SP_changed",sldSP.value)	
	pass # Replace with function body.
