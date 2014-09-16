require 'pry'
require 'date'

def season(date)
	if [12,1,2].include?(date.month)
		return "winter"
	elsif [3,4,5].include?(date.month)
		return "spring"
	elsif [6,7,8].include?(date.month)
		return "summer"
	else
		return "fall"
	end
end

class ShoppingCart

	def initialize
		@cart = { :apple => 0, :oranges => 0, :grapes => 0, :banana => 0, :watermelon => 0 }
		@cart_cost = 0
		@date = Time.now
		@season = season(@date)
		@item_details = {
			apple: Apple.new,
			oranges: Orange.new,
			grapes: Grapes.new,
			banana: Banana.new,
			watermelon: Watermelon.new
		}
	end

	def add_discount
		discount = @item_details[:apple].discount(@cart) + @item_details[:oranges].discount(@cart, @date,  @season) + @item_details[:grapes].discount(@cart, @date, @season)
		@cart_cost -= discount.to_i
	end

	def cost
		@cart.each do |fruit, qty|
			@cart_cost += qty * @item_details[fruit].price(@date, @season)
		end

		add_discount
		@cart_cost
	end

	def add(fruit,units=1)
		@cart[fruit] += units
	end

	def print_cart
		puts "The price of your cart is: #{cost}" 
	end
end

class Apple
	def price(date, season)
		case season 
			when "winter" then 12
			when "fall" then 15
			else 10
		end
	end

	def discount(cart, date, season)
		discount = 0
		if cart[:apple] >= 2
			discount += price(date, season) * (cart[:apple] / 2)
		end
		return discount
	end
end

class Orange
	def price(date, season)
		case season 
			when "summer" then 2
			else 5
		end
	end

	def discount(cart, date, season)
		discount = 0

		if cart[:oranges] >= 3
			discount += price(date, season) * (cart[:oranges] / 3)
		end
		return discount
	end
end

class Grapes
	def price(date, season)
		return 15
	end

	def discount(cart, date, season)
		discount = 0

		if cart[:grapes] >= 4 && cart[:banana] > 0
			discount += price(date, season) * (cart[:grapes] / 4)
			if discount > price(date, season) * cart[:banana]
				discount = price(date, season) * cart[:banana]
			end
		end
		return discount
	end
end

class Banana
	def price(date, season)
		case season 
			when "winter" then 21
			else 20
		end
	end
end

class Watermelon
	def price(date, season)
		if date.sunday?
			return 100
		else
			return 50
		end
	end
end

