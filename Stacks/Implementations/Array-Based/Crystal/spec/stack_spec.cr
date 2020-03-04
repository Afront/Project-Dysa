require "./spec_helper"

describe Stack do
  # TODO: Write tests
  describe "#initialize" do
    it "can initialize a stack without arguments" do
      Stack(Int32).new.should be_a(Stack(Int32))
      Stack(Int32).new.to_a.should eq([] of Int32)
    end

    it "can initialize a stack with capacity" do
      Stack(Int32).new(5).should be_a(Stack(Int32))
      Stack(Int32).new(5).to_a.should eq([] of Int32)
    end

    it "can initialize a stack with value" do
      Stack.new(3, "a").should be_a(Stack(String))
      Stack.new(3, "a").to_a.should eq(Array.new(3, "a"))
    end

    it "can initialize a stack with block" do
      Stack.new(2) { |i| i * 2 }.should be_a(Stack(Int32))
      Stack.new(2) { |i| i * 2 }.to_a.should eq(Array.new(2) { |i| i*2 })
    end

    it "can initialize a stack with an array" do
      Stack.new([1]).should be_a(Stack(Int32))
      Stack.new([1]).to_a.should eq([1])
    end

    it "can initialize a stack with block" do
      Stack.new([1, 2]) { |i| i * 2 }.should be_a(Stack(Int32))
      Stack.new([1, 2]) { |i| i * 2 }.to_a.should eq([1, 2].map { |i| i*2 })
    end
  end

  describe "#empty?" do
    it "should return true if the stack is empty" do
      Stack(Int32).new.empty?.should eq(true)
    end

    it "should return false if the stack is not empty" do
      Stack.new([1, 2]).empty?.should eq(false)
    end

    it "should be the same type as the type of the Array" do
      stack = Stack.new(3, "ah")
      stack.peek.should be_a(String)
    end

    it "cannot peek at an empty stack" do
      expect_raises(IndexError) do
        stack = Stack(Int32).new
        stack.peek
      end
    end
  end

  describe "#peek" do
    it "should return the last value of the stack" do
      stack = Stack.new(3, "a")
      last_value = stack.to_a[-1]
      stack.peek.should eq(last_value)
    end

    it "should not remove the last value of the stack" do
      stack = Stack.new(2, "a")
      last_value = stack.to_a[-1]
      stack.peek
      stack.should eq(Stack.new(2, "a"))
    end

    it "should be the same type as the type of the Array" do
      stack = Stack.new(3, "ah")
      stack.peek.should be_a(String)
    end

    it "cannot peek at an empty stack" do
      expect_raises(IndexError) do
        stack = Stack(Int32).new
        stack.peek
      end
    end
  end

  describe "#pop" do
    it "should return the last value of the stack" do
      stack = Stack.new(3, "a")
      last_value = stack.to_a[-1]
      stack.pop.should eq(last_value)
    end

    it "should remove the last value of the stack" do
      stack = Stack.new(2, "a")
      last_value = stack.to_a[-1]
      stack.pop
      stack.should eq(Stack.new(1, "a"))
    end

    it "should be the same type as the type of the Array" do
      stack = Stack.new(3, "ah")
      stack.pop.should be_a(String)
    end

    it "cannot pop an empty stack" do
      expect_raises(IndexError) do
        stack = Stack(Int32).new
        stack.pop
      end
    end
  end

  describe "#push" do
    it "can push a value of the same type" do
      stack = Stack(Int32).new
      stack.push 5
    end

    # it "cannot push a value of a different type" do
    #   expect_raises(Exception) do
    #     stack = Stack.new([1, 2, 3])
    #     stack.push "a"
    #   end
    # end
  end
end
