extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	position = Vector2(randi_range(18, 175),randi_range(3, 106))
	$AnimationPlayer.play("dead")
