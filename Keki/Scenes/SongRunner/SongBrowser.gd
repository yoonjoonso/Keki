extends Control

export (PackedScene) var Song

var current_song
var songs = []
var index = 0

func select_song():
	set_process(false)
	current_song.song_selected()


func _process(delta):
	if Input.is_action_just_pressed("ui_cancel"):
		stop_browsing()
	if Input.is_action_just_pressed("ui_select"):
		select_song()
	if Input.is_action_just_pressed("ui_left"):
		browse(true)
	if Input.is_action_just_pressed("ui_right"):
		browse(false)

func browse(left):
	if(left):
		index = (index - 1) % songs.size()
	else:
		index = (index + 1) % songs.size()
	
	current_song.hide()
	var new_song = songs[index]
	new_song.show()
	current_song = new_song

func stop_browsing():
	get_parent().stop_browsing()


func create_song_instance(content, file_path):
	var song = Song.instance()
	song.load_info(content, file_path)
	add_child(song)
	songs.push_back(song)

func done_song_loading():
	current_song = songs[index]
	current_song.show()
