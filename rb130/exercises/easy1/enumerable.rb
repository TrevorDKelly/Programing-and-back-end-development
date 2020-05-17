class Tree
  include Enumerable
  attr_reader :collection
  
  def initialize(colection)
    @collection = collection
  end
  
  def each
    @collection.each { |item| yield(item) }
  end
  
  def <=>(other)
    @collection <=> other.collection
  end
end
