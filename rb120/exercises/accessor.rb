class Person
  
  def name=(name)
    @first_name, @last_name = name.split
  end
  
  def name
    "#{@first_name} #{@last_name}"
  end
 
  def older_than?(other)
    self.age > other.age
  end
  
  def age=(age)
    @age = age * 2
  end
  
  def age
    @age * 2
  end
end

me = Person.new
you = Person.new
me.age = 30
you.age = 5
p me.older_than?(you)