extends StaticBody2D

@onready var Slept = $"../Sleep"

func waid():
	Slept.play("sleep")
