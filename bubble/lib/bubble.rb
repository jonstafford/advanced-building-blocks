def bubble_sort_by(arr, &comparator)
  
  pairs_count = arr.length - 1
  
  if (pairs_count == 0)
    return arr
  else
    pairs_count.times do |i|
      if (comparator.call(arr[i],arr[i+1]) > 0)
        arr[i], arr[i+1] = arr[i+1], arr[i]
      end
    end
  end
  
  return bubble_sort_by(arr[0..-2], &comparator) + [arr[-1]]
end

def bubble_sort arr
  return bubble_sort_by(arr, &Proc.new { |left, right| left - right })
end