def fibs(n)
    ary = [0,1]
    until ary.length == n
        ary << ary[-1] + ary[-2]
    end 
    ary
end

def fibs_rec(n, ary = [0,1])
    return [0] if n == 0
    return ary if ary.length == n
    ary << ary[-1] + ary[-2]
    fibs_rec(n, ary)
end
ary = []
p fibs(10)
p fibs_rec(10)

# >> [0, 1, 1, 2, 3, 5, 8, 13, 21, 34]
# >> [0, 1, 1, 2, 3, 5, 8, 13, 21, 34]