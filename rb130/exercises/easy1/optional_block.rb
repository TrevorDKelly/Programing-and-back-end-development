def compute(arg = nil)
  if block_given?
    yield(arg)
  else
    'Does not compute'
  end
end

