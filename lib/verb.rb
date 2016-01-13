module Verb

  CHOICE_VERBS = {  paper: {rock: :covers, spock: :disproves},
                    scissors: {paper: :cuts, lizard: :decapitates},
                    rock: {scissors: :crushes, lizard: :crushes},
                    lizard: {spock: :poisons, paper: :eats},
                    spock: {scissors: :smashes, rock: :vaporizes}}

  def Verb.get_verb(winning_choice, losing_choice)
    CHOICE_VERBS[winning_choice][losing_choice]
  end

end
