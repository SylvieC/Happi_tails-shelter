class Client 
  
	def initialize(name, num_of_children, age, num_of_pets)
		@name = name
		@num_of_children = num_of_children
		@age = age
		@num_of_pets = num_of_pets
end

  def adopt(animal)
  	@num_of_pets += 1
  end

  def give_for_adoption(animal)
  	@num_of_pets-=1
  end
end