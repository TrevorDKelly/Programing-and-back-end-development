class Pet
  def run
    'running!'
  end

  def jump
    'jumping!'
  end
end

class Dog < Pet
  def speak
    'Woof'
  end

  def swim
    'swimming!'
  end

  def fetch
    'fetching!'
  end
end

class Cat < Pet
  def speak
    'Meow'
  end
end

class Bulldog < Dog
  def swim
    "I can't Swim"
  end
end

seamus = Dog.new
luna = Cat.new
bub = Bulldog.new

p seamus.speak
p luna.speak
p bub.speak


  #     Pet
  #   /     \
  # Cat     Dog
  #           \
  #         Bulldog
  
# Method lookup path is the order that Ruby searches through class definitions
# and module definitions for an invoked method. it uses only the first version
# of the method that it finds