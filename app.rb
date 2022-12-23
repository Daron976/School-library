require_relative 'nameable'
require_relative 'base_decorator'
require_relative 'capitalize_decorator'
require_relative 'classroom'
require_relative 'book'
require_relative 'person'
require_relative 'rental'
require_relative 'student'
require_relative 'teacher'
require_relative 'trimmer_decorator'
require_relative 'persons_module'
require_relative 'display_module'

class App
  include DisplayModule
  include AppModule

  attr_reader :all_books, :all_persons, :all_rentals

  def initialize
    @all_books = []
    @all_persons = []
    @all_rentals = []
  end

  def book_input
    puts 'What is the title of this book'
    book_title = gets.chomp.to_s
    puts ''
    puts 'Who is the author of this book'
    book_author = gets.chomp.to_s

    new_book = Book.new(book_title, book_author)
    @all_books.push(new_book)

    puts ''
    prompt
  end

  def rental_creation
    puts 'Who would like to make a rental (please select the index)'
    puts ''
    @all_persons.each_with_index do |el, idx|
      puts "[#{idx} - (#{el.class}) | id: #{el.id} | name: #{el.name} | age: #{el.age}]"
    end
    person_idx = gets.chomp.to_i
    selected_person = @all_persons[person_idx]
    puts 'What book would you like to rent out (please select the index)'
    puts ''

    @all_books.each_with_index do |el, idx|
      puts "[#{idx} - title: #{el.title} | author: #{el.author}]"
    end
    book_idx = gets.chomp.to_i
    selected_book = @all_books[book_idx]
    puts 'Enter the current date (yyyy/mm/dd)'
    date = gets.chomp
    puts ''

    new_rental = Rental.new(date, selected_book, selected_person)
    @all_rentals.push(new_rental)

    prompt
  end

  def rentals_input
    if @all_persons.length.zero?
      puts 'There are no persons in the database'
      puts 'please add a person'
      puts ''
    elsif @all_books.length.zero?
      puts 'There are no books in the database'
      puts 'please add a book'
      puts ''
    else
      rental_creation
    end
    prompt
  end

  def case_conditional(selection)
    puts ''
    case selection
    when 1
      student_or_teacher
    when 2
      book_input
    when 3
      rentals_input
    when 4
      display_persons
    when 5
      diplay_books
    when 6
      diplay_rentals
    else
      puts 'Goodbye'
    end
  end

  def prompt
    puts 'Please make a selection (1-9)'
    puts '(1) - Add a person to the database'
    puts '(2) - Add a book to the archives'
    puts '(3) - Process a rental'
    puts '(4) - Display all available persons'
    puts '(5) - Display available books'
    puts '(6) - Display all rentals'
    puts '(Enter) - Exit'
    puts ''

    selection = gets.chomp.to_i

    case_conditional(selection)
  end
end
