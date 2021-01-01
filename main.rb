require './computer.rb'
require 'rainbow'

class Mastermind
  include Computer
  @@rounds = 1
  attr_accessor :secret_code

  def initialize
    puts 'instructions'
    puts 'options to start the game / enter to start the game'
    @secret_code = Computer.codeMaker
    p @secret_code

    until(@guess_code == @secret_code || @@rounds > 12)
      puts 'Guess a combination (Format: RGBC)'
      @guess_code = gets.chomp.upcase
      printCode
      puts "Current round: #{@@rounds}"
      @@rounds += 1
      if @guess_code == @secret_code
        puts 'You are correct!'
      else
        puts 'Try again'
      end
    end

  end

  def instructions
    
  end

  def printCode
    @guess_code.split.each do |code|
      case code
      when '1'
      print "#{Rainbow(' 1 ').background(:red)}"
      when '2'
      print "#{Rainbow(' 2 ').background(:blue)}"
      when '3'
      print "#{Rainbow(' 3 ').background(:green)}"
       when '4'
      print "#{Rainbow(' 4 ').background(:yellow)}"
      when '5'
      print "#{Rainbow(' 5 ').background(:cyan)}"
      when '6'
      print "#{Rainbow(' 6 ').background(:magenta)}"
      end
    end
  end
end

game = Mastermind.new