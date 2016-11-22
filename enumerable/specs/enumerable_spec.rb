require "./lib/enumerable.rb"

describe "my_xxx additional methods for Enumerable" do
  let(:simple_arr) do
    [1, 2, 3]
  end
  
  describe "#my_each" do
    it "applies itself to each item" do
      result = []
      simple_arr.my_each { |num| result << num * 2 }
      expect(result).to eql([2, 4, 6])
    end
  end
  
  describe "#my_map" do
    it "is the same as regular map" do
      the_proc = Proc.new { |num| num * 2  }
      expect(simple_arr.my_map(&the_proc)).to eql([2,4,6])
    end
  end
  
end
