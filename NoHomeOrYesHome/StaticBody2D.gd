extends StaticBody2D

func waid():
	if GlobalValues.IHaveFruits == false:
		GlobalValues.call("dialogStart", "Shopping")
		GlobalValues.IHaveFruits = true
	else: GlobalValues.call("dialogStart", "Notshopping")
