extends Node2D

var hit_type = 0

func _process(delta):
	if hit_type != 1:
		$Path2D/PathFollow2D.unit_offset += delta 
		var path_pos = $Path2D/PathFollow2D.position
		$AnimationPlayer/Sprite.position = path_pos


func set_sprite_direction(rotation):
	$AnimationPlayer/Sprite.rotation_degrees = rotation

#0 not hit, -1 bad hit, 1 hit
func note_hit(type):
	hit_type = type
	if hit_type == 1:
		$AnimationPlayer.play()
