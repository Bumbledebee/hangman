require 'rspec'
require_relative '../lib/word'


describe Word do

  it "should be passed an array" do
    expect(lambda{ Word.new {} }).to raise_error
  end

  it "should be passed an array that contains only strings" do
    expect(lambda{ Word.new ["wer",3,"apple"] }).to raise_error
  end

  it "should be passed an array that contains only strings of letters" do
    expect(lambda{ Word.new ["wer","erw","apple34"] }).to raise_error
  end

end
