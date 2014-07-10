require_relative 'role'
require_relative 'judje'

module Casting 
	class  Core
		attr_accessor :judjes, :roles, :actors

		def initialize (judjes=nil, roles=nil, actors=nil)
			@judjes = judjes
			@roles = roles
			@actors = actors
		end

		def cast( actor )
			result = {}
			roles.each do |role|
				if role.is_good_for?( actor ) 
					avg_rating = 0.0
					avg_length = actor.speech.length * judjes.size
					judjes.each do |judje|
						avg_rating += judje.rate( actor ).to_f / judjes.size 
					end
					result[role] = [avg_rating, avg_length]
				end
			end if !roles.nil?
			result
		end
		def quanity_for (actor)
			cast(	actor ).size
		end
		def best_role_for (actor, multiple = false)
			hash = cast(actor)
			hash.sort_by{|_, value| value[0]}.reverse
			if multiple
				return hash.keys[0], hash.values[0]
			end
			hash.keys[0]	
		end

		def cast_time (actor)
			hash = cast(actor)
			hash.size*@judjes.size*actor.speech.length
		end
	end
end
# ~> -:1:in `require_relative': cannot infer basepath (LoadError)
# ~> 	from -:1:in `<main>'
