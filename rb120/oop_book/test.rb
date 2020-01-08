class Student
  
  attr_writer :name, :grade
  
  def initialize(name, grade)
    self.name = name
    self.grade = grade
  end
  
  def better_grade_than?(other)
    self.grade > other.grade
  end
  
  protected
  
  def grade
    @grade
  end
end


ray = Student.new('Ray', 77)
david = Student.new('Pasta', 88)

p ray.better_grade_than?(david)