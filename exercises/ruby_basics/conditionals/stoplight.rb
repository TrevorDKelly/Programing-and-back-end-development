# Part 1

  stoplight = ["green", "yellow", "red"].sample
  
  case stoplight
    when "green"
      puts "Go!"
    when "yellow"
      puts "Slow down!"
    else "red"
      puts "Stop!"
  end
  
# Part 2

  if stoplight == "green"
    puts "Go!"
  elsif stoplight == "yellow"
    puts "Slow down!"
  else
    puts "Stop"
  end
  
# Part 3
  
  case stoplight
    when "green"  then puts "Go" 
    when "yellow" then puts "Slow down" 
    else               puts "Stop"
  end
  
  