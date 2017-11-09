
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
	tab_bg.animate("a")
	this.opacity=1
	tab_2.opacity=.5
	kidProfile("Jayden",33,2,51,12)

tab_2.onTap ->
	tab_bg.animate("b")
	this.opacity=1
	tab_1.opacity=.5
	kidProfile("jimmy",47,2,14,13)
	


screenTime_pgComp = new PageComponent
	width: profile_1.width
	y: 270
	height: 90
	parent:profile_1
	screenTime_pgCompVertical: false

today.parent=screenTime_pgComp.content
screenTime_pgComp.addPage(weekly, "right")
dot_1.opacity=1
dot_2.opacity=.5
screenTime_pgComp.on "change:currentPage", ->
	pageName= screenTime_pgComp.currentPage.name
	if pageName is "weekly"
		dot_1.opacity=.5
		dot_2.opacity=1
	else
		dot_1.opacity=1
		dot_2.opacity=.5

    