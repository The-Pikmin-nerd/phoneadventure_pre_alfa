extends CharacterBody2D

# Constantes
const SPEED = 400.0
const JUMP_VELOCITY = -300.0
const GRAVITY = Vector2(0, 500.0)

# Référence à la caméra (à assigner dans l'inspecteur)
@export var camera: Camera2D
@export var death_zone_y: float = 800.0 # Limite de mort si le personnage descend trop bas

func _physics_process(delta: float) -> void:
	# Appliquer la gravité si le personnage n'est pas au sol 
	if not is_on_floor():
		velocity += GRAVITY * delta
	
	# Gérer le saut
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Déplacement automatique vers la droite
	velocity.x = SPEED

	# Appliquer le mouvement
	move_and_slide()

	# Vérification si le personnage sort du champ visible
	check_death_conditions()


func check_death_conditions() -> void:
	# Si le personnage descend trop bas, il meurt
	if position.y > death_zone_y:
		die()

	# Si le personnage sort de l'écran
	if camera and not camera.is_position_in_viewport(position):
		die()


func die() -> void:
	print("Le personnage est mort. Rechargement de la scène...")


	# Précharge et instancie la nouvelle scène
	var simultaneous_scene = preload("res://Levels/Level-1.tscn").instantiate()
	
	# Ajoute la nouvelle scène à la racine de l'arbre de scène
	_add_a_scene_manually(simultaneous_scene)

func _add_a_scene_manually(scene: Node) -> void:
	# Ajoute la nouvelle scène à l'arbre de scène
	get_tree().root.add_child(scene)
	get_tree().current_scene.queue_free()
