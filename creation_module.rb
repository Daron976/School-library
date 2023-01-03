module AppModule
  def student_or_teacher
    puts 'Would you like to add a student or a teacher [s/t]'
    person_choice = gets.chomp
    puts ''
    case person_choice
    when 's'
      @all_persons.push(CreateStudent.new.student_input)
      puts ''
      prompt
    when 't'
      @all_persons.push(CreateTeacher.new.teacher_input)
      puts ''
      prompt
    else
      puts 'please select s or t'
      student_or_teacher
    end
  end

  def book_input
    @all_books.push(CreateBook.new.book_creation)
    puts ''
    prompt
  end
end

class CreateStudent
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

    Student.new(student_class, student_age, student_name, parent_permission: permission)
  end
end

class CreateTeacher
  def teacher_input
    puts "What is this teacher's name?"
    teacher_name = gets.chomp
    puts ''
    puts "What is this teacher's specialization?"
    teacher_specialization = gets.chomp
    puts ''
    puts "What is this teacher's age?"
    teacher_age = gets.chomp

    Teacher.new(teacher_specialization, teacher_age, teacher_name)
  end
end

class CreateBook
  def book_creation
    puts 'What is the title of this book'
    book_title = gets.chomp.to_s
    puts ''
    puts 'Who is the author of this book'
    book_author = gets.chomp.to_s

    Book.new(book_title, book_author)
  end
end
