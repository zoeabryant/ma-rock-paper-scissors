require 'sinatra/base'
require './lib/player'
require './lib/game'
require './lib/computer'

PLAYER_NAME = ''

class RockPaperScissors < Sinatra::Base
  get '/' do
    erb :index
  end

  get '/new_player' do
    erb :new_player
  end

  post '/play' do
    PLAYER_NAME = params[:name]
    @player_name = PLAYER_NAME

    erb :play
  end

  get '/play' do
    @player_name = PLAYER_NAME

    erb :play
  end

  post "/results" do
  	player = Player.new(PLAYER_NAME)
  	player.picks = params[:pick]

  	computer = Computer.new.generate

  	@game = Game.new(player, computer)

  	erb :results
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
