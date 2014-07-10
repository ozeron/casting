

module Casting
	class Person
		attr_reader :age, :gender
		def initialize( gender, age)
			@gender = gender
			@age = age
		end
	end
end


