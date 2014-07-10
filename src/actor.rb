require_relative 'person'
require_relative 'speech'

module Casting
	class Actor < Person
		attr_accessor :speech
		def initialize (gender, age, speech, additional=nil)
			super gender, age
			if additional.nil?
				@speech = speech
			else
				@speech = Speech.new speech, additional
			end
		end
		def to_s
			super + " and speech:\n#{speech}"
		end
	end
end


# ~> -:1:in `require_relative': cannot infer basepath (LoadError)
# ~> 	from -:1:in `<main>'
