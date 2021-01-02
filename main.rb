require './computer.rb'
require './logic.rb'
require 'rainbow'

class Mastermind
  include Logic
  include Computer
  @@rounds = 1
  attr_accessor :secret_code, :mode

  def initialize
    instructions
    choose_mode
    @secret_code = Computer.code_maker
    p @secret_code

    until @guess_code == @secret_code || @@rounds > 12
      puts 'Guess a combination (Format: 1234)'
      @guess_code = gets.chomp.upcase

      until Logic.valid_input?(@guess_code)
        puts 'Invalid input, please enter in the correct format (Format: 1234)...'
        @guess_code = gets.chomp.upcase
      end

      print_code
      Logic.print_dots(@secret_code, @guess_code)

      puts "Current round: #{@@rounds}"
      @@rounds += 1

      puts 'You are correct!' if @guess_code == @secret_code

      puts ''
      # if @guess_code == @secret_code
      #   puts 'You are correct!'
      # else
      #   Logic.printDots(@secret_code, @guess_code)
      # end
    end
  end

  def instructions
    puts "Mastermind is a code-breaking game for two players.

One will become the codemaker and another one will have to guess the secret code.

The codemaker chooses a pattern of four code pegs.
The 6 colors that can be choose are

    #{Rainbow('  1  ').background(:red)} #{Rainbow('  2  ').background(:blue)} #{Rainbow('  3  ').background(:green)} #{Rainbow('  4  ').background(:yellow)} #{Rainbow('  5  ').background(:cyan)} #{Rainbow('  6  ').background(:magenta)}

The codebreaker tries to guess the pattern, in order and color, within twelve turns.

#{Rainbow('•').red} means correct color and correct position.
• means correct color but wrong position.
\n
"
  end

  def print_code
    @guess_code.split('').each do |code|
      case code
      when '1'
        print "#{Rainbow('  1  ').background(:red)}  "
      when '2'
        print "#{Rainbow('  2  ').background(:blue)}  "
      when '3'
        print "#{Rainbow('  3  ').background(:green)}  "
      when '4'
        print "#{Rainbow('  4  ').background(:yellow)}  "
      when '5'
        print "#{Rainbow('  5  ').background(:cyan)}  "
      when '6'
        print "#{Rainbow('  6  ').background(:magenta)}  "
      end
    end
  end

  def choose_mode
    puts "Choose mode for the game:

    1) Computer codemaker, Human codebreaker
    2) Human codemaker, Computer codebreaker

"
    until @mode == '1' || @mode == '2'
      puts "Choose (1) or (2)"
      @mode = gets.chomp
    end
    case @mode
    when '1'
      puts 'You are the codebreaker!'
    when '2'
      puts 'You are the codemaker!'
    end
    @mode
  end
end

game = Mastermind.new
