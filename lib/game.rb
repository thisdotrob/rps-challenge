class Game

  MODES = [:single_player,:two_player]
  SET_MODE_ERROR = "argument should be :#{MODES[0]} or :#{MODES[1]}"

  attr_reader :mode

  def set_mode(mode)
    raise SET_MODE_ERROR unless MODES.include?(mode)
    @mode = mode
  end

end
