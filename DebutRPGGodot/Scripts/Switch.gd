extends StaticBody2D

var switchOff = true

onready var animationPlayer = $AnimationPlayer

func _ready():
	animationPlayer.play("SwitchOff")
	switchOff = true;
	
func switching():
	if switchOff:
		animationPlayer.play("SwitchOn")
		switchOff = false
	else:
		animationPlayer.play("SwitchOff")
		switchOff = true
	

func _process(delta):
	pass
	#switching()


func _on_Hurtbox_area_entered(area):
	switching()
