extends CharacterBody2D

@onready var look = $Look

var SPEED := 50

func _physics_process(delta) -> void:
	var direction: Vector2
	if !GlobalValues.Move: direction = Vector2.ZERO
	else: direction = Input.get_vector("left", "right", "up", "down")
	if Input.is_action_pressed("run"): SPEED = 75
	else: SPEED = 50
	position += direction.normalized() * SPEED * delta
	move_and_slide()
	if direction: look.rotation_degrees = snappedi(rad_to_deg(direction.angle()) - 90, 90)
	if Input.is_action_just_pressed("act") and look.is_colliding() and GlobalValues.Move:
		action(look.get_collider())

func action(obj: Object) -> void:
	if obj.has_method("waid"): obj.call("waid")
