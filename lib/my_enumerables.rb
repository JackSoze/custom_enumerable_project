module Enumerable
  def my_each_with_index
    index = 0
    self.my_each do |element|
      yield(element, index)
      index += 1
    end
  end

  def my_select
    arr = []
    self.my_each do |element|
      arr << element if yield(element) == true
    end
    arr
  end

  def my_all?
    arr = []
    original_arr = []
    self.my_each do |element|
      original_arr << element
      arr << element if yield(element) == true
    end
    arr == original_arr
  end

  def my_any?
    arr = []
    self.my_each do |element|
      arr << element if yield(element) == true
    end
    arr.empty? != true
  end

  def my_none?
    arr = []
    self.my_each do |element|
      arr << element if yield(element) == true
    end
    arr.empty? == true
  end

  def my_count
    arr = []
    self.my_each do |element|
      if block_given?
        arr << element if yield(element) == true
      else
        arr << element
      end
    end
    arr.length
  end

  def my_map
    arr = []
    self.my_each do |element|
      arr << yield(element)
    end
    arr
  end

  def my_inject(int_value)
    total = int_value
    self.my_each do |element|
      total = yield(total,element)
    end
    total
  end

end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  include Enumerable

  def my_each(&)
    self.each(&)
  end
end

# array.my_each_with_index
