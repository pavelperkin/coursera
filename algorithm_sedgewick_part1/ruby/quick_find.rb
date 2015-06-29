class QuickFind

  def initialize(n)
    @list = (0..n).to_a
  end

  def connected?(p, q)
    @list[p] == @list[q]
  end

  def union p, q
    @list.each {|el| @list[el] = p if @list[el] == q} 
  end
end
