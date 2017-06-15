def random_word(dictionary)
  random_num = rand(dictionary.length)
  dictionary[random_num]
end

def scrub_dictionary(dictionary)
  dictionary.each do |word|
    word.gsub(/"/,'')
  end
end

dictionary = File.readlines("5desk.txt")
puts "Dictionary loaded"
scrub_dictionary(dictionary)
puts "Dictionary scrubbed"

word = ""
until word.length >= 5 && word.length <= 12
  word = random_word(dictionary)
end
puts word, word.length
