require_relative 'player'
require_relative 'verb'

class Game
  extend Forwardable
  include Verb

  def_delegator :player1, :name, :player1_name
  def_delegator :player2, :name, :player2_name
  def_delegator :player1, :chosen?, :player1_chosen?
  def_delegator :player2, :chosen?, :player2_chosen?
  def_delegator :player1, :choice, :player1_choice
  def_delegator :player2, :choice, :player2_choice
  def_delegator :winner, :choice, :winning_choice
  def_delegator :loser, :choice, :losing_choice

  CHOICES = [:rock, :paper, :scissors, :spock, :lizard]
  SET_CHOICE_ERROR = "choice supplied is not one one of valid options"
  DRAW_MSG = "Nobody"
  COMPUTER_NAME = "Computer"

  attr_reader :players

  def player1_name
    player1.name
  end

  def initialize(mode, players = [Player.new, Player.new])
    @single_player = mode == :single_player
    @players = players
  end

  def single_player?
    single_player
  end

  def set_names(player1_name, player2_name)
    player2_name ||= COMPUTER_NAME     # nil if in single player mode
    player1.set_name(player1_name)
    player2.set_name(player2_name)
  end

  def set_player_choice(choice)
    raise SET_CHOICE_ERROR unless CHOICES.include?(choice)
    player1_chosen? ? player2.set_choice(choice) : player1.set_choice(choice)
  end

  def set_computer_choice
    player2.set_choice(CHOICES.sample)
  end

  def over?
    player1_chosen? && player2_chosen?
  end

  def winners_name
    return DRAW_MSG if draw?
    winner.name
  end

  def draw?
    player1.choice == player2.choice
  end

  def verb
    Verb.get_verb(winner.choice, loser.choice) if over?
  end

  def winner
    player2_has_losing_choice? ? player1 : player2
  end

  def loser
    winner == player1 ? player2 : player1
  end


  private

  attr_reader :single_player

  def player1
    players.first
  end

  def player2
    players.last
  end

  def player2_has_losing_choice?
    losing_choices.include?(player2.choice)
  end

  def losing_choices
    player1_index = CHOICES.index(player1.choice)
    [CHOICES[player1_index-1], CHOICES[player1_index-3]]
  end
end
