#caesar_cipher method
def caesar_cipher text, count
    #create an array for new text
    new_letters = []
    #gets ascii value of each character
    text_vals = text.bytes
    #iterates through the array and adjusts char by count
    for val in text_vals
        #check if value is A-Z
        if val >= 65 && val <= 90
            new_val = val + count
            #make sure the letters wrap around
            if new_val > 90
                wrap = new_val % 90
                new_val = 64
                new_val += wrap
                val = new_val 
            end
        #check if value is a-z
        elsif val >= 97 && val <= 122
            new_val = val + count
            #make sure the letters wrap around
         if new_val > 122
                wrap = new_val % 122
                new_val = 96
                new_val += wrap
                val = new_val
            end
        #checks to see if value is a special character or digit
        #if so just keep the current value
        else
            new_val = val
        end
        #change each value into a letters
        new_letter =  new_val.chr
        #insert new values into new_text array
        new_letters.push(new_letter)
    end
    new_text = new_letters.join("")
    p new_text
end

#get user input for caesar_cipher
puts "Welcome to the Caesar Cipher!"
puts "Please enter the text you wish to encrypt:"
user_input = gets.strip

puts "Please enter a number to encrypt by:"
count = gets.strip.to_i
#checks to make sure the user input a number
while count == /\D/
    puts "Please enter a valid number"
    count = gets.strip.to_i
end

caesar_cipher(user_input, count)
