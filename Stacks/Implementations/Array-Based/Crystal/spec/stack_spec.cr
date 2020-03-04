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
end
