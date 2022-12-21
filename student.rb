require_relative 'person'

class Student < Person
  attr_reader :classroom

  def initialize(classroom, age, name = 'unknown', parent_permission: true)
    super(age, name, parent_permission)
    @classroom = classroom
  end

  def play_hooky
    '¯\(ツ)/¯'
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.student.push(self) unless classroom.student.includes?(self)
  end
end
