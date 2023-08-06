extends StaticBody2D

func waid():
	if GlobalValues.IHaveFruits == false:
		GlobalValues.call("dialogStart", "NeedFruits")
	else: 
		GlobalValues.call("fading", "res://work.tscn")
