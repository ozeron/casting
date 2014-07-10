require 'minitest/autorun'
require_relative '../src/person'

class PersonTest < MiniTest::Unit::TestCase
	def setup
		@person = Casting::Person.new 'male', 18
	end
 	def test_it_exist  	
   	assert_kind_of Casting::Person, @person
  end
end
