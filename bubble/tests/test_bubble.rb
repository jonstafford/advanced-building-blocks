require "./lib/bubble.rb"
require "test/unit"

class TestBubble < Test::Unit::TestCase

  def test_bubble_sort
    
    assert_equal([0,2,2,3,4,78], bubble_sort([4,3,78,2,0,2]))
  end

end