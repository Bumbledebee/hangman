require_relative 'word'
require 'pry'

class GameMaster

  attr_reader :letters
  attr_accessor :guessed_letters

  def initialize(wordbank)
    puts "Welcome to Hangman!"
    word = Word.new(wordbank)
    #funny 1
    @word = word.word
    print @word
    @letters = word.word.split('')
    puts "Word: #{word.word.gsub(/\w/, '_')}"
    @guessed_letters = []
    @chances = 8
    prompt_guess
    gameflow
  end

  private

  def print_word
    #funny 2
    @regex = /[^[#{@guessed_letters.join('')}]]+/
    print "Word: #{@letters.join.gsub(@regex, '_')}\n"
  end

  def prompt_guess
    print "Guess a single letter (a-z) or the entire word: "
    @input = gets.chomp
  end

  def validate_input
    if @input.length == 1
      check_letter
    else
      check_word
    end
  end

  def check_letter
    @guessed_letter = @input
    @guessed_letters << @guessed_letter if @letters.include?(@guessed_letter)
    if @letters.include?(@guessed_letter)
      puts "Found occurrence(s) of the character #{@guessed_letter}."
      binding.pry
      print_word
    else
      puts "Sorry, no #{@guessed_letter}'s found."
      puts "Word: #{@word.gsub(/\w/, '_')}"
      @chances -= 1
    end
  end

  def check_word
    @guessed_word = @user_input
      if @guessed_word == @word
        print "Hurray you won, it is indeed #{@word}"
        exit
      else
        print "That was wrong. Sorry, game over."
        exit
      end
  end

  def gameflow
    validate_input
    while @chances > 0
      prompt_guess
      validate_input
      if @letters.uniq.sort == @guessed_letters.uniq.sort
        print "Hurray you won, #{@word} is correct"
        exit
      end
    end
  end

end

GameMaster.new ["apple", "orange", "pear"]

### question: How to fix the regex thing ?
### How to get the string of the object ??
