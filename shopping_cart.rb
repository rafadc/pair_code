require 'pry'
require 'date'

class ShoppingCart
	@@prices = { }

	def initialize
		@cart = { :apple => 0, :oranges => 0, :grapes => 0, :banana => 0, :watermelon => 0 }
		@cart_cost = 0
		@date = Time.now
		@season = season

	end

	def season
		if [12,1,2].include?(@date.month)
			return "winter"
		elsif [3,4,5].include?(@date.month)
			return "spring"
		elsif [6,7,8].include?(@date.month)
			return "summer"
		else
			return "fall"
		end
	end

	def get_prices
		@@prices[:apple] = Apple.new.price(@season)
		@@prices[:oranges] = Orange.new.price(@season)
		@@prices[:grapes] = Grapes.new.price(@season)
		@@prices[:banana] = Banana.new.price(@season)
		@@prices[:watermelon] = Watermelon.new.price(@date)
	end

	def add_discount
		discount = Apple.new.discount(@cart) + Orange.new.discount(@cart) + Grapes.new.discount(@cart)
		@cart_cost -= discount.to_i
	end

	def cost
		@cart.each do |fruit, qty|
			@cart_cost += qty * @@prices[fruit]
		end

		add_discount
	end

	def add(fruit,units=1)
		@cart[fruit] += units
	end

	def print_cart
		get_prices
		cost
		@cart.each {|key, value| puts "#{key} is #{value} price is #{@@prices[key]}" }
		puts "The price of your cart is: " + @cart_cost.to_s
	end
end

class Apple < ShoppingCart
	def price(season)
		case season 
			when "winter" then 12
			when "fall" then 15
			else 10
		end
	end

	def discount(cart)
		discount = 0
		if cart[:apple] >= 2
			discount += @@prices[:apple] * (cart[:apple] / 2)
		end
		return discount
	end
end

class Orange < ShoppingCart
	def price(season)
		case season 
			when "summer" then 2
			else 5
		end
	end

	def discount(cart)
		discount = 0

		if cart[:oranges] >= 3
			discount += @@prices[:oranges] * (cart[:oranges] / 3)
		end
		return discount
	end
end

class Grapes < ShoppingCart
	def price(season)
		return 15
	end

	def discount(cart)
		discount = 0

		if cart[:grapes] >= 4 && cart[:banana] > 0
			discount += @@prices[:banana] * (cart[:grapes] / 4)
			if discount > @@prices[:banana] * cart[:banana]
				discount = @@prices[:banana] * cart[:banana]
			end
		end
		return discount
	end
end

class Banana < ShoppingCart
	def price(season)
		case season 
			when "winter" then 21
			else 20
		end
	end
end

class Watermelon < ShoppingCart
	def price(date)
		if date.sunday?
			return 100
		else
			return 50
		end
	end
end

