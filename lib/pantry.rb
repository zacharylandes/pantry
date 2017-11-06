require 'pry'
class Pantry
  attr_reader :stock, :shopping_list, :cook_book

  def initialize
  @stock = Hash.new(0)
  @shopping_list = []
  @cook_book = []
  @ingredients_list = []
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
    @ingredients_list << recipe.ingredients
  end

  def what_can_i_make
    @what_you_can_make
  end

  def how_many_can_i_make
    @ingredients_list.each do |ingredients|
     @stock.each do |stock_item,stock_amount|
       if ingredients.has_key?(stock_item)
        if stock_amount > ingredients[stock_item]
          binding.pry
          # @what_you_can_make << recipe.name
          s = stock_amount/ingredients[stock]
         binding.pry
       else

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
