extends Button

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# Connect the "pressed" signal to the _on_pressed function
	self.pressed.connect(_on_pressed)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_pressed() -> void:
	# Supprime la scène actuelle
	get_tree().current_scene.queue_free()

	# Précharge et instancie la nouvelle scène
	var simultaneous_scene = preload("res://Levels/Level-1.tscn").instantiate()
	
	# Ajoute la nouvelle scène à la racine de l'arbre de scène
	_add_a_scene_manually(simultaneous_scene)

func _add_a_scene_manually(scene: Node) -> void:
	# Ajoute la nouvelle scène à l'arbre de scène
	get_tree().root.add_child(scene)
