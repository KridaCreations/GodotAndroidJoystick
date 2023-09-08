extends Sprite2D


var is_pressed = false
var vector = Vector2.ZERO
var shoot = false 
var index = -1
@onready var button = $button
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _input(event):
#	if(event is InputEventScreenTouch):
#		print(event.index)
	if(button.is_pressed() and (event is InputEventScreenTouch)):
		if(index == -1):
	
			index = event.index
	if((event is InputEventScreenDrag) and (event.index == index)):
		var new_pos = event.position 
		if(global_position.distance_to(new_pos) < (267*scale.x)):
			shoot = true		
			button.global_position = new_pos -  (Vector2(114,114) * scale.x)
		else:
			shoot = false
			var vec = event.position - global_position
			vec = vec.normalized()
			vec = vec * (267*scale.x)
			button.global_position = global_position + vec - (Vector2(114,114) * scale.x)
		vector = event.position - global_position

func get_vector():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	is_pressed = button.is_pressed()
	if(button.is_pressed() == false):
		index = -1
		vector = Vector2.ZERO
		shoot = false
		var vec = (button.global_position + (Vector2(114,114) * scale.x)) - global_position
		vec = vec/2
		button.global_position = global_position + vec - (Vector2(114,114) * scale.x)
