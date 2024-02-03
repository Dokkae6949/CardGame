extends Control


var _children: Array[Control]


func _ready() -> void:
	for child: Control in get_children():
		_children.push_front(child)
		
		child.drag_started.connect(
			func ():
				var a := _children.find(child)
				
				if a < 0: return
				
				_children.remove_at(a)
				_children.push_front(child)
				_apply_z_index()
		)


func _apply_z_index() -> void:
	for i in range(0, _children.size()):
		_children[i].z_index = _children.size() - i
		print("%s %d" % [_children[i].name, _children[i].z_index])
	print("==============")
