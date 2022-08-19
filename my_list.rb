require_relative 'module'

class MyList
  include MyEnumerable
  def initialize(*list)
    @list = list
  end

  def my_each(&block)
    @list.each { |item| block.call item }
  end
end

# Create our list
list = MyList.new(1, 2, 3, 4, 5, 6, 7, 8, 9, 10)
#=> #<MyList: @list=[1, 2, 3, 4]>

# Test #all?
list.all? { |e| e < 5 }
#=> true
list.all? { |e| e > 5 }
#=> false

# Test #any?
list.any?(&:zero?)
#=> true
list.any? { |e| e == 5 }
#=> false

# Test #filter
list.filter(&:even?)
#=> [2, 4]
