def count(*items)
  items.reduce(0) { |count, element| yield(element) ? count + 1 : count }
end
