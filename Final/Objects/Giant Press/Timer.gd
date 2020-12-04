extends RichTextLabel

var s = 30


func _process(delta):
	
	set_text(str(s))
	
	if s == 0 :
		timerend()
	pass

func timerend():
	$Timer.stop()
	get_parent().queue_free()
	

func _on_Timer_timeout():
	
	s -= 1
	
	pass

