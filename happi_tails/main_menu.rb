require './shelter'
require './animal'
require './client'


shelter = Shelter.new("Happy Tails")

def menu (message)
  puts `clear`
  puts "*** Shelter v1.0 ***\n\n"

  puts "#{message}\n\n" unless message.empty?

  puts '1 : Display all animals'
  puts '2 : Display all clients'
  puts '3 : Create an animal'
  puts '4 : Create a client'
  puts '5 : Facilitate client adopts an animal'
  puts '6 : Facilitate client puts animal up for adoption'
  puts "q : Quit\n\n"
  print '--> '
  gets.chomp
end

message = ""
choice = menu(message)
while choice != 'q'
  message = ""
  case choice
  when "1"
    # 1) display all animals
    if shelter.animals.length == 0
      puts " No animals at this moment"
    else  
      puts "The animals presently in #{shelter.name} are: "
      shelter.display_animals
    end  
  when "2"
    message += 'option 2'
    # 1) diplay all clients
    puts " The clients of #{shelter.name} are:"
    shelter.display_clients
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
    toys = []
    while continue
      puts " Enter a toy's name or enter the word Done "
      toy = gets.chomp
      if toy != "Done"
        toys << toy
      else
       continue = false
      end
    end
    #2)create an animal and add it to the shelter with the shelter's 'receive_animal' method
    new_animal = Animal.new(name, age, gender, species, toys)
    shelter.receive_animal(new_animal)
    puts "A #{new_animal.species} named #{new_animal.name} was added to our "\
         "#{shelter.name} shelter"
  when "4"
    message += 'option 4'
    # Create a client
    #1)Prompt user for informations about name, num_of_children, age, num_of_pets
    puts "client's name:"
    name = gets.chomp
    puts "number of children:"
    num_of_children = gets.chomp
    puts "age:"
    age = gets.chomp
    puts  " number of pets:"
    num_of_pets = gets.chomp
    #2)create a client and add to the list of clients of the shelter with method add_client
    new_client = Client.new(name, num_of_children,age, num_of_pets)
    shelter.add_client(new_client)
    puts " A new client named #{new_client.name} was added to our list of clients "
  when "5"
    message += 'option 5'
    # facilitate client adopt an animal
    #1)Show the animals ready for adoption
    if shelter.animals.length == 0
      puts "Sorry, all our animals have been adopted"
    else
     puts "Animals ready for adoption: "
     shelter.display_animals()
    #2) Pick an animal from the shelter's animal's list that will be adopted
     puts "Choose the name of the animal to be adopted."
     puts " Name:"
     chosen_animal_name = gets.chomp
     puts "species:"
     chosen_animal_species = gets.chomp
     chosen_animal = shelter.animals.select do|animal| 
         animal.name == chosen_animal_name && animal.species == chosen_animal_species
     end
     chosen_animal = chosen_animal.first 
     puts "You chose #{chosen_animal.name}"
    #2)Show the clients
     puts "List of possible clients who could adopt #{chosen_animal_name}:"
     shelter.display_clients()
    #4)User picks a client to adopt the animal
     puts "Choose a client to adopt #{chosen_animal.name}"
     name_of_client_who_adopts = gets.chomp
     client_who_adopts = shelter.clients.select do |client| 
         client.name == name_of_client_who_adopts
       end
     client_who_adopts = client_who_adopts.first
     puts "Getting ready to finalize the adoption process of #{chosen_animal.name}..."
    #5) Make the adoption happen (the client adopts, then the shelter givers theshelter and the shelt
    #   shelter gives that animal away
     client_who_adopts.adopt()
     shelter.give_for_adoption(chosen_animal)
     puts  "Everything worked perfectly, #{client_who_adopts.name} has successfully "\
          "adopted #{chosen_animal.name} "
    end
  when "6"
    message += 'option 6'
    # facilitate client puts animal up for adoption
    #1)Ask if a client wants to give an animal for adoption
    puts "A client wants to give an animal for adoption?(y or n)"
    continue = gets.chomp
    #2) If yes, ask for the client's info and for the animal's info
    if continue == "y"
      puts "Name of the client giving an animal for adoption:"
      name_of_client_giving_up_animal = gets.chomp
      giver = shelter.clients.select { |client| client.name == name_of_client_giving_up_animal}
      if giver == []
        puts "We don't have a client named #{name_of_client_giving_up_animal}"
        puts "To accept the animal, #{name_of_client_giving_up_animal} needs to be "\
             "added to our clients' list first. To do so, select 'Create a client' (option 4)."
        puts "Then come back to the option 'facilitate client puts animal for adoption'"  
      elsif giver.length > 1
        puts "please enter the client's age, because the shelter has several clients"
             "named #{giver.name}:"
        age = gets.chomp
        giver = giver.select { |client| client.age == age}.first
      else 
        puts " Information about the animal given for adoption:"
        puts "name:"
        name = gets.chomp
        puts " age:"
        age = gets.chomp
        puts "gender(male or female):"
        gender = gets.chomp
        puts "species:"
        species = gets.chomp
        puts 'for toys, please write the toys one at a time.'
        toy = ''
        toys = []
        while toy != 'Done'
          puts "Toy to be added: (if none are to be added, just enter the word 'Done'"
          toy = gets.chomp
          toys << toy
        end
        new_animal = Animal.new(name, age,gender,species,toys)
        shelter.receive_animal(new_animal)
        puts " Process successful:"
        puts " #{new_animal.name} is now in our #{shelter.name} shelter"
      end
    elsif continue == "n"
        puts "This option doesn't apply since no client is ready for adoption now" 
    else 
      puts "The answer has to be yes or no ( y or n)" 
    end
   

else
  puts "I don't understand"  
end
choice = menu('')
end


    

    






