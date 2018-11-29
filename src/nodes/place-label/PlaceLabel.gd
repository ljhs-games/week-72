extends Label

export var first_color = Color(255, 255, 102)
export var second_color = Color(218, 218, 218)
export var third_color = Color(204, 150, 96)
export var other_color = Color(228, 37, 37)

func _ready():
	Score.connect("change_place", self, "_on_PlaceLabel_change_place")
	set_place(Score.place)

func set_place(new_place):
	match new_place:
		1:
			text = str(new_place) + " st"
			add_color_override("font_color", first_color)
		2:
			text = str(new_place) + " nd"
			add_color_override("font_color", second_color)
		3:
			text = str(new_place) + " rd"
			add_color_override("font_color", third_color)
		_:
			text = str(new_place) + " th"
			add_color_override("font_color", other_color)

func _on_PlaceLabel_change_place(new_place):
	set_place(new_place)