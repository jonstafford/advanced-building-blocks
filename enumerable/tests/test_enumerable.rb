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

end
