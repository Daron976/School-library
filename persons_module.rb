module AppModule
  def student_or_teacher
    puts 'Would you like to add a student or a teacher [s/t]'
    person_choice = gets.chomp
    puts ''
    case person_choice
    when 's'
      student_input
    when 't'
      teacher_input
    else
      puts 'please select s or t'
      student_or_teacher
    end
  end

  def student_input
    puts "What is this student's name?"
    student_name = gets.chomp
    puts ''
    puts 'What classroom does this student belong to?'
    student_class = gets.chomp
    puts ''
    puts "What is this student's age?"
    student_age = gets.chomp
    puts ''
    puts 'Does this student have permission from a parent or guardian? [y/n]'
    student_permission = gets.chomp
    permission = student_permission == 'y'

    new_student = Student.new(student_class, student_age, student_name, parent_permission: permission)
    @all_persons.push(new_student)

    puts ''
    prompt
  end

  def teacher_input
    puts "What is this teacher's name?"
    teacher_name = gets.chomp
    puts ''
    puts "What is this teacher's specialization?"
    teacher_specialization = gets.chomp
    puts ''
    puts "What is this teacher's age?"
    teacher_age = gets.chomp

    new_teacher = Teacher.new(teacher_specialization, teacher_age, teacher_name)
    @all_persons.push(new_teacher)

    puts ''
    prompt
  end
end
