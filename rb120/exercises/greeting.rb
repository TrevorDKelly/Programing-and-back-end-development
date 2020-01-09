class Cat
  attr_accessor :name
  
  @@cat_count = 0
  COLOR = 'black'
  
  def initialize(name)
    @name = name
    @@cat_count +=1
  end
  
  def rename(name)
    self.name = name
  end
  
  def identify
    self
  end
  
  def greet
    puts "Hello! I'm #{name} and I am a #{COLOR} cat!"
  end
  
  def to_s
    "I'm #{name}"
  end
  
  def self.generic_greeting
    puts"Hello! I'm a cat!"
  end
  
  def self.total
    puts @@cat_count
  end
end

class Person
  attr_writer :secret
  
  def share_secret
    secret
  end
  
  def compare_secret(other_secret)
    puts self.secret == other_secret.secret
  end
  
  protected
  
  attr_reader :secret
end

person = Person.new
person.secret = "This is a secret"
person2 = Person.new
person2.secret = "no"

person.compare_secret(person2)