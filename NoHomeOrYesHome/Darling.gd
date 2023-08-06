extends Node2D

@onready var darl = $CanvasLayer/Control/Label
@onready var animDead = $Sleep
var scene = preload("res://dead.tscn")
var blyad
func _ready():
	var blyad = scene.instantiate()
	Dreams.volume_db = -5
	Dreams.pitch_scale = 0.2

func wakeup(texts):
	darl.text = texts
 
func weAreDead():
	while animDead.is_playing():
		var blyad = scene.instantiate()
		add_child(blyad)
		$Timer.start()
		await $Timer.timeout
		weAreDead()
	get_tree().change_scene_to_file("res://tabletki.tscn")
	
func _process(delta):
	if animDead.is_playing(): GlobalValues.Move = false
