extends CharacterBody2D


@export var speed = 3.0
@export_range(0,1) var lerp_factor = 0.1

@onready var sprite = %Sprite
@onready var camera_2d = $Camera2D


func _physics_process(delta):
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_vector("ui_left", "ui_right","ui_up","ui_down")
	#velocity = direction * (speed * 100)
	var target_velocity = direction * (speed * 100)
	velocity = lerp(velocity, target_velocity, lerp_factor)
	move_and_slide()
	#sprite.rotation_degrees = direction.x * 22.0
	var target_rotation = direction.x * 22.0
	sprite.rotation_degrees = lerp(sprite.rotation_degrees, target_rotation, lerp_factor)
	camera_2d.position = lerp(camera_2d.position, direction * (speed *25), lerp_factor)
	
