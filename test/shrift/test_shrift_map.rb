require 'psych'
require 'shrift'

require_relative('../test_helper')
require_relative('examples/character')

class TestShriftMap < Minitest::Test
  include Shrift

  def test_default
    default_value = 10
    shrift_map = ShriftMap.new('', default_value)
    assert_equal(shrift_map.default, default_value)
  end

  def test_first_form

    shrift_map = ShriftMap.new('')
    shrift_map.add({s: 'strength'})

    first = ['Character', {foo: 20, bar: 10}, 20, 4010, Example::Character]

    dump = Psych.dump(first)
    puts dump

    assert true
  end
end
