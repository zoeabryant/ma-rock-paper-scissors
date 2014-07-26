require 'sinatra/base'
require './lib/player'
require './lib/game'
require './lib/computer'

class RockPaperScissors < Sinatra::Base
  get '/' do
    erb :index
  end

  get '/new-game' do
  	erb :new_player
  end

  post '/register' do
  	@player = params[:name]
  	erb :play
  end

  post "/play" do
  	player = Player.new(params[:name])
  	player.picks = params[:pick]
  	computer = Computer.new.generate
  	@game = Game.new(player, computer)
  	erb :outcome
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
