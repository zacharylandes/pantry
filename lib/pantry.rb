require 'pry'
class Pantry
  attr_reader :stock, :shopping_list, :cook_book

  def initialize
  @stock = Hash.new(0)
  @shopping_list = []
  @cook_book = []
  end

  def stock_check(item)
      return 0 if !@stock.include?(item)
      @stock[item]
  end

  def restock(item,quantity)
    @stock[item] += quantity
  end

  def add_to_shopping_list(recipe)
     @shopping_list << recipe.ingredients
     @shopping_list = @shopping_list.pop
    #  binding.pry
  end

  def print_shopping_list
    # binding.pry
    @shopping_list.each do |ingredients, amount|
      puts "*#{ingredients}: #{amount}"
    end
  end

  def add_to_cookbook(recipe)
    @cook_book << recipe
  end

  def what_can_i_make
    @cook_book.map do |recipe|
      p recipe.name
    end
  end

  def how_many_can_i_make
    cook_book_amounts = @cook_book.map {|ingredients|ingredients.ingredien1ts}.flatten
    items = @cook_book.map {|ingredients|ingredients.ingredients.keys}.flatten
    items.map do |item|
     @stock.each do |key,value|
       if key == item
         if value > 0
        # if @stock[item] >
        binding.pry
      end
      end
    end
end
    # @cook_book.map do |recipe|
    #   # binding.pry
    #  recipe.ingredients.values
    # end
  end

end
