#= require_tree ./libs
#= require_tree ./plot

jQuery ->
	canvas = document.getElementById('game-plot')

	window.plot = new Plot(canvas)
	console.log(plot)