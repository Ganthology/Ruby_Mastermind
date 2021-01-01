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
    chooseMode
    @secret_code = Computer.codeMaker
    p @secret_code

    until @guess_code == @secret_code || @@rounds > 12
      puts 'Guess a combination (Format: RGBC)'
      @guess_code = gets.chomp.upcase
      printCode
      puts "Current round: #{@@rounds}"
      @@rounds += 1
      puts 'You are correct!' if @guess_code == @secret_code
    end
  end

  def instructions
    puts "Mastermind is a code-breaking game for two players.

One will become the codemaker and another one will have to guess the secret code.

The codemaker chooses a pattern of four code pegs.
The 6 colors that can be choose are

    #{Rainbow('  1  ').background(:red)} #{Rainbow('  2  ').background(:blue)} #{Rainbow('  3  ').background(:green)} #{Rainbow('  4  ').background(:yellow)} #{Rainbow('  5  ').background(:cyan)} #{Rainbow('  6  ').background(:magenta)}

The codebreaker tries to guess the pattern, in order and color, within twelve turns.\n
"
  end

  def printCode
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
    print "\n"
  end

  def chooseMode
    puts "Choose mode for the game:

    1) Computer codemaker, Human codebreaker
    2) Human codemaker, Computer codebreaker

Choose (1) or (2)"
    mode = gets.chomp
    mode
  end
end

game = Mastermind.new
