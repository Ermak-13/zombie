#= require_tree ./libs

jQuery ->
	canvas = document.getElementById('game-plot')
	context = canvas.getContext('2d')

	zombie = new Image()
	zombie.src = 'assets/00.png'
	zombie.onload = () -> context.drawImage(zombie, 0, canvas.height - zombie.height)