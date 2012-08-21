class window.Plot
	constructor: (@canvas, options = {}) ->
		@context = @canvas.getContext('2d')
		[ @start, @end ] = [ 100, 700 ]
		[ @bonus, @penalty ] = [ 100, 20 ]
		@zombie = new Zombie(@canvas, @context, {speed : 10, start : @start })
		@interval = @zombie.go(@end - @zombie.x)

	success: () =>
		clearInterval(@interval)
		temp = @zombie.x - @start + @success
		step = if temp > 0 then @success else @zombie.x - @start
		@interval = @zombie.go(-step)
		$(@canvas).bind('stand', () =>
			@interval = @zombie.go(@end - @zombie.x)
		)

	fail: () =>