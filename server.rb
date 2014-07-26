require 'sinatra/base'
require './lib/player'
require './lib/game'
require './lib/computer'

class RockPaperScissors < Sinatra::Base
  get '/' do
    erb :index
  end

  get '/new_player' do
    erb :new_player
  end

  post '/play' do
    @player_name = params[:name]

    erb :play
  end

  post "/results" do
    @player_name = params[:name]
    @player = Player.new(@player_name)
  	@player.picks = params[:pick]

  	@computer = Computer.new.generate

  	@game = Game.new(@player, @computer)

  	erb :results
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
