
class Shelter
	attr_accessor :name, :clients, :animals

	def initialize(name)
		@name = name
		@clients = []
		@animals = []
	end

	def display_clients
		@clients.each do|client|
			children_or_child = client.num_of_children.to_i > 1 ? "children" : "child"
			pets_or_pet = client.num_of_pets.to_i ? "pets" : "pet"
		  puts "[#{client.name}, #{client.num_of_children} #{children_or_child},"\
		       " #{client.age} years old, #{client.num_of_pets} #{pets_or_pet}]"
	  end
	end

	def display_animals 
		@animals.each do|animal|
		puts "[#{animal.name}, #{animal.age}, #{animal.gender}, #{animal.species}]"
		  end
	end

	def receive_animal(animal)
		@animals << animal
	end

	def add_client(client)
		@clients << client
	end

	def give_for_adoption(animal)
		if @animals.include?(animal)
		  @animals.delete(animal)
	  else 
		puts "There must have been a mistake: there is no #{animal.species} named #{animal.name}\ 
		     in our shelter"
		end
  end
end
