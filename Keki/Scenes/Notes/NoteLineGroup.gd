extends Control

export var type = 3

func create_note(direction):
	if direction == 0:
		$NoteLineUp.create_note()
	if direction == 1:
		$NoteLineDown.create_note()
	if direction == 2:
		$NoteLineLeft.create_note()
	if direction == 3:
		$NoteLineRight.create_note()
	if direction == 4:
		$NoteLineUp.create_note()
		#$NoteLineLeft.create_note()
	if direction == 5:
		$NoteLineUp.create_note()
		#$NoteLineRight.create_note()
	if direction == 6:
		$NoteLineDown.create_note()
		#$NoteLineLeft.create_note()
	if direction == 7:
		$NoteLineDown.create_note()
		#$NoteLineRight.create_note()
	if direction == 8:
		#$NoteLineLeft.create_note()
		$NoteLineUp.create_note()
		#$NoteLineDown.create_note()
		#$NoteLineRight.create_note()
