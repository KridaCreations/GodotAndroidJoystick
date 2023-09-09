extends Sprite2D


#var is_pressed = false
var vector = Vector2.ZERO
var shoot = false 
var index = -1
var curr_state = false
var buff_frame = 0
var prev_frame_touched = -1
@onready var button = $button
# Called when the node enters the scene tree for the first time.


func _ready():
	pass # Replace with function body.


func _input(event):
	if(button.is_pressed() and (event is InputEventScreenTouch)):
		if(index == -1):
			index = event.index

	if((event is InputEventScreenDrag) and (event.index == index)):
		var g_event_pos
		if(get_viewport().get_camera_2d() == null):
			g_event_pos = event.position
		else:
			var scene_camera = get_viewport().get_camera_2d()
			g_event_pos = scene_camera.global_position - (abs(get_viewport_rect().size)/2) + scene_camera.offset  + event.position
		var expected_button_local_positon
		var touch_pos_local = to_local(g_event_pos) 
		button.position = touch_pos_local + Vector2(-114,-114)
#		var pos_vec = button.position - Vector2(267,267)
		if(touch_pos_local.length() > 267):
#			button.position = Vector2(267,267) + pos_vec.normalized() * 267
			touch_pos_local = touch_pos_local.normalized() * 267
			button.position = touch_pos_local + Vector2(-114,-114)
			pass
			

func find_vector():
	return vector
	
func find_shooting():
	return shoot


func find_pressed():
	return (index != -1)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
#	print(is_pressed())

		
	if(button.is_pressed() == false):
		index = -1
		var new_vec = button.position + Vector2(-114,-114)
		new_vec = new_vec/2
		button.position = new_vec
	buff_frame -= 1
#	print(index)
	
	

