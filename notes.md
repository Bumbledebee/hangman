- move methods from game master to word class so I call methods on the object word, e.g. word.has_letter ?

- dont instantiate game_master with array of words, you could have a class variable or constant on Word itself and that is an array of words and replaces the word bank.
WORDBANK.sample

- games master : only
- word : know all about the word
