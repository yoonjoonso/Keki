extends Control

var song
var note_map

var current_time
var bpm

var time_to_slot = .76

func _ready():
	hide()
	set_process(false)

func play_game(song, map):
	show()
	set_process(true)
	self.song = song
	note_map = map.note_map
	current_time = 0
	bpm = song.bpm
	$SongRunnerAudioPlayer.play_music(song)

func _process(delta):
	if Input.is_action_just_pressed("ui_exit"):
		exit()
		
	current_time = (($SongRunnerAudioPlayer.get_playback_position() + time_to_slot) * bpm / 60)
	while !note_map.empty() && note_map.front()["_time"] < current_time:
		var note = note_map.pop_front()
		var direction = note["_cutDirection"]
		var note_type = note["_type"]
		if note_type == 0:
			$NoteLineGroupLeft.create_note(direction)
		elif note_type == 1:
			$NoteLineGroupRight.create_note(direction)


func exit():
	$SongRunnerAudioPlayer.stop_music()
	hide()
	set_process(false)
	get_parent().stop_playing()

