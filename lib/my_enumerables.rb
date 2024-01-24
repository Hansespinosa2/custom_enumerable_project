module Enumerable
  # Your code goes here
  def my_each_with_index
  index = 0
    self.my_each do |item|
      yield(item,index)
    index +=1
    end
  end

  def my_select
    result = []
    self.my_each do |item|
      if yield(item) then result << item end
    end
    return result
  end

  def my_all?
    self.my_each do |item|
      if !yield(item)
        return false
      end
    end
    return true
  end

  def my_any?
    self.my_each do |item|
      if yield(item)
        return true
      end
    end
    return false
  end

  def my_none?
    self.my_each do |item|
      if yield(item)
        return false
      end
    end
    return true
  end

  def my_count
    result = []
    i = 0
    self.my_each do |item|
      if block_given?
        yield(item) ? i += 1: nil
      else
        i+=1
      end


    end
    return i
  end

  def my_map
    result = []
    self.my_each do |item|
      result << yield(item)
    end
    result
  end

  def my_inject(init)
    result = init
    self.my_each do |item|
      result = yield(result,item)
    end
    result
  end

end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    for item in self
      yield item
    end
  end
end
