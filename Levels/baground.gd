extends Sprite2D

var player : Node2D # Référence au nœud Player

func _ready():
	# Obtenir la référence au joueur (vous devez assigner le Player depuis l'inspecteur ou dans le script de la scène)
	player = get_node("/root/Player") # Remplacez "Player" par le chemin réel de votre nœud joueur dans la scène

func _process(delta: float) -> void:
	if player:
		# Calculer la position en fonction de la position du joueur
		var player_position = player.position

		# Déplacer le Sprite2D pour qu'il suive la position du joueur
		position = player_position
