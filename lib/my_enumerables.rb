module Enumerable
  def my_each_with_index
    index = 0
    self.my_each do |element|
      yield(element,index)
      index += 1
    end
  end
  # Your code goes here
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array

  include Enumerable

  def my_each
    self.each{|element|yield element}
  end

end

# array.my_each_with_index





