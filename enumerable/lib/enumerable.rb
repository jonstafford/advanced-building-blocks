module Enumerable
  def my_each
    i = 0
    while i < self.size
      yield(self[i])  
      i+=1      
    end
    self
  end
  
  def my_each_with_index
    i = 0
    while i < self.size
      yield(self[i], i)  
      i+=1      
    end
    self
  end
  
  def my_select
    result = []
    my_each do |i|
      if (yield(i))
        result << i
      end
    end
    result
  end
  
  # do all my elements answer true for the block
  def my_all?
    my_each do |i|
      if (!yield(i))
        return false
      end
    end
    true
  end
  
  def my_any?
    my_each do |i|
      if (yield(i))
        return true
      end
    end
    false
  end
  
  def my_none? &block
    !my_any?(&block)
  end
  
  def my_count
    result = 0
    my_each do |i|
      if (yield(i))
        result += 1
      end
    end
    result
  end
  
  def my_map &the_proc
    result = []
    unless (the_proc.nil?)
      my_each do |i|
        result << yield(i)
      end
    else
      my_each do |i|
        result << the_proc.call(i)
      end
    end
    result
  end
  
  def my_inject (initial=0)
    if (initial.is_a? Symbol)
      result = first
      is_first = true
      self.my_each do |i|
        if (is_first)
          is_first = false
        else
          result = result.method(initial).call(i)
        end
      end
      result
    else
      result = initial
      self.my_each do |i|
        result = yield(result, i)
      end
      result
    end
  end
  
  
end