module Computer
  # color_option = %w(R B G Y C M)
  color_option = %w[1 2 3 4 5 6]
  COLOR_OPTION = color_option.product(color_option).flatten

  def self.code_maker
    COLOR_OPTION.sample(4).join
  end
end
