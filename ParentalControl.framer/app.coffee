

#--------Internet Access Bar Control-------#
accessStatus=1
dragDirection=
statusArry=[Status_white,Status_block,Status_no]
switchStatus=(accessStatus) ->
	for s in statusArry
		s.color="#999999"
		statusArry[accessStatus].color="#4CD7A2"
#------#
btn_InternetBar.states=
	block:
		x:291
		animationOptions:
			time:.4
	white:
		x:8
		animationOptions:
			time:.4
	no:
		x:576
		animationOptions:
			time:.4
btn_InternetBar.draggable.enabled = true
btn_InternetBar.draggable.vertical = false
btn_InternetBar.draggable.overdrag = false
btn_InternetBar.draggable.constraints =
	x: 8
	width: 614
btn_InternetBar.onTapStart ->
	this.scale=1.4
btn_InternetBar.onTapEnd ->
	this.scale=1
	
		
btn_InternetBar.on Events.DragMove, ->
	dragDirection=btn_InternetBar.draggable.direction
btn_InternetBar.on Events.DragEnd, ->
	if dragDirection is "left"
		accessStatus-=1
	else if dragDirection is "right" and accessStatus<2
		accessStatus+=1
	switch accessStatus
		when 0	
			switchStatus(accessStatus)
			btn_InternetBar.animate("white")
		when 1
			switchStatus(accessStatus)
			btn_InternetBar.animate("block")
		when 2
			switchStatus(accessStatus)
			btn_InternetBar.animate("no")
#--------#
btn_white.onTapEnd ->
	btn_InternetBar.animate("white")
	accessStatus=0
	switchStatus(accessStatus)
btn_block.onTapEnd ->
	btn_InternetBar.animate("block")
	accessStatus=1
	switchStatus(accessStatus)
btn_no.onTapEnd ->
	btn_InternetBar.animate("no")
	accessStatus=2
	switchStatus(accessStatus)
#-------END---Internet Access Bar Control-------#


#-----Switch Kid-----#
tab_2.opacity=.5
tab_bg.states=
	a:
		y:tab_1.y
		options: 
			time:.2
	b:
		y:tab_2.y
		options: 
			time:.2
kidProfile=(name,today1,today2,week1,week2) ->
	kid_name.text=name
	today_m.text=today1
	today_h.text=today2
	week_m.text=week1
	week_h.text=week2
tab_1.onTap ->
	accessStatus=1
	switchStatus(accessStatus)
	btn_InternetBar.stateSwitch("block")
	tab_bg.animate("a")
	this.opacity=1
	tab_2.opacity=.5
	kidProfile("Jayden",33,2,51,12)

tab_2.onTap ->
	accessStatus=2
	switchStatus(accessStatus)
	btn_InternetBar.stateSwitch("no")
	tab_bg.animate("b")
	this.opacity=1
	tab_1.opacity=.5
	kidProfile("Tommy",47,2,14,13)
#-----END Switch Kid-----#	


#-----Screentime-----#
screenTime_W.opacity=.5
screenTime_pgComp = new PageComponent
	width: profile_1.width
	y: 264
	height: 90
	parent:profile_1
	scrollVertical: false

today.parent=screenTime_pgComp.content
screenTime_pgComp.addPage(weekly, "right")
dot_1.opacity=1
dot_2.opacity=.5
screenTime_pgComp.on "change:currentPage", ->
	pageName= screenTime_pgComp.currentPage.name
	if pageName is "weekly"
		dot_1.opacity=.5
		dot_2.opacity=1
		screenTime_W.opacity=1
		screenTime_D.opacity=.4
	else
		dot_1.opacity=1
		dot_2.opacity=.5
		screenTime_W.opacity=.4
		screenTime_D.opacity=1
#-----END Screentime-----#
