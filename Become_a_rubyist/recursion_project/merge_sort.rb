def merge(left, right, results = [])

    until left.empty? && right.empty?
        if left.empty?
            results << right.shift
        elsif right.empty?
            results << left.shift
        elsif left[0] < right[0]
            results << left.shift
        else
            results << right.shift
        end
    end
    return results
    
end

def merge_sort(array, results = [])
    if array.length < 2
        return array
    end
    left = array.slice(0,array.length/2)
    right = array.slice(array.length/2,array.length)
    left = merge_sort(left)
    right = merge_sort(right)
    return merge(left,right)
end
p merge_sort([3,2,4,1,7,4,6,5,2,8,9,0])