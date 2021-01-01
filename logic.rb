require 'rainbow'

module Logic
  # red dot = correct color, correct position
  RED_DOT = Rainbow('•').red
  # white dot = correct color, wrong position
  WHITE_DOT = '•'

  def self.correct_place(secret_code, guess_code)
    counter = 0
    secret_code.split('').each_index do |index|
      counter += 1 if (secret_code.split('')[index] == guess_code.split('')[index])
      #puts index
    end
    counter
  end

  def self.correct_color(secret_code, guess_code)
    (secret_code.split('') & guess_code.split('')).flat_map { |n| [n] * [secret_code.split('').count(n), guess_code.split('').count(n)].min }.length
  end

  def self.printDots(secret_code, guess_code)
    correct_place = Logic.correct_place(secret_code, guess_code)
    correct_color = Logic.correct_color(secret_code, guess_code)
    correct_place.times { print "#{RED_DOT} " }
    (correct_color - correct_place).times { print "#{WHITE_DOT} " }
    print("\n")
  end
end

#Logic.printDots('1133', '1331')
