require_relative 'person'
require_relative 'actor'

module Casting 
	class Judje < Person
		def rate( actor)
			if self.is_woman? && actor.is_man? && actor.speech.length <= 30  
				return Random.new.rand(0..7)
			end
			if self.is_man? && actor.is_woman? && actor.age.between?(18,25)
				return Random.new.rand(7..10)
			end
			Random.new.rand(0..10)
		end
	end	
end
