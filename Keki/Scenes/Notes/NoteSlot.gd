extends Node2D

var objects_in_area = []

func note_slot_pressed():
	for area in objects_in_area:
		if area.is_in_group("note"):
			var distance = area.get_global_transform()[2].distance_to($Sprite/Area2D.get_global_transform()[2])
			if distance < 20:
				area.get_parent().get_parent().note_hit(1)
			else:
				area.get_parent().get_parent().note_hit(-1)


func _on_Area2D_area_entered(area):
	objects_in_area.push_back(area)


func _on_Area2D_area_exited(area):
	objects_in_area.erase(area)
