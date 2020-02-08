extends Node2D

var objects_in_area = []

func note_slot_pressed():
	for area in objects_in_area:
		if area.is_in_group("note"):
			var distance = area.get_global_transform()[2].distance_to($Sprite/Area2D.get_global_transform()[2])
			if distance < 70:
				area.get_parent().get_parent().note_hit(1)
				hit_anim()
			else:
				area.get_parent().get_parent().note_hit(-1)


func _on_Area2D_area_entered(area):
	objects_in_area.push_back(area)


func _on_Area2D_area_exited(area):
	area.get_parent().get_parent().note_hit(0)
	objects_in_area.erase(area)

func hit_anim():
	$Tween.interpolate_property($HitSprite, "scale", Vector2(1,1), Vector2(1.4,1.4), .3)
	var start_color = Color(1,1,1,1)
	var end_color = get_parent().StartColor
	end_color.a = 0
	$Tween.interpolate_property($HitSprite, "modulate", start_color, end_color, .3)
	$Tween.start()
	$Particles2D.emitting = true
