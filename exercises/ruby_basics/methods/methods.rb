# Print me Part 1

  def print_me
    puts "I'm rpinting from insife he method!"
  end
  
# Print me Part 2

  def print_me2
    "I'm printing the return value"
  end
  
# Greeting through methods
  
  def hello
    "Hello"
  end
  
  def world
    "world"
  end
  
  puts hello + " " + world + "!"
  
#Greeting through methods part 2
  
  def greet
    "#{hello} #{world}!"
  end
  
  puts greet
  
# Make and model

  def car(make, model)
    puts make + ' ' + model
  end
  
  car("Dodge", "Stratus")
  
# Time of Day

  daylight = [true, false].sample
  
  def time_of_day(daylight)
    if daylight
      puts "It's Daytime!"
    else
      puts "It's Nightime!"
    end
  end
  
  time_of_day(daylight)
  
# Naming Animals
  
  def dog(name)
    name
  end
  
  def cat(name)
    name
  end
  
  puts "The dog's name is #{dog("Seamus")}."
  puts "the cat's name is #{cat("Luna")}."
  
# Nane Not Found
  def assign_name(name = "Bob")
    name
  end
  
# Multiply the Sum

  def add(a, b)
    a + b
  end
  
  def multiply(a, b)
    a * b
  end
  
# Random Sentence

  names = ["Tom", "Eric", "Fiona", "Trevor"]
  activities = ["running", "swiming", "walking"]
  
  def name(names)
    names.sample
  end
  
  def activity(activities)
    activities.sample
  end
  
  def sentence(a, b)
    "#{a} went #{b} today!"
  end
  
  puts sentence(name(names), activity(activities))
  