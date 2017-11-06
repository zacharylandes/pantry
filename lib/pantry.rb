class Pantry
  attr_reader :stock, :shopping_list

  def initialize
  @stock = Hash.new(0)
  @shopping_list = []
  end

  def stock_check(item)
      return 0 if !@stock.include?(item)
      @stock[item]
  end

  def restock(item,quantity)
    @stock[item] += quantity
  end

  def add_to_shopping_list(r)
     @shopping_list << r.ingredients
     @shopping_list = @shopping_list.pop
  end

  def print_shopping_list
    p @shopping_list.each
    list = @shopping_list.each   do |item|
      puts "*#{item}:"
    end
    #  list.flatten
  end

end
