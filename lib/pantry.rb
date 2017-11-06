class Pantry
  attr_reader :stock

  def initialize
  @stock = Hash.new(0)
  end

  def stock_check(item)
      return 0 if !@stock.include?(item)
      @stock[item]
  end

  def restock(item,quantity)
    @stock[item] += quantity
  end

end
