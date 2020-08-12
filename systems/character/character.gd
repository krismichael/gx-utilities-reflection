extends KinematicBody2D

#----------------------------------------------------------------------------------------------------
#
#----------------------------------------------------------------------------------------------------

var speed_max = 30
var velocity = Vector2()

var locomotion = {
	"move_l": false,
	"move_r": false,
	"jump_u": false
}

#----------------------------------------------------------------------------------------------------
#
#----------------------------------------------------------------------------------------------------

func _input(event):

	if Input.is_action_pressed("ui_up"):
		locomotion["jump_u"] = true
	else:
		locomotion["jump_u"] = false

	if Input.is_action_pressed("ui_left"):
		locomotion["move_l"] = true
	else:
		locomotion["move_l"] = false

	if Input.is_action_pressed("ui_right"):
		locomotion["move_r"] = true
	else:
		locomotion["move_r"] = false


func _physics_process(delta):

	if locomotion["move_l"]:
		velocity.x -= speed_max
	elif locomotion["move_r"]:
		velocity.x += speed_max
	else:
		velocity.x = 0

	move_and_slide(velocity)


#----------------------------------------------------------------------------------------------------
# end
#----------------------------------------------------------------------------------------------------
