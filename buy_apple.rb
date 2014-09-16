require_relative "shopping_cart.rb"

cart = ShoppingCart.new
cart.add :watermelon
cart.add :oranges, 4
cart.add :grapes, 10
cart.add :banana, 1
cart.print_cart