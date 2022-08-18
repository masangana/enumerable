module MyEnumerable
  def list
    @list ||= []
  end 

  def all?
    ary = []
    list.each do |item|
      ary << yield(item)
    end
    p ary.length == list.length
  end

  def any?
    list.each do |item|
      return p true if yield(item)
    end
    p false
  end

  def filter
    ary = []
    list.filter do |item|
      ary.push(item) if yield item
    end
    p ary
  end

  def max
    max_num = 0
    list.max do |item|
      yield item
    end
    p max_num
  end

  def min
    min_num = 9999  # Arbitrary large number
    list.min do |item|
      item < min_num ? min_num = item : min_num
    end
    p min_num
  end

  def sort
    ary = []
    new_ary = []
    list.length.times do |i|
      source_ary = list
      ary << source_ary.delete_at(i)
    end
    ary.sort do |item|
      yield item
    end
    ary.each do |item|
      new_ary << item
    end
    p new_ary
  end

end