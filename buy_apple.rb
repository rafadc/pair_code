require_relative "shopping_cart.rb"

cart = ShoppingCart.new
cart.add :watermelon
cart.add :oranges, 4
cart.print_cart