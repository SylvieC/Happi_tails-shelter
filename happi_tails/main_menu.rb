require './shelter'
require './animal'
require './client'

  shelter = Shelter.new("Happy Tails")

def menu (message)
  puts `clear`facilitate client puts animal up for adoption'
  puts "*** Shelter v1.0 ***\n\n"

  puts "#{message}\n\n" unless message.empty?

  puts '1 : Display all animals'
  puts '2 : Display all clients'
  puts '3 : Create an animal'
  puts '4 : Create a client'
  puts '5 : facilitate client adopt an animal'
  puts '6 : facilitate client puts animal up for adoption'
  puts "q : Quit\n\n"
  print '--> '
  gets.chomp
end

end

message = ""
choice = menu message
while choice != 'q'
  message = ""
  case choice
  when "1"
    message += 'option 1'
    # 1) display all animals
    puts "The animals in #{shelter.name}"
    shelter.display_animals()
  when "2"
    message += 'option 2'
    # 1) diplay all clients
    puts " The clients in #{shelter.name}"
    puts display_clients
  when "3"
    message += 'option 3'
    # create an animal
    #1) prompt user for name, age, gender, species, toys 
    puts "Animal's name: "
    name = gets.chomp
    puts "age:"
    age = gets.chomp
    puts " male or female:"
    gender = gets.chomp
    puts "species:"
    species = gets.chomp
    puts " Let's list the toys for #{name}, one at a time if it has severals"
    continue = true
    while continue
      puts " Enter a toy's name for #{name} (or enter no if it has none)"
      toy = gets.chomp
      toys = []
      if toy != "no"
        toys << toy
      else
        continue = false
      end
    end
    #2)create an animal
    animal = Animal.new(name, age, gender, species, toys )

  when "4"
    message += 'option 4'
    # Create a client
    #1)Prompt user for informations about name, num_of_children, age, num_of_pets
    puts "client's name:"
    name = gets.chomp

    #2)create a client
  when "5"
    message += 'option 5'
    # facilitate client adopt an animal
    #1 
  when "6"
    # facilitate client puts animal up for adoption
  






