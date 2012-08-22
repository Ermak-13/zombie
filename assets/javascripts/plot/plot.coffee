class window.Plot
	constructor: (@canvas, options = {}) ->
		# private methods
		@init = (options) =>
			@start = options['start'] || 100
			@end = options['end'] || 700
			@bonus = options['bonus'] || 100
			@penalty = options['penalty'] || 100

		@name = () => 'plot'

		@trigger = (event) =>
			$(@canvas).trigger "#{@name()}-#{event}"

		# initialize
		@context = @canvas.getContext('2d')
		@init(options)
		@zombie = new Zombie(@context, {start : @start })
		@interval = @zombie.go(@end - @zombie.x)
		$(@canvas).bind('zombie-stand', () =>
			if @zombie.x == @end
				@gameover()
			else
				@interval = @zombie.go(@end - @zombie.x)
		)

	success: () =>
		clearInterval(@interval)
		temp = @zombie.x - (@start + @bonus)
		bonus = if temp > 0 then @bonus else @zombie.x - @start
		@interval = @zombie.go(-bonus)

	fail: () =>
		clearInterval(@interval)
		temp = @end - (@zombie.x + @penalty)
		penalty = if temp > 0 then @penalty else @end - @zombie.x 
		@interval = @zombie.run(penalty)

	win: () =>
		@trigger('win')
		alert 'WIN!'

	gameover: () =>
		@trigger('gameover')
		alert 'GAME OVER!'
