extends Node

var score_number = 0 #Clicked Score number data variable

func _ready():
	$Congrats_Label.hide()
	randomize_pos()#Call when start of the game

func randomize_pos(): # this function change position of the ClickMe Button
	randomize()
	var randxpos = randi_range(0,1024)
	var randypos = randi_range(0,524)
	$ClickMe.position = Vector2(randxpos,randypos)
	$ClickMe.show()#show to player ClickMe button
	$ChangePosition_Timer.start()

func changepos(): #When ChangePosition_Timer finishes this function works
	randomize_pos()
	_Check_score_give_msg()#After checking score it gives Messages.
func _add_score():#Adding score number when clicked the button
	score_number += 1
	$Score_Number.text = "Score = " + str(score_number)
	$ClickMe.hide()#hide if you clicked it so multiple clicks not hapen

func _Check_score_give_msg():#After checking score it gives messages if equals
	if score_number == 10:
		$Congrats_Label.text = "Good"
		$Congrats_Label.show()
		$Timer_For_Label_hide.start()#To Hide label it starts a timer
	if score_number == 50:
		$Congrats_Label.text = "You Know your stuff"
	if score_number == 100:
		$Congrats_Label.text = "Unbelievable"


func hide_to_label():
	$Congrats_Label.hide()#Hides the label
