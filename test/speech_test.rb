require 'minitest/autorun'
require_relative '../src/speech'

class SpeechTest < MiniTest::Unit::TestCase
	def setup
		@title1 = "Star Wars"
		@title2 = "Ruby for Dummies"
		@text1 = "Long time ago far away galaxy..."
		@text2 = "You not so bad.Better check this out 'Eloquent Ruby'"

		@speech1 = Casting::Speech.new @title1, @text1
		@speech2 = Casting::Speech.new @title2, @text2
		@speech3 = nil

		@speech1_length = @title1.size + @text1.size
		@speech2_length = @title2.size + @text2.size
	end

	def test_if_exist?
		assert_kind_of  Casting::Speech, @speech1
		refute_kind_of Casting::Speech, @speech3
	end

	def test_title
		assert_equal @title1, @speech1.title
		assert_equal @title2, @speech2.title
	end

	def test_length
		assert_equal (@text1 + @title1).size, @speech1.length
		assert_equal (@text2 + @title2).size, @speech2.length
	end
end
