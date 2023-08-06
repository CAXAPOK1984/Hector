extends Node2D

signal WhatAscene(scene: String)
var scenes: String

func _init() -> void:
	WhatAscene.connect(animated)

func animated(scene):
	scenes = scene
	$Anim.play("fade")

func anotherScene():
	print(scenes)
	get_tree().change_scene_to_file(scenes)
