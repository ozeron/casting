

module Casting
	class Person
		attr_reader :age, :gender
		def initialize( gender, age)
			if gender.to_sym[0].downcase == 'm'
				@gender = :male
			else
				@gender = :woman
			end
			@age = age
		end
		def is_man?
			@gender[0] == 'm'
		end
		def is_woman?
			!is_man?
		end
		def to_s
			"#{gender.to_s.capitalize} in age of #{age}"
		end
	end
end


