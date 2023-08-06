extends Node2D

var queue
var DiaJson = "res://dialogs.json"
@onready var textD = $CanvasLayer/Control/Text
var result

func _ready():
	var jsonFile = FileAccess.open(DiaJson, FileAccess.READ)
	var jsonRes = JSON.parse_string(jsonFile.get_as_text())
	jsonFile.close()
	result = jsonRes["GoodWork"]
	queue = 0
	textD.text = "[center]" + result[queue].text

func next_dialog():
	if queue < len(result): textD.text = "[center]" + result[queue].text
	else: GlobalValues.call("fading", "res://end.tscn")

func _process(delta):
	if Input.is_action_just_released("DiaCont") and visible:
		queue += 1
		next_dialog()
