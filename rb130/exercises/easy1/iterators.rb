def any?(arr)
  return false if arr.empty?
  arr.each do |value|
    return true if yield(value)
  end
  false
end

def all?(arr)
  arr.each { |value| return false unless yield(value) }
  true
end

def none?(arr)
  arr.each { |value| return false if yield(value) }
  true
end

def one?(arr)
  count = 0
  arr.each do |value|
    count +=1 if yield(value)
    return false if count > 1
  end
  count == 1
end

