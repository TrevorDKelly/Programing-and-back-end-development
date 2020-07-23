def gather(items)
  puts "Let's start gathering food."
  puts "#{yield(items)}"
  puts "Nice selection of food we have gathered!"
end

items = %w(apples bananas corn beans)

def group(arr)
  yield(arr)
end

gather(items) do |*items, last|
  "#{items.join(', ')}\n#{last}"
end

gather(items) do |first, *items, last|
  first + "\n" + items.join(', ') + "\n" + last
end

gather(items) do |first, *items|
  first + "\n" + items.join(", ")
end

gather(items) do |a, b, c, d|
  [a,b,c].join(', ') + ', and ' + d
end

