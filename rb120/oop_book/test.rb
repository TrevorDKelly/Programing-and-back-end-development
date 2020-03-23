# class Student

#   attr_writer :name, :grade

#   def initialize(name, grade)
#     self.name = name
#     self.grade = grade
#   end

#   def better_grade_than?(other)
#     self.grade > other.grade
#   end

#   protected

#   def grade
#     @grade
#   end
# end


# ray = Student.new('Ray', 77)
# david = Student.new('Pasta', 88)

# p ray.better_grade_than?(david)

class Superclass

  def initialize(name)
    @color = 'blue'
  end

  def show_name
    puts @name
  end
end

class Sub < Superclass
  def initialize(name)
    @name = name
  end

  def show_color
    puts @color
  end
end

a = Sub.new('test')
a.show_name