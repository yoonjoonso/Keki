extends Control

export (PackedScene) var Map
var song_name
var bpm
var time_offset
var preview_start_time
var preview_duration
var song_path
var image_path
var diff_maps

var file_path
var image_bytes
var music_bytes

var current_map

func _ready():
	hide()


func load_info(content, file_path):
	var song_json = JSON.parse(content)
	if typeof(song_json.result) == TYPE_DICTIONARY:
		song_name = song_json.result["_songName"]
		bpm = song_json.result["_beatsPerMinute"]
		time_offset = song_json.result["_songTimeOffset"]
		preview_start_time = song_json.result["_previewStartTime"]
		preview_duration = song_json.result["_previewDuration"]
		song_path = song_json.result["_songFilename"]
		image_path = song_json.result["_coverImageFilename"]
		diff_maps = song_json.result["_difficultyBeatmapSets"][0]["_difficultyBeatmaps"]
		self.file_path = file_path
		print(song_name)
		load_maps()
		load_image()
		load_song()
		
		$Label.text = song_name
	else:
		print("bad json")


func load_maps():
	for diff_map in diff_maps:
		var file = File.new()
		file.open(file_path + "/" + diff_map["_beatmapFilename"], File.READ)
		if(file.is_open()):
			var content = file.get_as_text()
			var map = Map.instance()
			map.load_map(content, diff_map["_difficultyRank"])
			add_child(map)
		file.close()

func load_song():
	var file = File.new()
	file.open(file_path + "/" + song_path, File.READ)
	if(file.is_open()):
		music_bytes = file.get_buffer(file.get_len())
	file.close()

func load_image():
	var file = File.new()
	file.open(file_path + "/" + image_path, File.READ)
	if(file.is_open()):
		image_bytes = file.get_buffer(file.get_len())
	file.close()


func song_selected():
	current_map = $Map
	map_selected()


func map_selected():
	get_parent().get_parent().start_playing(self, current_map)
