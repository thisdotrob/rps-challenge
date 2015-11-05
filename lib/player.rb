class Player
  attr_reader :name, :choice

  def set_name(name)
    @name = name
  end

  def set_choice(choice)
    @choice = choice
  end

  def chosen?
    choice.nil? ? false : true
  end

end
