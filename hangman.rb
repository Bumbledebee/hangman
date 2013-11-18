#!/usr/bin/env ruby

puts "Welcome to Hangman!"

#the word bank
words = ["apple", "banana", "orange"]
#chossing a random word
@word = words[rand(words.length)]
puts @word
#turning that word into an array of letters
@letters = @word.split('')
@chances = 8
print "Word: "
  @letters.each do |l|
    print"_"
  end
puts " "
puts "Chances remaining:" + @chances.to_s

print "Guess a single letter (a-z) or the entire word: "
@guessed_letters = []

def ask_again
  print "Word: "
  @letters.each do |l|
    if @guessed_letters.include?(l)
      print l
      else
      print "_"
    end
  end
  puts " "
  puts "Chances remaining: " + @chances.to_s

  print "Guess a single letter (a-z) or the entire word: "
end

def validate_input
  @user_input = gets.chomp
  if @user_input.length == 1
    @guessed_letter = @user_input
    @guessed_letters << @guessed_letter if @letters.include?(@guessed_letter)
    if @letters.include?(@guessed_letter)
      puts "Found occurrence(s) of the character #{@guessed_letter}."
    else
      puts "Sorry, no #{@guessed_letter}'s found."
      @chances -= 1

    end
  elsif @user_input.length > 1
    @guessed_word = @user_input
      if @guessed_word == @word
        print "Hurray you won, it is indeed #{@word}"
        exit
      else
        print "That was wrong. Sorry, game over."
        exit
      end
  end
end

validate_input
while @chances > 0
  ask_again
  validate_input
  if @letters.uniq.sort == @guessed_letters.uniq.sort
    print "Hurray you won, it is indeed #{@word}"
    exit
  end
end












