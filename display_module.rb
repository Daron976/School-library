module DisplayModule
  def display_persons
    puts 'there are no persons available' if @all_persons.length.zero?
    @all_persons.each do |el|
      puts "[(#{el.class}) | id: #{el.id} | name: #{el.name} | age: #{el.age}]"
    end
    puts ''
    prompt
  end

  def diplay_books
    puts 'there are no books available' if @all_books.length.zero?
    @all_books.each do |el|
      puts "[title: #{el.title} | age: #{el.author}]"
    end
    puts ''
    prompt
  end

  def diplay_rentals
    puts 'no rentals have been processed' if @all_rentals.length.zero?
    @all_rentals.each do |el|
      puts "[date: #{el.date} | person: #{el.person.name} | book: #{el.book.title}]"
    end
    puts ''
    prompt
  end
end
