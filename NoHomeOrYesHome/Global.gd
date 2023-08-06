extends Node

var DiaJson = "res://dialogs.json"
var Move = true
var IHaveFruits = false
var WeHello = false

func dialogStart(part: String):
	var jsonFile = FileAccess.open(DiaJson, FileAccess.READ)
	var jsonRes = JSON.parse_string(jsonFile.get_as_text())
	jsonFile.close()
	var result = jsonRes[part]
	print(result)
	DiaBox.emit_signal("dialog", result)

func fading(scene: String):
	Fades.emit_signal("WhatAscene", scene)
