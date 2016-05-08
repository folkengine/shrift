require 'psych'
require 'shrift'

require_relative('../test_helper')
require_relative('examples/character')

class TestShrift < Minitest::Test
  include Example

  def test_first_form
    first = ['Character', {foo: 20, bar: 10}, 20, 4010, Character]

    dump = Psych.dump(first)
    puts dump

    assert true
  end
end
