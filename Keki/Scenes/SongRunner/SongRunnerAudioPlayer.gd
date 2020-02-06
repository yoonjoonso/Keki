extends AudioStreamPlayer


func play_music(song):
	stream.data = song.music_bytes
	play()
	print("playing song")


func stop_music():
	stop()
	print("stopping song")
