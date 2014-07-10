require 'minitest/autorun'
require_relative '../src/judje'

class JudjeTest < MiniTest::Unit::TestCase
	def setup
		@man_j = Casting::Judje.new :male, 16
		@woman_j = Casting::Judje.new :w, 23
		@speech_short = Casting::Speech.new "That's ", "All!"
		@speech_ok = Casting::Speech.new "Ruby for Dummies", "You not so bad.Better check this out 'Eloquent Ruby'"
		
		@act_m1 = Casting::Actor.new :m, 20, @speech_short 
		@act_m2 = Casting::Actor.new :m, 20, @speech_ok

		@act_w1 = Casting::Actor.new :w, 20, @speech_ok
		@act_w2 = Casting::Actor.new :w, 40, @speech_ok
	end

	def test_rate
		for i in 0..50 do
			assert @man_j.rate(@act_m1).between?(0,10)
			assert @man_j.rate(@act_m2).between?(0,10)
			assert @man_j.rate(@act_w1).between?(7,10)
			assert @man_j.rate(@act_w2).between?(0,10)

			assert @woman_j.rate(@act_m1).between?(0,7)
			assert @woman_j.rate(@act_m2).between?(0,10)
			assert @woman_j.rate(@act_w1).between?(0,10)
			assert @woman_j.rate(@act_w2).between?(0,10)
		end	
	end
end
