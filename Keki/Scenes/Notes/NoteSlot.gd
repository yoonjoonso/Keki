extends Area2D


func note_slot_pressed():
	var overlapped_areas = get_overlapping_areas()
	for area in overlapped_areas:
		if area.is_in_group("note"):
			var distance = area.position.distance_to(position)
			print(distance)
