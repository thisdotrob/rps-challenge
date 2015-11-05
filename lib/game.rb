require_relative 'player'

class Game
  extend Forwardable

  def_delegator :player1, :name, :player1_name
  def_delegator :player2, :name, :player2_name
  def_delegator :player1, :chosen?, :player1_chosen?
  def_delegator :player2, :chosen?, :player2_chosen?
  def_delegator :player1, :choice, :player1_choice
  def_delegator :player2, :choice, :player2_choice

  MODES = [:single_player,:two_player]
  CHOICES = [:rock, :paper, :scissors, :spock, :lizard]
  SET_MODE_ERROR = "argument should be :#{MODES[0]} or :#{MODES[1]}"
  SET_CHOICE_ERROR = "choice supplied is not one one of valid options"
  DRAW_MSG = "Draw!"

  attr_reader :mode, :players

  def initialize(player1 = Player.new, player2 = Player.new)
    @players = [player1, player2]
  end

  def set_mode(mode)
    mode = mode.to_sym
    raise SET_MODE_ERROR unless MODES.include?(mode)
    @mode = mode
  end

  def set_names(player1_name, player2_name)
    player2_name ||= 'Computer'     # nil if in single player mode
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

  def winner
    return DRAW_MSG if player1.choice == player2.choice
    player2_has_losing_choice? ? player1.name : player2.name
  end

  def single_player?
    mode == :single_player
  end

  private

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
