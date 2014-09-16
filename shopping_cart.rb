require 'pry'

class ShoppingCart
	@@prices = { :apple => 10, :oranges => 5, :grapes => 15, :banana => 20, :watermelon => 50 }
	@@discount = { :apple => [2, 1, :apple], :oranges => [3, 1, :oranges],  :grapes => [4, 1, :banana] }

	def initialize
		@cart = { :apple => 0, :oranges => 0, :grapes => 0, :banana => 0, :watermelon => 0 }
		@cart_cost = 0
	end

	def add_discount
		discount = AppleDiscount.new.calc_discount(@cart) + OrangeDiscount.new.calc_discount(@cart) + GrapesDiscount.new.calc_discount(@cart)
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
		cost
		@cart.each {|key, value| puts "#{key} is #{value} price is #{@@prices[key]}" }
		puts "The price of your cart is: " + @cart_cost.to_s
	end
end

class AppleDiscount < ShoppingCart
	def calc_discount(cart)
		discount = 0

		if cart[:apple] >= 2
			discount += @@prices[:apple] * (cart[:apple] / 2)
		end
		return discount
	end
end

class OrangeDiscount < ShoppingCart
	def calc_discount(cart)
		discount = 0

		if cart[:oranges] >= 3
			discount += @@prices[:oranges] * (cart[:oranges] / 3)
		end
		return discount
	end
end

class GrapesDiscount < ShoppingCart
	def calc_discount(cart)
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



