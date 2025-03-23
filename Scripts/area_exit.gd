extends Area2D
class_name AreaExit

func _on_body_entered(body: Node2D) -> void:
		if body is GuyController:
			GameManager.next_level()
