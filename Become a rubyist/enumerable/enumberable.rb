module Enumerable
  def deetss_each
    i = 0
    while i < self.length
      yield self[i]
      i += 1
    end
    self
  end

  def deetss_each_with_index
    i = 0
    while i < self.length
      yield self[i], i
      i += 1
    end
    self
  end

  def deetss_select
    i = 0
    result_array = []
    while i < self.length
      if yield self[i]
        result_array << self[i]
      end
      i += 1
    end
    return result_array
  end

  def deetss_all?
    i = 0
    matching = true
    while i < self.length
      if yield self[i]
        matching = true
      else
        matching = false
      end
      i += 1
    end
    return matching
  end

  def deetss_any?
    i = 0
    matching = true
    while i < self.length
      if yield self[i]
        matching = true
        return matching
      else
        matching = false
      end
      i += 1
    end
    return matching
  end

  def deetss_none?
    i = 0
    matching = false
    while i < self.length
      if yield self[i]
        matching = true
      end
      i += 1
    end
    return !matching
  end

  def deetss_none?
    i = 0
    matching = false
    while i < self.length
      if yield self[i]
        matching = true
      end
      i += 1
    end
    return !matching
  end

  def deetss_count
    i = 0
    counter = 0
    while i < self.length
      if yield self[i]
        counter += 1
      end
      i += 1
    end
    return counter
  end

  def deetss_map
    new_array = []
    self.deetss_each do |element|
      new_array.push(yield element)
    end
    new_array
  end

  def deetss_inject
    total = 0
    self.deetss_each do |element|
      total = yield total, element
    end
    total
  end

end

def multiply_els array
  array.deetss_inject do |first, second|
    first * second
  end
end

multiply_els([2,4,5])
