module DisplayModule
  def display_available(array, array_name)
    puts "there are no #{array_name} available" if array.length.zero?
    case array_name
    when 'persons' then
      array.each do |el|
        puts "[(#{el.class}) | id: #{el.id} | name: #{el.name} | age: #{el.age}]"
      end
    when 'books'
      array.each do |el|
        puts "[title: #{el.title} | author: #{el.author}]"
      end
    when 'rentals'
      array.each do |el|
        puts "[date: #{el.date} | person: #{el.person.name} | book: #{el.book.title}]"
      end
    end
    puts ''
    prompt
  end
end
