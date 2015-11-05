require 'sinatra/base'
require_relative './lib/game'

class Rps < Sinatra::Base

  enable :sessions

  get '/' do
    redirect '/mode-select'
  end

  get '/mode-select' do
    erb :mode_select
  end

  post '/set-mode' do
    game = Game.new(params[:mode].to_sym)
    session[:game] = game
    redirect '/enter-names'
  end

  get '/enter-names' do
    @game = session[:game]
    erb :enter_names
  end

  post '/set-names' do
    game = session[:game]
    game.set_names(params[:player1_name], params[:player2_name])
    redirect '/start-game'
  end

  get '/start-game' do
    @game = session[:game]
    erb :start_game
  end

  get '/make-choice' do
    @game = session[:game]
    erb :make_choice
  end

  post '/set-choice' do
    game = session[:game]
    game.set_computer_choice if game.single_player?
    game.set_player_choice(params[:choice].to_sym)
    redirect '/game-result' if game.over?
    redirect '/make-choice'
  end

  get '/game-result' do
    @game = session[:game]
    erb :game_result
  end

  run! if app_file == $0
end
