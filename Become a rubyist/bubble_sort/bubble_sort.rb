def bubble_sort (array)
  max_loop = array.length - 1
  swapped = true
  while swapped
    swapped = false
    for index in (1..max_loop)
      if array[index - 1] > array[index]
        array[index - 1] , array[index] = array[index], array[index - 1]
        swapped = true
      end
    end
  end
  print array
end

def bubble_sort_by array, &block
  #work in progress
    max_loop = array.length - 1
    swapped = true
    while swapped
      swapped = false
      for index in (1..max_loop)
        if array[index - 1] < array[index]
          yield array
          array[index - 1] , array[index] = array[index], array[index - 1]
          swapped = true
        end
      end
    end
    print array
end
bubble_sort([4,3,78,2,0,2])
puts " "
bubble_sort_by(["hi","hello","hey"]) do |left,right|
     left.length - right.length
end
