extends Node

var score_number = 0 #Clicked Score number data variable

func _ready():
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

func _add_score():#Adding score number when clicked the button
	score_number += 1
	$Score_Number.text = "Score = " + str(score_number)
	$ClickMe.hide()#hide if you clicked it so multiple clicks not hapen
