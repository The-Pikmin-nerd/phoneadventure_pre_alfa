extends Button

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# Connect the "pressed" signal to the _on_pressed function
	self.pressed.connect(_on_pressed)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_pressed() -> void:
	# Preload and instantiate the scene when the button is pressed
	var simultaneous_scene = preload("res://Levels/Level-1.tscn").instantiate()
	_add_a_scene_manually(simultaneous_scene)


func _add_a_scene_manually(scene: Node) -> void:
	# This is like autoloading the scene, only it happens after loading the main scene
	get_tree().root.add_child(scene)
