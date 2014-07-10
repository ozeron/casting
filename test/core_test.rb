require 'minitest/autorun'
require_relative '../src/core'

class PersonTest < MiniTest::Unit::TestCase
	def setup
		@judjes = [
			Casting::Judje.new( :man, 24 ),
			Casting::Judje.new( :man, 30 ),
			Casting::Judje.new( :man, 45 ),
			Casting::Judje.new( :woman, 29 ),
			Casting::Judje.new( :woman, 27 )
		]
		@roles = [
			Casting::Role.new( :man, 18..25),
			Casting::Role.new( :man, 23..27),
			Casting::Role.new( :man, 25..45),
			Casting::Role.new( :woman, 18..23),
			Casting::Role.new( :woman, 25..30),
			Casting::Role.new( :woman, 20..27),
		]
		@speeches = [
			Casting::Speech.new( "Star Wars", "Long time ago far away galaxy..."),
			Casting::Speech.new("Ruby for Dummies", "You not so bad.Better check this out 'Eloquent Ruby'"),
			Casting::Speech.new("Short",".")
		]
		@actors = [
			Casting::Actor.new( :man, 16, @speeches[0]),
			Casting::Actor.new( :man, 20, @speeches[1]),
			Casting::Actor.new( :man, 26, @speeches[2]),
			Casting::Actor.new( :man, 40, @speeches[2]),
			Casting::Actor.new( :man, 49, @speeches[1]),


			Casting::Actor.new( :woman, 17, @speeches[2]),
			Casting::Actor.new( :woman, 20, @speeches[2]),
			Casting::Actor.new( :woman, 24, @speeches[2]),
			Casting::Actor.new( :woman, 29, @speeches[2]),
			Casting::Actor.new( :woman, 45, @speeches[2])
		]
		@sys = Casting::Core.new @judjes, @roles, @actors
	end

	def test_cast
		assert_equal @sys.cast(@actors[0]).size, 0
		assert_equal @sys.cast(@actors[1]).size, 1
		assert_equal @sys.cast(@actors[2]).size, 2
		assert_equal @sys.cast(@actors[3]).size, 1
		assert_equal @sys.cast(@actors[4]).size, 0

		assert_equal @sys.cast(@actors[5]).size, 0
		assert_equal @sys.cast(@actors[6]).size, 2
		assert_equal @sys.cast(@actors[7]).size, 1
		assert_equal @sys.cast(@actors[8]).size, 1
		assert_equal @sys.cast(@actors[9]).size, 0
	end

	def test_cast_time
		j_s = @judjes.size
		@actors.each_with_index do |actor,i|
			assert_equal @sys.cast_time(actor), j_s*@sys.quanity_for(actor)*actor.speech.size, "№#{i}"
		end
	end
end
# ~> -:2:in `require_relative': cannot infer basepath (LoadError)
# ~> 	from -:2:in `<main>'
