extends Node2D

signal good_hit
signal bad_hit
signal miss

var hit_type = 0

func _process(delta):
	if hit_type != 1:
		$Path2D/PathFollow2D.unit_offset += delta 
		var path_pos = $Path2D/PathFollow2D.position
		$Sprite.position = path_pos
	if $Path2D/PathFollow2D.unit_offset >= 1:
		if hit_type == 0:
			emit_signal("miss")
		queue_free()

func set_sprite_direction(rotation):
	$Sprite.rotation_degrees = rotation

#0 not hit, -1 bad hit, 1 hit
func note_hit(type):
	if hit_type != -1:
		hit_type = type
		if hit_type == 1:
			emit_signal("good_hit")
			queue_free()
		elif hit_type == -1:
			emit_signal("bad_hit")
			
