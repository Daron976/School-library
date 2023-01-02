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
require_relative 'creation_module'
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
    when 1 then student_or_teacher
    when 2 then book_input
    when 3 then rentals_input
    when 4 then display_available(@all_persons, PersonItems.new, 'persons')
    when 5 then display_available(@all_books, BookItems.new, 'books')
    when 6 then display_available(@all_rentals, RentalItems.new, 'rentals')
    else
      puts 'Goodbye'
    end
  end

  def prompt
    puts 'Please make a selection (1-6 / Enter)'
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
