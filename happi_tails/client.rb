class Client 
  
  attr_accessor :name, :num_of_children, :age, :num_of_pets

	def initialize(name, num_of_children, age, num_of_pets)
		@name = name
		@num_of_children = num_of_children
		@age = age
		@num_of_pets = num_of_pets.to_i
end

  def adopt()
  	@num_of_pets += 1
  end

  def give_for_adoption()
  	@num_of_pets -= 1
  end


end