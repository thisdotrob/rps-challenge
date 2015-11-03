require 'sinatra/base'
require_relative './lib/game'

class Rps < Sinatra::Base
  get '/' do
    redirect '/mode-select'
  end

  get '/mode-select' do
    erb :mode_select
  end

  post '/set-mode' do
    $game = Game.new
    $game.set_mode(params[:mode].to_sym)
    redirect '/enter-names'
  end

  get '/enter-names' do
    erb :enter_names
  end

  post '/set-names' do
    player1_name = params[:player1_name]
    player2_name = params[:player2_name]    # nil if single player mode
    $game.set_names(player1_name, player2_name)
    redirect '/start-game'
  end

  get '/start-game' do
    erb :start_game
  end

  run! if app_file == $0
end
