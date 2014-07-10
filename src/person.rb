

module Casting
	class Person
		attr_reader :age, :gender
		def initialize( gender, age)
			@gender = gender
			@age = age
		end
		def is_man?
			@gender[0] == 'm'
		end
		def is_woman?
			!is_man?
		end
	end
end


