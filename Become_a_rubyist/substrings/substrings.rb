def substrings input, dictionary
input.downcase!
#split the input by every word into an array
input_array = input.split(/\W/)
include_hash = {}
#iterate through dictionary and find words that are included in input
for sub in dictionary
    #reset count every word
    count = 0
    #check to see if the array contains the substring
    for each in input_array
        if each[sub]
        count += 1
        include_hash.store(sub,count)
        end
    end
    
end
#sort the hash
include_hash = include_hash.sort.to_h
p include_hash

end


dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
substrings("below", dictionary)
substrings("Howdy partner, sit down! How's it going?", dictionary)