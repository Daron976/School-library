require_relative 'app'

def main
  app = App.new
  puts ''
  puts 'Welcome'
  puts ''
  app.prompt
end

main
