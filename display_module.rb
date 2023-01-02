module DisplayModule
  def display_available(array, class_instance, array_name)
    puts "there are no #{array_name} available" if array.length.zero?
    class_instance.message(array)
    puts ''
    prompt
  end
end

class PersonItems
  def message(array)
    array.each do |el|
      puts "[(#{el.class}) | id: #{el.id} | name: #{el.name} | age: #{el.age}]"
    end
  end
end

class BookItems
  def message(array)
    array.each do |el|
      puts "[title: #{el.title} | author: #{el.author}]"
    end
  end
end

class RentalItems
  def message(array)
    array.each do |el|
      puts "[date: #{el.date} | person: #{el.person.name} | book: #{el.book.title}]"
    end
  end
end
