# This imports all the layers for "kakaoProfile" into kakaoprofileLayers
doc = Framer.Importer.load "imported/kakaoProfile"
Utils.globalLayers(doc)

# profileContainer = Photo + white box
profileContainer.draggable.enabled = true
profileContainer.draggable.horizontal = false
originX = profileContainer.x
originY = profileContainer.y
bottomY = profileContainer.maxY

# heroImage = Container for heroBG
heroOriginY = heroImage.y
heroheight = heroImage.height
profilewrapOriginHeight = profilewrap.height

# heroBG = Background Image 
heroBG.originX = 0.5
heroBgHeight = heroBG.height

# statusLabel = "안녕!"
statusOriginY = statusLabel.y

whiteBG = new BackgroundLayer
	backgroundColor: "white"

# ------- Events
# Up & Down: Image gets bigger, statusLabel moves, whitebox stretches
profileContainer.on Events.DragMove, ->
	profilewrap.height = profilewrapOriginHeight + (bottomY - 
	profileContainer.y)	
	statusLabel.y = Utils.modulate(profileContainer.y, [0,Screen.height], [0, 668], true)
		
	scrollChecker = (profileContainer.y - profilewrapOriginHeight - 162)

	if scrollChecker >= 0
		heroImage.scale = Utils.modulate(profileContainer.y, [0, Screen.height], [1, 1.2], true)
		heroBG.scale = heroImage.scale
	else
		statusLabel.opacity = Utils.modulate(profileContainer.y, [0,statusOriginY], [0, 1], true)
		statusLabel.scale = Utils.modulate(profileContainer.y, [0,statusOriginY], [0.5, 1], true)
		closeIcon.opacity = Utils.modulate(profileContainer.y, [0,statusOriginY], [0, 1], true)

# Back to the initial positions.	
profileContainer.on Events.DragEnd, ->
	profileContainer.animate
		properties:
			x: originX
			y: originY
		time: 0.4
		curve: "ease"
			
	heroBG.animate
		properties:
			scale: 1 
		time: 0.3
		curve: "ease"
	
	statusLabel.animate
		properties:
			y: statusOriginY
			opacity:1
			scale: 1
		time: 0.3
		curve: "ease"	
				
	closeIcon.animate
		properties:
			opacity:1
		time: 0.3
		curve: "ease"		
		
#test		
