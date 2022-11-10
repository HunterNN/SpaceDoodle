extends CharacterBody2D
class_name Player

const SPEED = 300.0
const JUMP_VELOCITY = -1200.0
var lookingRight = true
var rotation_speed = 0.1
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity: int = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta	
	rotate(rotation_speed)
	
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		if direction > 0 and !lookingRight:
			scale.x *= -1
			rotation_speed *= -1
			lookingRight = true
		elif direction < 0 and lookingRight:
			scale.x *= -1
			rotation_speed *= -1
			lookingRight = false
		velocity.x = direction * SPEED
	#else:
		#velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	var collision = get_last_slide_collision()
	if collision:
		if "Platform" in collision.get_collider().name and is_on_floor():
			velocity.y = JUMP_VELOCITY
