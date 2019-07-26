# First Car

  car = {
    type:    'sedan',
    color:   'blue',
    mileage: 80_000,
  }
  
# Adding The Year

  car[:year] = 2003
  
# Broken Odomiter

  car.delete(:mileage)
  
# What Color
  
  puts car[:color]
  
  
# Labeled Numbers

  numbers = {
    high: 100,
    medium: 50,
    low: 10
  }
  
  numbers.each do |label, number|
    puts "#{number} is a #{label} number"
  end
  
# Divided By Two

  half_numbers = numbers.map do |label, number|
                                number / 2
                             end
                             
  p half_numbers
  
# Low, Medium, Or High && Low or nothing

  low_numbers = numbers.select! do |label, number|
                                number < 25
                              end
                              
  p low_numbers
  p numbers
  
  
# Multiple Cars

  cars = {
    car: {
          type: 'sedan',
          color: 'blue',
          year: 2003
    },
    
    truck: {
            type: 'pickup',
            color: 'red',
            year: 1998
    }
  }
  
# Which collection

  car = [[:type, 'sedan'], [:color, 'blue'] , [:year, 2003]]
  
  