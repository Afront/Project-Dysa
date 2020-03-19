require "./spec_helper"
include Binary

describe Binary do
  # TODO: Write tests
  describe Node do
    describe "#initialize" do
      it "can be created using any type of data" do
        Node.new(1)
        Node.new(1.0)
        Node.new('a')
        Node.new("a")
        Node.new(nil)
      end
    end

    it "can get left value" do
      node = Node.new(1)
      node.left.should be_nil
    end

    it "can get right value" do
      node = Node.new(1)
      node.left.should be_nil
    end
  end
end
