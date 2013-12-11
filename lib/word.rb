require 'pry'

class Word

  attr_reader :word, :letters

  def initialize(wordbank)
    if wordbank.class != Array
      raise "Sorry, enter wordbank as array"
    end

    wordbank.each do |word|
      if word.class != String
        raise "Sorry, strings only"
      end
      if word !~ (/\A[a-zA-Z]+\z/)
        raise "Sorry, words only"
      end
      wordbank
    end

    @word = wordbank.sample.downcase
  end

  def letters
    @letters = word.split('')
  end

end


class Display

  def self.print_beginning word
    puts "Word: #{word.word.gsub(/\w/, '_')}"
  end

  def self.print_progress
  end

end


@word = Word.new(["apple", "pear", "banana"])
Display.print_beginning @word
