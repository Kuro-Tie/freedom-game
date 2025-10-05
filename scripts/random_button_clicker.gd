extends Node


var score_number = 0 #Clicked Score number data variable


func _ready():
	$Congrats_Label.hide()
	randomize_pos()#Call when start of the game

func randomize_pos(): # this function change position of the ClickMe Button
	randomize()
	var randxpos = randi_range(0,$Background.size.x-128)#Adjust to screen position it gets numbers of background.
	var randypos = randi_range(0,$Background.size.y-128)#Adjust to screen position it gets numbers of background.
	$ClickMe.position = Vector2(randxpos,randypos)
	$ClickMe.show()#show to player ClickMe button
	$ChangePosition_Timer.start()

func changepos(): #When ChangePosition_Timer finishes this function works
	randomize_pos()
	_Check_score_give_msg()#After checking score it gives Messages.
func _add_score():#Adding score number when clicked the button
	score_number += 1
	print(score_number)
	$Score_Number.text = "Love Score = " + str(score_number)
	$ClickMe.hide()#hide if you clicked it so multiple clicks not hapen

func _Check_score_give_msg():#After checking score it gives messages if equals
	if score_number == 10:
		$Congrats_Label.text = "Good"
		show_it_then_hide_it()
	if score_number == 50:
		$Congrats_Label.text = "You Know your stuff"
		show_it_then_hide_it()
	if score_number == 100:
		$Congrats_Label.text = "Unbelievable"
		show_it_then_hide_it()
func show_it_then_hide_it():
	$Congrats_Label.show()
	$Timer_For_Label_hide.start()#To Hide label it starts a timer


func hide_to_label():
	$Congrats_Label.hide()#Hides the label


func change_background():
	var MY_list_background = ["res://assets/red_background.png","res://assets/orange_background.png","res://assets/yellow_blackground.png","res://assets/green_background.png","res://assets/blue_background.png","res://assets/purple_background.png"]
	$Background.texture = load(MY_list_background.pick_random())
