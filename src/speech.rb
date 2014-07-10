module Casting
	class Speech
		attr_accessor :title, :text
		def initialize( title,  text = nil)
			@title = ( title.nil? ?  "" : title )
			@text = ( text.nil? ? "" : text )
		end
		def length
			@title.length + @text.length
		end
		def to_s
			"'#{@title}'|#{@text}"
		end
		def ==(other)
			@title == other.title && @text == other.text
		end
		alias_method :eql?, :==
		alias_method :size, :length
	end
end

