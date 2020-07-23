fib = Enumerator.new do |y|
  a = b = 1
  loop do
    y << a
    a, b = b, a + b
  end
end

fib.take(10).class
# => [1, 1, 2, 3, 5, 8, 13, 21, 34, 55]

factoral = Enumerator.new do |y|
  a = 1
  num = 0
  loop do
    a = num.zero? ? 1 : num * a
    y << a
    num += 1
  end
end

p factoral.take(7)
6.times { |n| puts "#{n}: #{factoral.next}" }
