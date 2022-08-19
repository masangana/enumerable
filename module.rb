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
end
