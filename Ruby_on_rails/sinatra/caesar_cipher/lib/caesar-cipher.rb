#caesar_cipher method
def caesar_cipher text, count
    new_text = ""
    count = count.to_i
    if text.nil?
        return
    else
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
            else
                new_text << letter
            end
        end
    end
    new_text
end

