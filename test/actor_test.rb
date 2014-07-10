require 'minitest/autorun'
require_relative '../src/actor'

class ActorTest < MiniTest::Unit::TestCase
	def setup
		@speech = Casting::Speech.new "Great Title", "Great Text"
		@actor = Casting::Actor.new :m, 20, @speech
	end
	def test_new_initialize
		title = "Thats "
		text = "it!"
		@act = Casting::Actor.new :f,18, title, text
		assert_equal @act.speech, Casting::Speech.new( title,text)
	end
	def test_speech
		assert_equal @speech, @actor.speech
	end
	def test_gender
		assert_equal :male, @actor.gender
	end
end

