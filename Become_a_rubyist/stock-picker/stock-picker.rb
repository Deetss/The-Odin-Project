def stock_picker prices
    #iterate through array of prices
    i = 0
    profit = 0 
    profit_array = []
    buy = 0
    sell = 0
    while i < prices.length
        #take the difference of the current index against all previous
        (0..i).step(1) do |i_prev|
            profit = prices[i] - prices[i_prev]
            profit_array.push(profit)

            #compare the current profit to the max of total profits
            if profit == profit_array.max
                buy = i_prev
                sell = i
            end
        end
        i += 1
    end
    puts "#{buy},#{sell}"
end
stock_picker([17,3,6,9,8,26,1,10])
