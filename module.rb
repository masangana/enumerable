module MyEnumerable
  def all?
    my_each { |item| return false unless yield item }
    true
  end

  def any?
    my_each { |item| return true if yield item }
    false
  end

  def filter
    arr = []
    my_each { |item| arr << item if yield item }
    arr
  end
end
