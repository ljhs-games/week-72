extends Node

signal change_place(new_place)

var place = 1 setget _set_place

func _set_place(new_place):
	place = new_place
	emit_signal("change_place", new_place)