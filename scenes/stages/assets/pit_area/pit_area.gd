extends Area2D


# Place at bottom of section where transition should not occur if another section is located directly below.

func _ready():
	connect("body_entered", self, "_on_body_entered")
	connect("body_exited", self, "_on_body_exited")

func _on_body_entered(body: KinematicBody2D):
	if body is Player:
		# mark player to die from falling in pit instead of transitioning to next section
		(body as Player).is_in_pit = true

func _on_body_exited(body: KinematicBody2D):
	if body is Player:
		# unmark player to prevent dying in next scene transition
		(body as Player).is_in_pit = false
