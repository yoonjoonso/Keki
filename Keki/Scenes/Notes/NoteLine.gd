extends Node2D 


export (PackedScene) var Note
export var note_rotation = 0

func _ready():
	$NoteSlot/Sprite.rotation_degrees = note_rotation


# Called when the node enters the scene tree for the first time.
func _process(delta):
	$NoteSlot/Sprite.modulate = Color(1,1,1)
	
	if Input.is_key_pressed(KEY_W) && note_rotation == 0 && get_parent().type == 0:
		note_slot_pressed()
	elif Input.is_key_pressed(KEY_A) && note_rotation == 270 && get_parent().type == 0:
		note_slot_pressed()
	elif Input.is_key_pressed(KEY_S) && note_rotation == 180 && get_parent().type == 0:
		note_slot_pressed()
	elif Input.is_key_pressed(KEY_D) && note_rotation == 90 && get_parent().type == 0:
		note_slot_pressed()
	elif Input.is_key_pressed(KEY_I) && note_rotation == 0 && get_parent().type == 1:
		note_slot_pressed()
	elif Input.is_key_pressed(KEY_J) && note_rotation == 270 && get_parent().type == 1:
		note_slot_pressed()
	elif Input.is_key_pressed(KEY_K) && note_rotation == 180 && get_parent().type == 1:
		note_slot_pressed()
	elif Input.is_key_pressed(KEY_L) && note_rotation == 90 && get_parent().type == 1:
		note_slot_pressed()

func create_note():
	var note = Note.instance()
	note.set_sprite_direction(note_rotation)
	var runner = get_parent().get_parent()
	note.connect("good_hit", runner, "good_hit")
	note.connect("bad_hit", runner, "bad_hit")
	note.connect("miss", runner, "miss")
	add_child(note)

func note_slot_pressed():
	$NoteSlot/Sprite.modulate = Color(.5,.5,.5)
	$NoteSlot.note_slot_pressed()
	
