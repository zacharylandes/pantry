require 'pry'
class Pantry
  attr_reader :stock, :shopping_list, :cook_book

  def initialize
    @stock = Hash.new(0)
    @shopping_list = []
    @cook_book = []
    @how_many = {}
    @what_you_can_make = []
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
  end

  def print_shopping_list
    @shopping_list.each do |ingredients, amount|
      puts "*#{ingredients}: #{amount}"
    end
  end

  def add_to_cookbook(recipe)
    @cook_book << recipe
  end

  def what_can_i_make
    @how_many
  end

  def ingredients
    @cook_book.map {|c|c.ingredients}
  end

  def how_many_can_i_make
    ingredients.map do |ingredient|
      @stock.map do |stock_item,stock_amount|
        if ingredient.has_key?(stock_item)
          if stock_amount > ingredient[stock_item]
            how_many = stock_amount/ingredient[stock_item]
            @how_many[stock_item]=how_many
          else
           false
          end
        end
      end
    end
    @how_many
end

end
