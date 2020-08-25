def get_order(order)
  items = []
  new_item = ''

  order.size.times do
    new_item << order.shift
    if MENU.include?(new_item)
      items << new_item
      new_item = ''
    end
  end

  items.map(&:capitalize).join(' ')
end


MENU = %w(burger fries chicken pizza sandwich onionrings milkshake coke)

def get_order(order)
  order.scan(/#{MENU.join('|')}/).sort_by { |x| MENU.index(x) }.map(&:capitalize).join(' ')
end

p get_order("pizzachickenfriesburgercokemilkshakefriessandwich") #== "Burger Fries Fries Chicken Pizza Sandwich Milkshake Coke"
