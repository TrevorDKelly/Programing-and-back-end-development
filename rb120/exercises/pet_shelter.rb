# pet - 
#   animal, 
#   name, 
#   to_s 'a TYPE named NAME'
# owner - 
#   name, 
#   pets
# shelter - 
#   adopt method, 
#   print adoptions method

class Pet
  attr_reader :name, :type
  
  def initialize(type, name)
    @type = type
    @name = name
  end
  
  def to_s
    "a #{type} named #{name}"
  end
end

class Owner
  attr_reader :name, :pets
  
  def initialize(name)
    @name = name
    @pets = []
  end
  
  def number_of_pets
    pets.size
  end
  
  def print_pets
    puts self.pets
  end
end

class Shelter
  
  def initialize
    @owners = []
    @unadopted_pets = []
  end
  
  def new_pet(pet)
    @unadopted_pets << pet
  end
  
  def adopt(owner, pet)
    owner.pets << pet
    @unadopted_pets.delete(pet)
    @owners << owner unless @owners.include?(owner)
  end
  
  def print_adoptions
    @owners.each do |owner|
      puts "#{owner.name} has adopeted the following pets:"
      owner.print_pets
    end
    puts "The Animal Shelter has the following unadopted pets:"
    puts @unadopted_pets
  end
end


butterscotch = Pet.new('cat', 'Butterscotch')
pudding      = Pet.new('cat', 'Pudding')
darwin       = Pet.new('bearded dragon', 'Darwin')
kennedy      = Pet.new('dog', 'Kennedy')
sweetie      = Pet.new('parakeet', 'Sweetie Pie')
molly        = Pet.new('dog', 'Molly')
chester      = Pet.new('fish', 'Chester')

phanson = Owner.new('P Hanson')
bholmes = Owner.new('B Holmes')

shelter = Shelter.new
shelter.adopt(phanson, butterscotch)
shelter.adopt(phanson, pudding)
shelter.adopt(phanson, darwin)
shelter.new_pet(kennedy)
shelter.new_pet(sweetie)
shelter.adopt(bholmes, kennedy)
shelter.new_pet(chester)
shelter.print_adoptions
puts "#{phanson.name} has #{phanson.number_of_pets} adopted pets."
puts "#{bholmes.name} has #{bholmes.number_of_pets} adopted pets."