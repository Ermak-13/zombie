#= require_tree ./libs
#= require_tree ./game

jQuery ->
	canvas = document.getElementById('game-plot')

	window.plot = new Plot(canvas)
	console.log(plot)