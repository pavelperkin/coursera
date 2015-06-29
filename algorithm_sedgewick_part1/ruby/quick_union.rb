class QuickFind
  attr_accessor :list

  def initialize(n)
    @list = (0..n).to_a
  end

  def connected?(p, q)
    root(p) == root(q)
  end

  def union p,q
    @list[root(p)] = root(q)
  end

  private

  def root i
    while i != list[i] do
      i = list[i]
    end
    i
  end
end

require 'minitest/autorun'

describe QuickFind do
  it "should find and union nodes" do
    qf = QuickFind.new(10)
    qf.union(0,1)
    qf.union(1,2)
    qf.union(3,4)
    qf.union(4,6)
    qf.union(6,7)
    qf.union(7,8)
    qf.union(8,9)
    qf.connected?(1,2).must_equal true
    qf.connected?(0,2).must_equal true
    qf.connected?(3,8).must_equal true
    qf.connected?(5,5).must_equal true
    qf.connected?(0,5).must_equal false
    qf.connected?(4,5).must_equal false
    qf.connected?(1,6).must_equal false
    qf.connected?(8,5).must_equal false
  end
end
