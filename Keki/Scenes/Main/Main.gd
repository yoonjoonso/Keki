extends Node

func _ready():
	$SongBrowser.hide()
	$SongBrowser.set_process(false)
	load_songs("../Songs/")


func load_songs(path):
	var dir = Directory.new()
	if dir.open(path) == OK:
		dir.list_dir_begin()
		var dir_name = dir.get_next()
		while dir_name != "":
			if dir.current_is_dir():
				var file = File.new()
				var file_path = path + dir_name
				file.open(file_path + "/info.dat", File.READ)
				if(file.is_open()):
					var content = file.get_as_text()
					$SongBrowser.create_song_instance(content, file_path)
				file.close()
			dir_name = dir.get_next()
		$SongBrowser.done_song_loading()
	else:
		print("An error occurred when trying to access the path.")


func start_playing(song, map):
	$SongBrowser.hide()
	$SongBrowser.set_process(false)
	$SongRunner.play_game(song,map)

func stop_playing():
	start_browsing()


func start_browsing():
	$StartLabel.hide()
	$StartLabel.set_process(false)
	$SongBrowser.show()
	$SongBrowser.set_process(true)

func stop_browsing():
	$SongBrowser.hide()
	$SongBrowser.set_process(false)
	$StartLabel.show()
	$StartLabel.set_process(true)

func _on_Label_start_label_pressed():
	start_browsing()
