module Casting
	class Role
		def initialize ( gender, range)
			if gender.to_sym[0].downcase == 'm'
				@gender = :male
			else
				@gender = :woman
			end
			@range = range
		end
		def is_for_man?
			@gender[0] == 'm'
		end
		def is_for_woman?
			! is_for_man?
		end
		def is_good_for?( person )
			!person.nil? && (person.gender[0] == @gender[0]) && @range.include?(person.age)
		end
		def to_s()
			"Looking for #{@gender.to_s} #{@range.to_s} years old"
		end
	end
end
