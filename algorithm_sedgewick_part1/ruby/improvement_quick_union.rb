class QuickFind
  attr_accessor :list, :size

  def initialize(n)
    @list = n_arr(n)
    @size = n_arr(n)
  end

  def connected?(p, q)
    root(p) == root(q)
  end

  def union p,q
    i, j = root(p), root(q)
    return if i == j
    if size[i] < size[j]
      exchange i, j
    else
      exchange j, i
    end
  end

  private

  def root i
    while i != list[i] do
      list[i] = list[list[i]] #wheited quick union
      i = list[i]
    end
    i
  end

  def n_arr n
    (0..n).to_a
  end

  def exchange a,b
    list[a] = b
    size[b] += size[a]
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
