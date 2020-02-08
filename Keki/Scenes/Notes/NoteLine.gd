extends Node2D 


export (PackedScene) var Note
export (Color) var StartColor
export (Color) var PressColor

export var note_rotation = 0

func _ready():
	$NoteSlot/Sprite.rotation_degrees = note_rotation
	$NoteSlot/HitSprite.rotation_degrees = note_rotation


# Called when the node enters the scene tree for the first time.
func _process(delta):
	$NoteSlot/Sprite.modulate = StartColor
	
	if (Input.is_key_pressed(KEY_W) || Input.is_joy_button_pressed(0, JOY_DPAD_UP)) && note_rotation == 0 && get_parent().type == 0:
		note_slot_pressed()
	elif (Input.is_key_pressed(KEY_A) || Input.is_joy_button_pressed(0, JOY_DPAD_LEFT)) && note_rotation == 270 && get_parent().type == 0:
		note_slot_pressed()
	elif (Input.is_key_pressed(KEY_S) || Input.is_joy_button_pressed(0, JOY_DPAD_DOWN)) && note_rotation == 180 && get_parent().type == 0:
		note_slot_pressed()
	elif (Input.is_key_pressed(KEY_D) || Input.is_joy_button_pressed(0, JOY_DPAD_RIGHT)) && note_rotation == 90 && get_parent().type == 0:
		note_slot_pressed()
	elif (Input.is_key_pressed(KEY_I) || Input.is_joy_button_pressed(0, JOY_SONY_TRIANGLE)) && note_rotation == 0 && get_parent().type == 1:
		note_slot_pressed()
	elif (Input.is_key_pressed(KEY_J) || Input.is_joy_button_pressed(0, JOY_SONY_SQUARE))&& note_rotation == 270 && get_parent().type == 1:
		note_slot_pressed()
	elif (Input.is_key_pressed(KEY_K) || Input.is_joy_button_pressed(0, JOY_SONY_X)) && note_rotation == 180 && get_parent().type == 1:
		note_slot_pressed()
	elif (Input.is_key_pressed(KEY_L) || Input.is_joy_button_pressed(0, JOY_SONY_CIRCLE)) && note_rotation == 90 && get_parent().type == 1:
		note_slot_pressed()

func create_note():
	var note = Note.instance()
	note.set_sprite_direction(note_rotation)
	note.set_sprite_color(StartColor, PressColor)
	var runner = get_parent().get_parent()
	note.connect("good_hit", runner, "good_hit")
	note.connect("bad_hit", runner, "bad_hit")
	note.connect("miss", runner, "miss")
	add_child(note)

func note_slot_pressed():
	$NoteSlot/Sprite.modulate = PressColor
	$NoteSlot.note_slot_pressed()
	
