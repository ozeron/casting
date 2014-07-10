module Casting
	class Speech
		attr_accessor :title, :text
		def initialize( title,  text)
			@title = ( title.nil? ?  "" : title )
			@text = ( text.nil? ? "" : text )
		end
		def length
			@title.length + @text.length
		end
	end
end

