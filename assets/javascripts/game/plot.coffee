class window.Plot
	constructor: (@canvas, options = {}) ->
		@context = @canvas.getContext('2d')
		[ @start, @end ] = [ 100, 700 ]
		[ @bonus, @penalty ] = [ 100, 100 ]
		@zombie = new Zombie(@canvas, @context, {start : @start })
		@interval = @zombie.go(@end - @zombie.x)
		$(@canvas).bind('stand', () =>
			if @zombie.x == @end
				@gameover()
			else
				@interval = @zombie.go(@end - @zombie.x)
		)

	success: () =>
		clearInterval(@interval)
		temp = @zombie.x - (@start + @bonus)
		bonus = if temp > 0 then @bonus else @zombie.x - @start
		console.log bonus
		@interval = @zombie.go(-bonus)

	fail: () =>
		clearInterval(@interval)
		temp = @end - @zombie.x + @penalty
		penalty = if temp > 0 then @penalty else @end - @zombie.x 
		@interval = @zombie.run(penalty)

	win: () =>
		alert 'WIN!'

	gameover: () =>
		alert 'GAME OVER!'
