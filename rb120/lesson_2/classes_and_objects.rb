# 1. 2.
  class Person
    attr_accessor :first_name, :last_name
    
    def initialize(name)
      parse_full_name(name)
    end
    
    def name
      "#{first_name} #{last_name}"
    end
    
    def name=(name)
      parse_full_name(name)
    end
    
    def has_same_name?(other_name)
      self.name == other_name.name
    end
    
    def to_s
      name
    end
    
    private
    
    def parse_full_name(name)
      self.first_name, self.last_name = name.split
      self.last_name = '' if last_name.nil?
    end
  end
  
  bob = Person.new("Robert Smith")
  rob = Person.new("Robert Smith")
  
  p bob.has_same_name?(rob)