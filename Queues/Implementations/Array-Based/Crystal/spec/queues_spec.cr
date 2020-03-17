require "./spec_helper"
include Queues

describe Queue do
  # TODO: Write tests
  describe "#initialize" do
    it "can initialize a queue without arguments" do
      Queue(Int32).new.should be_a(Queue(Int32))
      Queue(Int32).new.to_a.should eq([] of Int32)
    end

    it "can initialize a queue with capacity" do
      Queue(Int32).new(5).should be_a(Queue(Int32))
      Queue(Int32).new(5).to_a.should eq([] of Int32)
    end

    it "can initialize a queue with value" do
      Queue.new(3, "a").should be_a(Queue(String))
      Queue.new(3, "a").to_a.should eq(Array.new(3, "a"))
    end

    it "can initialize a queue with block" do
      Queue.new(2) { |i| i * 2 }.should be_a(Queue(Int32))
      Queue.new(2) { |i| i * 2 }.to_a.should eq(Array.new(2) { |i| i*2 })
    end

    it "can initialize a queue with an array" do
      Queue.new([1]).should be_a(Queue(Int32))
      Queue.new([1]).to_a.should eq([1])
    end

    it "can initialize a queue with block" do
      Queue.new([1, 2]) { |i| i * 2 }.should be_a(Queue(Int32))
      Queue.new([1, 2]) { |i| i * 2 }.to_a.should eq([1, 2].map { |i| i*2 })
    end
  end

  describe "#empty?" do
    it "should return true if the queue is empty" do
      Queue(Int32).new.empty?.should eq(true)
    end

    it "should return false if the queue is not empty" do
      Queue.new([1, 2]).empty?.should eq(false)
    end

    it "should be the same type as the type of the Array" do
      queue = Queue.new(3, "ah")
      queue.peek.should be_a(String)
    end

    it "cannot peek at an empty queue" do
      expect_raises(IndexError) do
        queue = Queue(Int32).new
        queue.peek
      end
    end
  end

  describe "#peek" do
    it "should return the first value of the queue" do
      queue = Queue.new(3, "a")
      first_value = queue.to_a[0]
      queue.peek.should eq(first_value)
    end

    it "should not remove the first value of the queue" do
      queue = Queue.new(2, "a")
      first_value = queue.to_a[0]
      queue.peek
      queue.should eq(Queue.new(2, "a"))
    end

    it "should be the same type as the type of the Array" do
      queue = Queue.new(3, "ah")
      queue.peek.should be_a(String)
    end

    it "cannot peek at an empty queue" do
      expect_raises(IndexError) do
        queue = Queue(Int32).new
        queue.peek
      end
    end
  end

  describe "#shift" do
    it "should return the first value of the queue" do
      queue = Queue.new(3, "a")
      first_value = queue.to_a[0]
      queue.shift.should eq(first_value)
    end

    it "should remove the first value of the queue" do
      queue = Queue.new(2, "a")
      queue.shift
      queue.should eq(Queue.new(["a"]))
    end

    it "should be the same type as the type of the Array" do
      queue = Queue.new(3, "ah")
      queue.shift.should be_a(String)
    end

    it "cannot shift an empty queue" do
      expect_raises(IndexError) do
        queue = Queue(Int32).new
        queue.shift
      end
    end
  end

  describe "#unshift" do
    it "can unshift a value of the same type" do
      queue = Queue(Int32).new
      queue.unshift 5
    end

    # it "cannot unshift a value of a different type" do
    #   expect_raises(Exception) do
    #     queue = Queue.new([1, 2, 3])
    #     queue.unshift "a"
    #   end
    # end
  end

  describe "#to_s" do
    it "should turn a queue into a string based on its values" do
      Queue.new([1, 2, 3]).to_s.should eq("[1, 2, 3]")
    end
  end

  describe "#inspect" do
    it "should 'return' the queue as a string with brackets" do
      Queue(Int32).new.inspect.should eq("[]")
    end
  end
end
