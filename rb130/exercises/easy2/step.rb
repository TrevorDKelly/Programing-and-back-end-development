# step
# gets start, end, step by
# return array
# 
# collection = []
# start at start
#   yield
#   add to collection
#   step
#   break if > max
# return colllection

def step(start, max, step)
  collection = []
  loop do
    yield(start)
    collection << start
    start += step
    break if start > max
  end
  collection
end

