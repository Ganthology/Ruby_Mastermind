class Computer
  # color_option = %w(R B G Y C M)
  color_option = %w[1 2 3 4 5 6]
  COLOR_OPTION = color_option.product(color_option).flatten

  def code_maker
    COLOR_OPTION.sample(4).join
  end

  def code_breaker(round, hint)
    if round > 1
      
    else
      '1122'
    end
    # generate a list of all possible answers
    # starts with "1122"
    # delete the impossible answers
    # repeat until end
    # return guess code
    # need some sort of interaction between the computer and game to get feedback
  end
end
