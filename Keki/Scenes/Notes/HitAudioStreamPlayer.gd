extends AudioStreamPlayer2D

export (Array, AudioStreamSample) var Sound


func hit():
	stream = Sound[randi() % Sound.size()]
	play()
