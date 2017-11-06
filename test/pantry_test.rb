require './lib/pantry'
require './lib/recipe'
require 'minitest/autorun'
require 'minitest/pride'

class PantryTest < Minitest::Test
  def test_it_creates_a_pantry
    pantry= Pantry.new()

    assert_instance_of Pantry, pantry
  end
  def test_it_has_stock
    pantry= Pantry.new()
    stock = pantry.stock

    assert_equal ({}), stock
  end
  def test_it_returns_zero_if_not_in_stock
    pantry= Pantry.new()
    # stock = pantry.stock

    assert_equal 0, pantry.stock_check("cheese")
  end
  def test_it_can_restock
    pantry= Pantry.new()
     pantry.restock("cheese",10)
    # stock = pantry.stock

    assert_equal 10, pantry.stock_check("cheese")
  end
  def test_it_can_restock_multiple_times
    pantry= Pantry.new()
     pantry.restock("cheese",10)
     pantry.restock("cheese",10)
     pantry.restock("cheese",10)


    assert_equal 30, pantry.stock_check("cheese")
  end
  def test_it_can_add_ingredients_to_shopping_list
    pantry = Pantry.new
    r = Recipe.new("Cheese Pizza")
    r.ingredients
    r.add_ingredient("Cheese", 20)
    r.add_ingredient("Flour", 20)
    pantry.add_to_shopping_list(r)

    assert_equal 12, pantry.shopping_list


  end
  def test_it_can_add_more_ingredients_to_the_list
        pantry = Pantry.new

    r = Recipe.new("Spaghetti")
    r.add_ingredient("Spaghetti Noodles", 10)
    r.add_ingredient("Marinara Sauce", 10)
    r.add_ingredient("Cheese", 5)
    pantry.add_to_shopping_list(r)
      assert_equal 23, pantry.shopping_list
  end
end
