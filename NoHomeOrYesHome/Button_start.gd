extends Button


func _on_pressed():
	GlobalValues.call("fading", "res://main.tscn")
	Dreams.play()
