extends Node

var note_map
var difficulty

func load_map(content, difficulty):
	self.difficulty = difficulty
	var note_map_json = JSON.parse(content)
	note_map = note_map_json.result["_notes"]
	print(difficulty)
