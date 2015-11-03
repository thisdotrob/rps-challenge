class Game

  MODES = [:single_player,:two_player]
  CHOICES = [:rock, :paper, :scissors, :lizard, :spock]
  SET_MODE_ERROR = "argument should be :#{MODES[0]} or :#{MODES[1]}"

  attr_reader :mode, :player1_name, :player2_name, :player1_choice, :player2_choice

  def set_mode(mode)
    raise SET_MODE_ERROR unless MODES.include?(mode)
    @mode = mode
  end

  def set_names(player1_name, player2_name)
    player2_name ||= 'Computer'
    @player1_name = player1_name
    @player2_name = player2_name
  end

  def set_player_choice(choice)
    player1_chosen? ? @player2_choice = choice : @player1_choice = choice
  end

  def set_computer_choice
    @player2_choice = CHOICES.sample
  end

  def player1_chosen?
    true unless player1_choice.nil?
  end

  def over?
    @player1_choice && @player2_choice
  end

end
