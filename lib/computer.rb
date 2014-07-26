class Computer

	attr_reader :bot

	def choices
		['Rock', 'Paper', 'Scissors']
	end

	def choice
		choices.sample
	end

	def generate
		@bot = Player.new("computer")
		@bot.picks = choice
		@bot
	end

end