
Phase 1

Can create animals and clients
=end
class Shelter

 @@clients = []
 @@animals = []

	def initialize(name)
		@name = name
	end

	def display_clients()
		puts @@clients
  end

	def diplay_animals()
		puts @@animals
	end

	def receive_animal(animal)
		@@animal << animal
	end

	def get_client(client)
		@@clients << client
	end

	def give_for_adoption(animal)
		if @@animals.include?(animal)
		@@animals.delete(animal)
	else 
		puts "There must have been a mistake: there is no #{animal.species} named #{animal.name} 
		     in our shelter"
	end
end
