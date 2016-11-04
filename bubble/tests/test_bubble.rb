require "./lib/bubble.rb"
require "test/unit"

class TestBubble < Test::Unit::TestCase

  def test_bubble_sort
    assert_equal([0,2,2,3,4,78], bubble_sort([4,3,78,2,0,2]))
  end
  
  def test_bubble_sort_by
    assert_equal(["hi", "hey", "hello"], bubble_sort_by(["hi","hello","hey"], &Proc.new do |left, right|
      left.length - right.length 
    end))
  end

end