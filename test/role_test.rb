require 'minitest/autorun'
require_relative '../src/role'
require_relative '../src/person'

class RoleTest < MiniTest::Unit::TestCase
	def setup
		@mans = Casting::Role.new :male, 18..40
		@womans =Casting::Role.new 'woman', 18..25
		@persons = [
					Casting::Person.new(:male, 20),
					Casting::Person.new( 'male', 45),
					Casting::Person.new( 'm', 17),
					Casting::Person.new( :woman, 26),
					Casting::Person.new( 'woman', 19),
					Casting::Person.new( 'female', 17)
		]
	end
	def test_if_exist
		assert_kind_of Casting::Role, @mans
	end
	def test_is_for_man?
		assert @mans.is_for_man?
		refute @womans.is_for_man?, "Woman's role isn't for man."
	end
	def test_is_for_woman?
		refute @mans.is_for_woman?, "Man's role isn't for woman."
		assert @womans.is_for_woman?
	end
	def test_is_good_for?
		assert @mans.is_good_for? @persons[0]		
		refute @mans.is_good_for? @persons[1]
		refute @mans.is_good_for? @persons[2]
		refute @mans.is_good_for? @persons[3]
		refute @mans.is_good_for? @persons[4]
		refute @mans.is_good_for? @persons[5]
		refute @mans.is_good_for? @persons[6]

		refute @womans.is_good_for? @persons[0]		
		refute @womans.is_good_for? @persons[1]
		refute @womans.is_good_for? @persons[2]
		refute @womans.is_good_for? @persons[3]
		assert @womans.is_good_for? @persons[4]
		refute @womans.is_good_for? @persons[5]
		refute @womans.is_good_for? @persons[6]
	end
end
