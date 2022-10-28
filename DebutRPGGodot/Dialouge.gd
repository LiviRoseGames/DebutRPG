extends Control

var liviName = "Livi"
var karinaName = "???"

export var dialogPath = "res://UI/jsons/"
export(float) var textSpeed = 0.05

var dialog = "init"
var nameDialog = liviName

var phraseNum = 0
var finished = false

onready var nameText = $Disabler/ColorRect/Name
onready var textDisplay = $Disabler/ColorRect/Text
onready var disabler = $Disabler
onready var timer = $Disabler/Timer
onready var indicator = $Disabler/Indicator
onready var portrait = $Disabler/Portrait

func _ready():
	dialog_disabler(true)			#hide dialog on start
	nameText.text = liviName		#
	textDisplay.text = "ready"
	
	timer.wait_time = textSpeed

func _process(delta):
	
	if Input.is_action_just_pressed("talk"):
		dialog_disabler(false)
	
		#TYPEDIALOG
		textDisplay.text = "typing absolute nonsense because i am losing my mind"
		textDisplay.visible_characters = 0
		finished = false
	
		while textDisplay.visible_characters < len(textDisplay.text):
			textDisplay.visible_characters += 1

#		timer.start(textSpeed)
#		yield(timer, "timeout")
			yield(get_tree().create_timer(textSpeed), "timeout")
			print(finished)

		finished = true
		print(finished)
		phraseNum += 1
	
	if finished:
		indicator.show()
	else:
		indicator.hide()

func dialog_disabler(disable):
	if disable:
		disabler.hide()
	else:
		disabler.show()
		
#func typeDialog():
#	textDisplay.text = "typing absolute nonsense because i am losing my mind"
#	textDisplay.visible_characters = 0
#	finished = false
#
#	while textDisplay.visible_characters < len(textDisplay.text):
#		textDisplay.visible_characters += 1
#
##		timer.start(textSpeed)
##		yield(timer, "timeout")
#		yield(get_tree().create_timer(textSpeed), "timeout")
#		print(finished)
#
#	finished = true
#	print(finished)
#	phraseNum += 1
	
	
#	if finished:
#		#nextPhrase()
#	else:
#		textDisplay.visible_characters = len(textDisplay.text)
#
##func nextPhrase():
##	if phraseNum >= len(dialog):
##		queue_free()
##		return
##
##	finished = false
##
##	nameText.text = nameDialog[phraseNum]
##	textDisplay.text = dialog[phraseNum]
##
##	textDisplay.visible_characters = 0
##
##	while textDisplay.visible_characters < len(textDisplay.text):
##		textDisplay.visible_characters += 1
##
##		timer.start()
##		yield(timer, "timeout")
##
##	finished = true
##	phraseNum += 1
##	return
