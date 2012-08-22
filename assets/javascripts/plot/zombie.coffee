class window.Zombie
	constructor: (@context, options = {}) ->
		# private methods
		@init = (options) =>
			@start = options['start'] || 0
			@speed = options['speed'] || 100

		@name = () => 'zombie'

		@trigger = (event) =>
			canvas = @context.canvas
			$(canvas).trigger "#{@name()}-#{event}"

		@step = (x, y) =>
			@clear()
			[ @x, @y ] = [ x, y ]
			@context.drawImage(@zombie, @x, @y)

		@clear = () =>
			@context.clearRect(@x, @y, @zombie.width, @zombie.height)

		# initialize
		@init(options)
		@zombie = new Image()
		@zombie.src = 'assets/00.png'
		[ @y, @x ] = [ 30, @start ]
		@zombie.onload = () => 
			@context.drawImage(@zombie, @x, @y)

	go: (x) =>
		@trigger('go')
		interval = setInterval(() =>
			if x > 0
				@step(@x + 1, @y)
				x = x - 1
			else if x < 0
				@step(@x - 1, @y)
				x = x + 1
			else
				clearInterval(interval)
				@trigger('stand')
		, @speed)
		interval

	run: (x) =>
		@trigger('run')
		interval = setInterval(() =>
			if x > 0 
				@step(@x + 1, @y)
				x = x - 1
			else if x < 0
				@step(@x - 1, @y)
				x = x + 1
			else
				clearInterval(interval)
				@trigger('stand')
		, @speed / 3)
		interval