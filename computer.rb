require './logic.rb'
require 'set'

class Computer
  include Logic
  # color_option = %w(R B G Y C M)
  # color_option = %w[1 2 3 4 5 6]
  # COLOR_OPTION = color_option.product(color_option).flatten
  @@colors = '123456'.chars
  def initialize
    @all_answers = @@colors.product(*[@@colors] * 3).map(&:join)
    @all_scores = Hash.new { |h, k| h[k] = {} }

    @all_answers.product(@all_answers).each do |guess, answer|
      @all_scores[guess][answer] = Logic.calculate_score(guess, answer)
    end

    @all_answers = @all_answers.to_set
    @possible_scores = @all_scores.dup
    @possible_answers = @all_answers.dup
  end
  # @all_answers.product(@all_answers).each do |guess, answer|
  #   @all_scores[guess][answer] = calculate_score(guess, answer)
  # end

  def code_maker
    # COLOR_OPTION.sample(4).join
    4.times.map { @@colors.sample }.join
  end

  def code_breaker(round = 0, hint)
    if round > 0
      @possible_answers.keep_if{ |answer|
        @all_scores[round][answer] == hint
      }
      guesses = @possible_scores.map do |guess, scores_by_answer|
        scores_by_answer = scores_by_answer.select{|answer, score|
          @possible_answers.include?(answer)
        }
        @possible_scores[guess] = scores_by_answer

        score_groups = scores_by_answer.values.group_by(&:itself)
        possibility_counts = score_groups.values.map(&:length)
        worst_case_possibilities = possibility_counts.max
        impossible_guess = @possible_answers.include?(guess) ? 0 : 1
        [worst_case_possibilities, impossible_guess, guess]
      end
      guesses.min.last
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
