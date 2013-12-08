require 'pry'

class Word

  attr_reader :word

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

end


# print Word.new(["heelo", "sdf", "wer"])
