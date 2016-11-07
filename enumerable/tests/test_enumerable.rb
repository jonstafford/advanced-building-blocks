require "./lib/enumerable.rb"
require "test/unit"

class TestEnumerable < Test::Unit::TestCase

  def test_my_each
    arr = Array.new [1, 2, 3]
    elements = []
    assert_equal(arr, arr.my_each { |num| elements << num*2 })
    assert_equal([2, 4, 6], elements)
  end
  
  def test_my_each_with_index
    arr = Array.new [1, 2, 3]
    elements = []
    assert_equal(arr, arr.my_each_with_index { |num, index| elements << num*index })
    assert_equal([0, 2, 6], elements)
  end
  
  def test_my_select
    arr = Array.new [1, 2, 3, 4]
    assert_equal([2, 4], arr.my_select { |num| num % 2 == 0 })
  end
  
  def test_my_all_true
    arr = Array.new [2, 2, 8, 4]
    assert_equal(true, arr.my_all? { |num| num % 2 == 0 })
  end    
  
  def test_my_all_false
    arr = [3, 3, 1, 3]
    assert_equal(false, arr.my_all? { |num| num  == 3 })
  end   
  
  def test_my_any_true
    arr = [3, 3, 1, 3]
    assert_equal(true, arr.my_any? { |num| num  == 1 })
  end   
   
  def test_my_any_false
    arr = [3, 3, 1, 3]
    assert_equal(false, arr.my_any? { |num| num % 2 == 0 })
  end  
   
  def test_my_none_true
    arr = [3, 3, 5, 3]
    assert_equal(true, arr.my_none? { |num| num % 2 == 0 })
  end   
  
  def test_my_none_false
    arr = [3, 3, 2, 3]
    assert_equal(false, arr.my_none? { |num| num % 2 == 0 })
  end   
  
  def test_my_count
    arr = [3, 3, 2, 3]
    assert_equal(1, arr.my_count { |num| num % 2 == 0 })
  end   
  
  def test_my_map
    arr = [4,5,7,8]
    assert_equal([8,10,14,16], arr.my_map { |num| num * 2  } )
  end   
  
  def test_my_map_with_proc
    arr = [4,5,7,8]
    the_proc = Proc.new { |num| num * 2  }
    assert_equal([8,10,14,16], arr.my_map(&the_proc))
  end   
  
  
  def test_my_inject_symbol
    assert_equal(45, [5,6,7,8,9,10].my_inject(:+))
  end
  
  def test_my_inject_just_block
    assert_equal(45, [5,6,7,8,9,10].my_inject { |sum, n| sum + n } )
  end
  
  def test_my_inject_arg_and_block
    assert_equal(151200, [5,6,7,8,9,10].my_inject(1) { |product, n| product * n })
  end
  
  def multiply_els arr
    arr.my_inject :*
  end
  
  def test_multiply_els_to_test_my_inject
    assert_equal(40, multiply_els([2,4,5]))
  end
  
end
