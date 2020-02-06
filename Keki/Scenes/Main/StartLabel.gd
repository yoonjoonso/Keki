extends Label

func _process(delta):
	if Input.is_action_just_pressed("ui_select"):
		get_parent().start_browsing()
