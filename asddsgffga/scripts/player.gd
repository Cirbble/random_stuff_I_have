extends CharacterBody2D


@export var SPEED = 300.0
@export var JUMP = 500

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	# Add the gravity.
	
	if not is_on_floor():
		var y_direction = Input.get_axis("ui_up","ui_down")
		if velocity.y < 1000:
			velocity.y += gravity * delta 
		

	# Handle jump.
	if Input.is_action_just_pressed("ui_up") and is_on_floor():
		velocity.y = -JUMP
		$jumpsfx.play()

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	velocity.x = direction * SPEED

	

	move_and_slide()

