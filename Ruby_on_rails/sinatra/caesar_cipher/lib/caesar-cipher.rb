#caesar_cipher method
def caesar_cipher text, count
    new_text = ""
    text.each_char do |letter|
        if letter.match(/[a-zA-Z]/)
            count.times do |i|
                if letter == "z"
                    letter = "a"
                elsif letter == "Z"
                    letter = "A"
                else
                    letter = letter.next
                end
            end
            new_text << letter
        end
    end
    puts new_text
end

# #get user input for caesar_cipher
# puts "Welcome to the Caesar Cipher!"
# puts "Please enter the text you wish to encrypt:"
# user_input = gets.strip

# puts "Please enter a number to encrypt by:"
# count = gets.strip.to_i
# #checks to make sure the user input a number
# while count == /\D/
#     puts "Please enter a valid number"
#     count = gets.strip.to_i
# end

caesar_cipher("zz", 5)
