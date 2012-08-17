#= require_tree ./libs

jQuery ->
	canvas = document.getElementById('game')
	context = canvas.getContext('2d')
	zombie = new Image()
	zombie.src = '/assets/zombie.png'
	zombie.onload = () -> context.drawImage(zombie, 0, canvas.height - zombie.height)

	hero = new Image()
	hero.src = '/assets/heroes.png'
	hero.onload = () -> context.drawImage(hero, 0, 0)
	