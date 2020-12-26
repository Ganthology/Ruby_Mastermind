=begin
MASTERMIND game

6 color options, 4 places
color_option = %w(RED BLUE GREEN YELLOW CYAN MAGENTA)
color_option = color_option.product(color_option).flatten

4 holes for giving hint, red white empty dots

4 options
1. Human code picker, Human code guesser
2. Human code picker, Computer code guesser
3. Computer code picker, Human code guesser
4. Computer code picker, Computer code guesser1

for the computer code picker, use #sample method to choose from color_option
secret_code = color_option.sample(4)

classes needed: code(define the code logic), display(display the results), mastermind(for a complete round of game), player class and computer class(containing different approach to the game)
=end

# first version : computer generate random code, player guess the code

class Mastermind
  @@rounds = 1
  attr_accessor :secret_code
  color_option = %w(R B G Y C M)
  COLOR_OPTION = color_option.product(color_option).flatten

  def initialize
    puts 'instructions'
    puts 'options to start the game / enter to start the game'
    @secret_code = COLOR_OPTION.sample(4).join
    p @secret_code
    until(@guess_code == @secret_code || @@rounds > 12)
      puts 'Guess a combination (Format: RGBC)'
      @guess_code = gets.chomp.upcase
      puts "Current round: #{@@rounds}"
      @@rounds += 1
      if @guess_code == @secret_code
        puts 'You are correct!'
      else
        puts 'Try again'
      end
    end

  end
end

game = Mastermind.new