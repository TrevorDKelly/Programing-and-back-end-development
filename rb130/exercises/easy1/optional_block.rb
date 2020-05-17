def compute
  if block_given?
    yield
  else
    'Does not compute'
  end
end

