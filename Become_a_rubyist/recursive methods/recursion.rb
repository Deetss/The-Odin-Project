def fib(n)
    ary << n
    return ary if n == 0
    ary << n + fib(ary[-1])
    ary
end

p fib 0
p fib 10


# >> nil
# >> nil
# >> nil
# >> nil
