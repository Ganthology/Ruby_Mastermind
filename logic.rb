require 'rainbow'

module Logic
  # red dot = correct color, correct position
  RED_DOT = Rainbow('•').red
  # white dot = correct color, wrong position
  WHITE_DOT = '•'.freeze

  def self.correct_place(secret_code, guess_code)
    counter = 0
    secret_code.split('').each_index do |index|
      counter += 1 if secret_code.split('')[index] == guess_code.split('')[index]
      # puts index
    end
    counter
  end

  def self.correct_color(secret_code, guess_code)
    (secret_code.split('') & guess_code.split('')).flat_map { |n| [n] * [secret_code.split('').count(n), guess_code.split('').count(n)].min }.length
  end

  def self.print_dots(secret_code, guess_code)
    hint = ''
    correct_place = Logic.correct_place(secret_code, guess_code)
    correct_color = Logic.correct_color(secret_code, guess_code)
    correct_place.times do
      hint << 'R'
      print "#{RED_DOT} " 
    end
    (correct_color - correct_place).times do
      hint << 'W'
      print "#{WHITE_DOT} " 
    end
    print("\n")
    hint
  end

  def self.valid_input?(guess_code)
    return false if guess_code.length != 4

    begin
      return true unless Float(guess_code).nil?
    rescue StandardError
      false
    end
  end
end

# Logic.printDots('1133', '1331')
# p Logic.valid_input?('1111')
# p Logic.valid_input?('11111')
# p Logic.valid_input?('1-=a')
