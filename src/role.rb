module Casting
	class Role
		def initialize ( gender, range)
			@gender = gender.to_sym
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
			"Looking for #{gender.to_s} in #{range} years_old"
		end
	end # !> mismatched indentations at 'end' with 'def' at 16
end # !> mismatched indentations at 'end' with 'class' at 2
# ~> -:19: syntax error, unexpected end-of-input, expecting keyword_end
