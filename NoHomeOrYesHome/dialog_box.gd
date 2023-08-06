extends CanvasLayer

signal dialog(DialogValues: Array)

@onready var faceD = $Emoji
@onready var textD = $Text
var event = Input.is_action_pressed("act")
var queue = 0
var texts

func _init() -> void:
	hide()
	dialog.connect(dialogue)

func dialogue(DialogValues):
	queue = 0
	texts = DialogValues
	show()
	if !DialogValues[queue].has("face"): faceD.text = ""
	else: faceD.text = DialogValues[queue].face
	textD.text = DialogValues[queue].text

func next_dialog():
	if queue < len(texts):
		if !texts[queue].has("face"): faceD.text = ""
		else: faceD.text = texts[queue].face
		textD.text = texts[queue].text
	else: 
		hide()
		

func _process(delta):
	if Input.is_action_just_released("DiaCont") and visible:
		queue += 1
		next_dialog()
	if visible: GlobalValues.Move = false
	else: GlobalValues.Move = true
