require_relative 'person'
require_relative 'speech'

module Casting
	class Actor < Person
		attr_accessor :speech
		def initialize (gender, age, speech)
			super gender, age
			@speech = speech
		end
		def to_s
			super + " with #{speech}"
		end
	end
end


sp = Casting::Speech.new 'Title', 'ASd'
act = Casting::Actor.new 'male', 18, sp
puts act


# ~> -:1:in `require_relative': cannot infer basepath (LoadError)
# ~> 	from -:1:in `<main>'
