class Word
  attr_reader :scrubbed_dict, :blank_word, :random_word

  #initialize object
  def initialize
    @scrubbed_dict = ""
    dictionary_exists?
    load_dictionary
    @random_word = pick_random_word(scrubbed_dict)
    @blank_word = hide_word(random_word)
  end

  #chooses random word from dictionary
  def pick_random_word(dictionary)
    random_num = rand(dictionary.length)
    dictionary[random_num]
  end

  #scrubs a indicated dictionary file
  def scrub_dictionary(dictionary)
    dictionary.each do |word|
      word = word.chomp.downcase
      unless word.length >= 5 && word.length <= 12
        dictionary.delete(word)
      end
    end
  end

  #loads a scrubbed dictionary
  def load_dictionary
    @scrubbed_dict = File.readlines("dictionary.txt")
    puts "Dictionary loaded"
  end

  #checks working dir for scrubbed dictionary
  def dictionary_exists?
    unless File.exist?("dictionary.txt")
      dictionary = File.readlines("5desk.txt")
      scrub_dictionary(dictionary)
      create_dictionary_file
    end

  end
  
  #creates newly scrubbed dictionary file
  def create_dictionary_file
    File.open("dictionary.txt", "w") do |f|
      f.puts @dictionary
      end
  end

  #hides the chosen word for later uses
  def hide_word(chosen_word)
    blank_word = chosen_word.gsub(/\w/,"_")
  end
end
