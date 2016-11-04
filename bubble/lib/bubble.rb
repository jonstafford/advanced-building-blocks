def bubble_sort arr
  
  pairs_count = arr.length - 1
  
  if (pairs_count == 0)
    return arr
  else
    pairs_count.times do |i|
      if (arr[i] > arr[i+1])
        arr[i], arr[i+1] = arr[i+1], arr[i]
      end
    end
  end
  
  return bubble_sort(arr[0..-2]) + [arr[-1]]
end