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
  puts array
end
def bubble_sort_by array, &block
  #work in progress

end
bubble_sort([4,3,78,2,0,2])
