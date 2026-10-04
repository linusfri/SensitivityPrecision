extends Node

# Vanilla sliders use step = 0.1, which snaps loaded preferences (e.g. 0.284 -> 0.3)
# and then re-saves the snapped value via value_changed.
const STEP := 0.001
const SLIDERS := ["Look_Slider", "Aim_Slider", "Scope_Slider"]


func _ready():
	get_tree().node_added.connect(_on_node_added)


func _on_node_added(node: Node):
	if node is HSlider and node.name in SLIDERS and node.get_parent().get_parent().name == "Mouse":
		node.step = STEP
