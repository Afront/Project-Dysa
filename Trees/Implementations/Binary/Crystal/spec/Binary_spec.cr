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

    describe "#set" do
      it "returns an exception if the node has already been set" do
        expect_raises(Exception, "Already set") do
          Node.new(1).set(2)
        end
      end

      it "sets a value" do
        Node.new(1).left.set(2)
      end

      # Different type
    end

    describe "#update" do
      it "sets a value" do
        Node.new(1).update(2)
      end
    end
  end
end
